package main

import (
	"os"
	"path/filepath"
	"reflect"
	"testing"

	"github.com/Dev-devadath/babu-cli/internal/config"
)

func TestParseAMSMode(t *testing.T) {
	tests := []struct {
		in      string
		want    amsMode
		wantErr bool
	}{
		{in: "auto", want: amsModeAuto},
		{in: "on", want: amsModeOn},
		{in: "off", want: amsModeOff},
		{in: "true", want: amsModeOn},
		{in: "0", want: amsModeOff},
		{in: "", want: amsModeAuto},
		{in: "wat", wantErr: true},
	}

	for _, tc := range tests {
		got, err := parseAMSMode(tc.in)
		if tc.wantErr {
			if err == nil {
				t.Fatalf("parseAMSMode(%q): expected error", tc.in)
			}
			continue
		}
		if err != nil {
			t.Fatalf("parseAMSMode(%q): unexpected error: %v", tc.in, err)
		}
		if got != tc.want {
			t.Fatalf("parseAMSMode(%q): got %q, want %q", tc.in, got, tc.want)
		}
	}
}

func TestResolveAutoAMSFromInfo_NoAMS(t *testing.T) {
	useAMS, mapping, err := resolveAutoAMSFromInfo(map[string]any{
		"ams_exist_bits":  "0",
		"tray_exist_bits": "0",
	}, nil)
	if err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	if useAMS {
		t.Fatalf("expected useAMS=false, got true")
	}
	if !reflect.DeepEqual(mapping, []int{0}) {
		t.Fatalf("unexpected mapping: %#v", mapping)
	}
}

func TestResolveAutoAMSFromInfo_UsesTrayExistBits(t *testing.T) {
	useAMS, mapping, err := resolveAutoAMSFromInfo(map[string]any{
		"ams_exist_bits":  "1",
		"tray_exist_bits": "2",
	}, nil)
	if err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	if !useAMS {
		t.Fatalf("expected useAMS=true, got false")
	}
	if !reflect.DeepEqual(mapping, []int{1}) {
		t.Fatalf("unexpected mapping: %#v", mapping)
	}
}

func TestResolveAutoAMSFromInfo_UsesTrayListHeuristic(t *testing.T) {
	useAMS, mapping, err := resolveAutoAMSFromInfo(map[string]any{
		"ams_exist_bits": "1",
		"ams": []any{
			map[string]any{
				"id": "0",
				"tray": []any{
					map[string]any{"id": "0", "tray_type": "PLA"},
					map[string]any{"id": "1", "tray_type": "Empty"},
					map[string]any{"id": "2", "tray_type": "0"},
				},
			},
		},
	}, nil)
	if err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	if !useAMS {
		t.Fatalf("expected useAMS=true, got false")
	}
	if !reflect.DeepEqual(mapping, []int{0}) {
		t.Fatalf("unexpected mapping: %#v", mapping)
	}
}

func TestResolveAutoAMSFromInfo_MappingOverride(t *testing.T) {
	useAMS, mapping, err := resolveAutoAMSFromInfo(map[string]any{
		"ams_exist_bits":  "1",
		"tray_exist_bits": "8",
	}, []int{3})
	if err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	if !useAMS {
		t.Fatalf("expected useAMS=true, got false")
	}
	if !reflect.DeepEqual(mapping, []int{3}) {
		t.Fatalf("unexpected mapping: %#v", mapping)
	}
}

func TestResolveAutoAMSFromInfo_FailsWhenConnectedButUnknown(t *testing.T) {
	_, _, err := resolveAutoAMSFromInfo(map[string]any{
		"ams_exist_bits": "1",
		"ams": []any{
			map[string]any{
				"id": "0",
				"tray": []any{
					map[string]any{"id": "0"},
					map[string]any{"id": "1"},
				},
			},
		},
	}, nil)
	if err == nil {
		t.Fatal("expected error, got nil")
	}
}

func TestResolvePrintAMSSettings_NoAMSConflictsWithOn(t *testing.T) {
	_, _, err := resolvePrintAMSSettings(ResolvedPrinter{}, amsModeOn, true, "")
	if err == nil {
		t.Fatal("expected conflict error, got nil")
	}
}

func TestCmdConfigSetCreatesDefaultProfileFromMinimalInputs(t *testing.T) {
	t.Setenv("BAMBU_PROFILE", "")

	cfgPath := filepath.Join(t.TempDir(), "config.json")
	rc := cmdConfigSet(GlobalFlags{ConfigPath: cfgPath}, []string{
		"--ip", "192.168.1.200",
		"--serial", "AC12309BH109",
		"--access-code", "MYCODE",
	})
	if rc != 0 {
		t.Fatalf("cmdConfigSet() = %d, want 0", rc)
	}

	cfg, err := config.Read(cfgPath)
	if err != nil {
		t.Fatalf("config.Read() error = %v", err)
	}

	if cfg.DefaultProfile != "default" {
		t.Fatalf("DefaultProfile = %q, want %q", cfg.DefaultProfile, "default")
	}

	p, ok := cfg.Profiles["default"]
	if !ok {
		t.Fatalf("expected profile %q", "default")
	}
	if p.IP != "192.168.1.200" {
		t.Fatalf("IP = %q, want %q", p.IP, "192.168.1.200")
	}
	if p.Serial != "AC12309BH109" {
		t.Fatalf("Serial = %q, want %q", p.Serial, "AC12309BH109")
	}
	if p.AccessCode != "MYCODE" {
		t.Fatalf("AccessCode = %q, want %q", p.AccessCode, "MYCODE")
	}
	if p.AccessCodeFile != "" {
		t.Fatalf("AccessCodeFile = %q, want empty", p.AccessCodeFile)
	}
}

func TestCmdConfigSetRequiresIPSerialAndAccessCodeForNewProfile(t *testing.T) {
	t.Setenv("BAMBU_PROFILE", "")

	cfgPath := filepath.Join(t.TempDir(), "config.json")
	rc := cmdConfigSet(GlobalFlags{ConfigPath: cfgPath}, []string{
		"--ip", "192.168.1.200",
	})
	if rc != 1 {
		t.Fatalf("cmdConfigSet() = %d, want 1", rc)
	}
}

func TestResolvePrinterPrefersAccessCodeFileFlagOverProfileAccessCode(t *testing.T) {
	t.Setenv("BAMBU_PROFILE", "")
	t.Setenv("BAMBU_ACCESS_CODE", "")
	t.Setenv("BAMBU_ACCESS_CODE_FILE", "")

	tmpDir := t.TempDir()
	cfgPath := filepath.Join(tmpDir, "config.json")
	accessCodePath := filepath.Join(tmpDir, "access.code")

	if err := os.WriteFile(accessCodePath, []byte("FILECODE\n"), 0o600); err != nil {
		t.Fatalf("os.WriteFile() error = %v", err)
	}

	cfg := config.Config{
		DefaultProfile: "default",
		Profiles: map[string]config.Profile{
			"default": {
				IP:         "192.168.1.200",
				Serial:     "AC12309BH109",
				AccessCode: "PROFILECODE",
			},
		},
	}
	if err := config.Save(cfgPath, cfg); err != nil {
		t.Fatalf("config.Save() error = %v", err)
	}

	res, err := resolvePrinter(GlobalFlags{
		ConfigPath:     cfgPath,
		AccessCodeFile: accessCodePath,
	}, true, true)
	if err != nil {
		t.Fatalf("resolvePrinter() error = %v", err)
	}
	if res.AccessCode != "FILECODE" {
		t.Fatalf("AccessCode = %q, want %q", res.AccessCode, "FILECODE")
	}
}
