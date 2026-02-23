package main

import (
	"reflect"
	"testing"
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
