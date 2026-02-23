package main

import (
	"errors"
	"fmt"
	"sort"
	"strconv"
	"strings"

	"github.com/Dev-devadath/babu-cli/internal/printer"
)

type amsMode string

const (
	amsModeAuto amsMode = "auto"
	amsModeOn   amsMode = "on"
	amsModeOff  amsMode = "off"
)

func parseAMSMode(raw string) (amsMode, error) {
	switch strings.ToLower(strings.TrimSpace(raw)) {
	case "", string(amsModeAuto):
		return amsModeAuto, nil
	case string(amsModeOn), "true", "1":
		return amsModeOn, nil
	case string(amsModeOff), "false", "0":
		return amsModeOff, nil
	default:
		return "", fmt.Errorf("invalid --ams value %q (expected auto|on|off)", raw)
	}
}

func resolvePrintAMSSettings(res ResolvedPrinter, mode amsMode, noAMS bool, mappingCSV string) (bool, []int, error) {
	if noAMS {
		if mode == amsModeOn {
			return false, nil, errors.New("cannot combine --no-ams with --ams on")
		}
		return false, []int{0}, nil
	}

	mappingOverride, err := parseOptionalIntList(mappingCSV)
	if err != nil {
		return false, nil, err
	}

	switch mode {
	case amsModeOff:
		return false, []int{0}, nil
	case amsModeOn:
		if len(mappingOverride) > 0 {
			return true, mappingOverride, nil
		}
		return true, []int{0}, nil
	case amsModeAuto:
		amsInfo, err := fetchAMSInfo(res)
		if err != nil {
			return false, nil, fmt.Errorf("ams auto preflight failed: %w", err)
		}
		return resolveAutoAMSFromInfo(amsInfo, mappingOverride)
	default:
		return false, nil, fmt.Errorf("unsupported AMS mode %q", mode)
	}
}

func parseOptionalIntList(s string) ([]int, error) {
	if strings.TrimSpace(s) == "" {
		return nil, nil
	}
	return parseIntList(s)
}

func fetchAMSInfo(res ResolvedPrinter) (map[string]any, error) {
	client, err := printer.NewMQTTClient(res.IP, res.AccessCode, res.Serial, res.Username, res.MQTTPort, res.Timeout)
	if err != nil {
		return nil, err
	}
	defer client.Close()

	if err := client.PushAll(); err != nil {
		return nil, err
	}
	if err := client.WaitForData(res.Timeout); err != nil {
		return nil, err
	}

	raw, ok := client.Get("print", "ams")
	if !ok {
		return nil, nil
	}
	info, ok := raw.(map[string]any)
	if !ok {
		return nil, nil
	}
	return info, nil
}

func resolveAutoAMSFromInfo(amsInfo map[string]any, mappingOverride []int) (bool, []int, error) {
	if !isAMSConnected(amsInfo) {
		return false, []int{0}, nil
	}
	if len(mappingOverride) > 0 {
		return true, mappingOverride, nil
	}

	mapping := autoDetectAMSMapping(amsInfo)
	if len(mapping) == 0 {
		return false, nil, errors.New("AMS detected but no loaded tray could be identified; use --ams-mapping or --ams off")
	}
	return true, mapping, nil
}

func isAMSConnected(amsInfo map[string]any) bool {
	if len(amsInfo) == 0 {
		return false
	}
	if bits, ok := parseBitset(amsInfo["ams_exist_bits"]); ok && bits > 0 {
		return true
	}
	if bits, ok := parseBitset(amsInfo["tray_exist_bits"]); ok && bits > 0 {
		return true
	}
	amsList, ok := amsInfo["ams"].([]any)
	return ok && len(amsList) > 0
}

func autoDetectAMSMapping(amsInfo map[string]any) []int {
	if mapping := trayIDsFromExistBits(amsInfo); len(mapping) > 0 {
		return mapping
	}

	if mapping := trayIDsFromTrayList(amsInfo); len(mapping) > 0 {
		return mapping
	}

	ids := map[int]struct{}{}
	for _, key := range []string{"tray_now", "tray_tar", "tray_pre"} {
		if id, ok := parseAnyInt(amsInfo[key]); ok && id >= 0 && id != 255 {
			ids[id] = struct{}{}
		}
	}
	return sortedTrayIDs(ids)
}

func trayIDsFromExistBits(amsInfo map[string]any) []int {
	bits, ok := parseBitset(amsInfo["tray_exist_bits"])
	if !ok || bits == 0 {
		return nil
	}
	ids := map[int]struct{}{}
	for i := 0; i < 32; i++ {
		if bits&(1<<i) != 0 {
			ids[i] = struct{}{}
		}
	}
	return sortedTrayIDs(ids)
}

