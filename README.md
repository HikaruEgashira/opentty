# opentty

Open text files and folders in [Ghostty](https://ghostty.org) from Finder.

- **Text files** → opens a new tab with `bat` (syntax-highlighted pager)
- **Folders** → opens a new tab at that directory
- **Reuses existing Ghostty window** — no new windows spawned

Uses Ghostty's [AppleScript API](https://ghostty.org/docs/features/applescript) (requires Ghostty 1.3.0+).

## Install

```bash
make install
```

Builds `opentty.app` into `~/Applications/` and sets it as the default handler for text files and folders.

Requires: [duti](https://github.com/moretension/duti) (`brew install duti`)

## Uninstall

```bash
make uninstall
```

## Configuration

Edit `~/.config/opentty/config`:

```bash
# Pager command for viewing files
OPENTTY_PAGER="bat --paging=always"
```

## License

MIT
