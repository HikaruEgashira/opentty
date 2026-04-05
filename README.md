# opentty

Open text files and folders in your terminal emulator from Finder.

- **Text files** → opens in your terminal with a pager (e.g. `bat`)
- **Folders** → opens a new terminal session at that directory

## Install

```bash
make install
```

This builds `opentty.app` into `~/Applications/` and sets it as the default handler for text files and folders.

## Uninstall

```bash
make uninstall
```

## Configuration

Edit `~/.config/opentty/config` to customize:

```bash
# Terminal emulator command
OPENTTY_TERMINAL="ghostty"
# Pager command for viewing files
OPENTTY_PAGER="bat --paging=always"
```

### Supported terminals

| Terminal | `OPENTTY_TERMINAL` value |
|----------|--------------------------|
| Ghostty  | `ghostty` (default)      |
| WezTerm  | `wezterm`                |
| iTerm2   | `iterm2`                 |
| Terminal.app | `terminal`           |

## How it works

`opentty.app` is a minimal macOS application bundle that receives file/folder open events from Finder and delegates to your configured terminal emulator.

## License

MIT