func parseBitset(v any) (uint64, bool) {
	switch t := v.(type) {
	case int:
		if t < 0 {
			return 0, false
		}
		return uint64(t), true
	case int64:
		if t < 0 {
			return 0, false
		}
		return uint64(t), true
	case float64:
		if t < 0 {
			return 0, false
		}
		return uint64(t), true
	case string:
		s := strings.TrimSpace(t)
		if s == "" {
			return 0, false
		}
		if strings.HasPrefix(s, "0b") || strings.HasPrefix(s, "0B") {
			n, err := strconv.ParseUint(s[2:], 2, 64)
			if err != nil {
				return 0, false
			}
			return n, true
		}
		n, err := strconv.ParseUint(s, 0, 64)
		if err == nil {
			return n, true
		}
		if isBinaryDigits(s) {
			n, err = strconv.ParseUint(s, 2, 64)
			if err == nil {
				return n, true
			}
		}
		return 0, false
	default:
		return 0, false
	}
}

func isBinaryDigits(s string) bool {
	if s == "" {
		return false
	}
	for _, r := range s {
		if r != '0' && r != '1' {
			return false
		}
	}
	return true
}

func trayIDsFromTrayList(amsInfo map[string]any) []int {
	amsList, ok := amsInfo["ams"].([]any)
	if !ok {
		return nil
	}

	loaded := map[int]struct{}{}
	all := map[int]struct{}{}
	for _, unit := range amsList {
		u, ok := unit.(map[string]any)
		if !ok {
			continue
		}
		trays, ok := u["tray"].([]any)
		if !ok {
			continue
		}
		for _, tray := range trays {
			t, ok := tray.(map[string]any)
			if !ok {
				continue
			}
			id, ok := parseAnyInt(t["id"])
			if !ok || id < 0 || id == 255 {
				continue
			}
			all[id] = struct{}{}
			if trayLikelyLoaded(t) {
				loaded[id] = struct{}{}
			}
		}
	}

	if len(loaded) > 0 {
		return sortedTrayIDs(loaded)
	}
	if len(all) == 1 {
		return sortedTrayIDs(all)
	}
	return nil
}

func trayLikelyLoaded(tray map[string]any) bool {
	for _, key := range []string{"has_filament", "filament_exists", "tray_exist", "exist", "is_exists"} {
		if b, ok := parseAnyBool(tray[key]); ok {
			return b
		}
	}

	if remaining, ok := parseAnyInt(tray["remain"]); ok {
		return remaining > 0
	}

	for _, key := range []string{"tray_type", "tray_sub_brands", "tray_info_idx", "tag_uid"} {
		if isMeaningfulFilamentValue(tray[key]) {
			return true
		}
	}
	return false
}

func isMeaningfulFilamentValue(v any) bool {
	switch t := v.(type) {
	case nil:
		return false
	case string:
		s := strings.ToLower(strings.TrimSpace(t))
		if s == "" {
			return false
		}
		if s == "0" || s == "none" || s == "null" || s == "unknown" || s == "-" || s == "255" {
			return false
		}
		if strings.Contains(s, "empty") {
			return false
		}
		return true
	default:
		if n, ok := parseAnyInt(v); ok {
			return n > 0
		}
		return false
	}
}

func parseAnyInt(v any) (int, bool) {
	switch t := v.(type) {
	case int:
		return t, true
	case int64:
		return int(t), true
	case float64:
		return int(t), true
	case string:
		s := strings.TrimSpace(t)
		if s == "" {
			return 0, false
		}
		n, err := strconv.Atoi(s)
		if err != nil {
			return 0, false
		}
		return n, true
	default:
		return 0, false
	}
}

func parseAnyBool(v any) (bool, bool) {
	switch t := v.(type) {
	case bool:
		return t, true
	case string:
		s := strings.ToLower(strings.TrimSpace(t))
		switch s {
		case "true", "1", "yes", "on":
			return true, true
		case "false", "0", "no", "off":
			return false, true
		default:
			return false, false
		}
	case int:
		return t != 0, true
	case int64:
		return t != 0, true
	case float64:
		return t != 0, true
	default:
		return false, false
	}
}

func sortedTrayIDs(ids map[int]struct{}) []int {
	out := make([]int, 0, len(ids))
	for id := range ids {
		out = append(out, id)
	}
	sort.Ints(out)
	return out
}
