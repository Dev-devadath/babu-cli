package config

import (
	"os"
	"path/filepath"
	"testing"
)

func TestRead_EmptyFileReturnsEmptyConfig(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.json")
	if err := os.WriteFile(path, []byte{}, 0o600); err != nil {
		t.Fatalf("os.WriteFile() error = %v", err)
	}

	cfg, err := Read(path)
	if err != nil {
		t.Fatalf("Read() error = %v", err)
	}
	if cfg.DefaultProfile != "" {
		t.Fatalf("DefaultProfile = %q, want empty", cfg.DefaultProfile)
	}
	if len(cfg.Profiles) != 0 {
		t.Fatalf("Profiles length = %d, want 0", len(cfg.Profiles))
	}
}

func TestRead_WhitespaceFileReturnsEmptyConfig(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.json")
	if err := os.WriteFile(path, []byte(" \n\t "), 0o600); err != nil {
		t.Fatalf("os.WriteFile() error = %v", err)
	}

	cfg, err := Read(path)
	if err != nil {
		t.Fatalf("Read() error = %v", err)
	}
	if cfg.DefaultProfile != "" {
		t.Fatalf("DefaultProfile = %q, want empty", cfg.DefaultProfile)
	}
	if len(cfg.Profiles) != 0 {
		t.Fatalf("Profiles length = %d, want 0", len(cfg.Profiles))
	}
}

func TestRead_BOMOnlyFileReturnsEmptyConfig(t *testing.T) {
	path := filepath.Join(t.TempDir(), "config.json")
	if err := os.WriteFile(path, []byte{0xEF, 0xBB, 0xBF}, 0o600); err != nil {
		t.Fatalf("os.WriteFile() error = %v", err)
	}

	cfg, err := Read(path)
	if err != nil {
		t.Fatalf("Read() error = %v", err)
	}
	if cfg.DefaultProfile != "" {
		t.Fatalf("DefaultProfile = %q, want empty", cfg.DefaultProfile)
	}
	if len(cfg.Profiles) != 0 {
		t.Fatalf("Profiles length = %d, want 0", len(cfg.Profiles))
	}
}
