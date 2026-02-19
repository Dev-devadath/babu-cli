# babu-cli

CLI for controlling BambuLab printers directly over MQTT/FTPS/camera.

## Install

### Using Go install

```bash
go install github.com/Dev-devadath/babu-cli/cmd/babu-cli@latest
```

If `@latest` resolves to an older commit, use:

```bash
GOPROXY=direct go install github.com/Dev-devadath/babu-cli/cmd/babu-cli@master
```

or pin a commit:

```bash
GOPROXY=direct go install github.com/Dev-devadath/babu-cli/cmd/babu-cli@<commit>
```

### macOS setup

```bash
# 1) Install Go (if needed)
brew install go

# 2) Install babu-cli
go install github.com/Dev-devadath/babu-cli/cmd/babu-cli@latest

# 3) Add Go bin to PATH
echo 'export PATH="$PATH:$(go env GOPATH)/bin"' >> ~/.zshrc
source ~/.zshrc
hash -r

# 4) Verify
which babu-cli
babu-cli --help
```

If you use `GOBIN`, add that path instead of `$(go env GOPATH)/bin`.

### Download pre-built binaries

Download the latest release from [GitHub Releases](https://github.com/Dev-devadath/babu-cli/releases) and extract the binary for your platform.

### Build from source

```bash
go build -o babu-cli ./cmd/babu-cli
```

## Quick start

```bash
# Create a profile
babu-cli config set --printer lab \
  --ip 192.168.1.200 \
  --serial AC12309BH109 \
  --access-code-file ~/.config/bambu/lab.code \
  --default

# Status
babu-cli status

# Start a print
babu-cli print start ./benchy.3mf --plate 1
```

## Config

- User config: `<os.UserConfigDir>/bambu/config.json`
  - macOS usually: `~/Library/Application Support/bambu/config.json`
  - Linux usually: `~/.config/bambu/config.json`
  - Windows usually: `%AppData%\bambu\config.json`
- Project config: `./.bambu.json`
- Precedence: flags > env > project config > user config
- Missing config file is treated as empty; it is created on first `config set`.

### Expected config format

`babu-cli` expects `default_profile` + `profiles`. Example:

```json
{
  "default_profile": "lab",
  "profiles": {
    "lab": {
      "ip": "192.168.11.234",
      "serial": "0300DA610705389",
      "access_code_file": "/absolute/path/to/lab.code"
    }
  }
}
```

Note: configs using `machines`, `token`, etc. are from other tools and are not read by `babu-cli`.

### Access code

Get the printer access code from the device or Bambu Studio, then store it in a file:

```bash
mkdir -p ~/.config/bambu
printf "%s" "YOUR_ACCESS_CODE" > ~/.config/bambu/lab.code
chmod 600 ~/.config/bambu/lab.code
```

In Bambu Studio on macOS: open the Device view for your printer, open its settings, and look for "LAN Access" or "Access Code" (often shown alongside IP/serial details).

### Env vars

- `BAMBU_PROFILE`
- `BAMBU_IP`
- `BAMBU_SERIAL`
- `BAMBU_ACCESS_CODE_FILE`
- `BAMBU_TIMEOUT`
- `BAMBU_NO_CAMERA`
- `BAMBU_MQTT_PORT`
- `BAMBU_FTP_PORT`
- `BAMBU_CAMERA_PORT`

## Troubleshooting

### `zsh: command not found: babu-cli`

`go install` likely succeeded but your shell `PATH` does not include Go bin.

```bash
go env GOBIN
go env GOPATH
ls -l "$(go env GOPATH)/bin" | grep babu-cli
```

Then add the correct bin path to `PATH` in `~/.zshrc`.

### `access code file not set`

This means no access code source was resolved for the active profile.

Resolution order:
- `--access-code-file`
- `BAMBU_ACCESS_CODE_FILE`
- `profiles.<name>.access_code_file`

Profile selection order:
- `--printer`
- `BAMBU_PROFILE`
- `default_profile`

Set it explicitly:

```bash
babu-cli config set --printer lab --access-code-file ~/.config/bambu/lab.code --default
```

### Print starts but pauses with filament errors

If the job starts heating/extruding and then pauses with filament-related prompts, check AMS mode.

- Default behavior uses AMS (`--no-ams` not set).
- `--no-ams` disables AMS usage for that print and may skip AMS-related filament validation/check flows.

Use `--no-ams` only when printing from an external spool/manual feed path that matches your loaded filament.

## Notes

- Printer must be reachable on ports 8883 (MQTT), 990 (FTPS), 6000 (camera).
- Avoid passing access codes via flags; use `--access-code-file` or `--access-code-stdin`.
