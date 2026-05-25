# AGENTS.md

## Flake overview

NixOS flake (`flake.nix`, `x86_64-linux`) managing two hosts + standalone home-manager:

| Output | Purpose |
|---|---|
| `nixosConfigurations.nixosPC` | Desktop (GRUB + Particle theme, extra mounts) |
| `nixosConfigurations.dell5411` | Laptop, hostname forced to `veritas-laptop` |
| `homeConfigurations.homeConfig` | Standalone HM (non-NixOS use) |
| `devShells.x86_64-linux.default` | Named `dotfiles` -- LSPs + formatters |

## Deploy

Use `install.sh`, not raw nix commands:

```sh
# rebuild a NixOS host
./install.sh --hosts nixosPC     # or dell5411
# standalone home-manager
./install.sh --home-manager
# first-time install from live ISO
./install.sh --livecd --hosts nixosPC
```

Available hosts: `nixosPC`, `dell5411`.

## Architecture pattern: auto-import

Central mechanism: `lib/autoImport.nix` → `customLib.importModules { dir = ./.; }`.

Adding a `.nix` file anywhere under `modules/nixos/` or `hosts/<name>/` **automatically includes it**. No manual `imports = [...]` needed. Exclusions: `default.nix` of the root dir, files listed in `excludeNames`.

Usage across the flake:
- `modules/nixos/default.nix`: auto-imports `core/`, `hardware/`, `services/`
- `hosts/<name>/default.nix`: auto-imports host modules, excludes `home-manager.nix` (imported explicitly)
- `modules/home-manager/default.nix`: auto-imports with `includeDefaultNix = true`
  subdirs: `apps/`, `audio/`, `cli/`, `desktop/`, `shell/`, `theming/`

## extra-pkgs/

Custom package derivations at `extra-pkgs/`:

| File | What |
|---|---|
| `catppuccin-icons.nix` | Catppuccin GTK icon theme derivation |
| `grub-theme-particles.nix` | Particle GRUB theme derivation |
| `stretch-pro.nix` | Stretch Pro font (source: `fonts/fontpacks/`) |
| `scripts/` | Auto-discovered scripts (see below) |

## Scripts

Located at `extra-pkgs/scripts/`. Auto-discovered into `home.packages`:
- **`nix/`**: `.nix` files → imported as packages (return `writeShellScriptBin` or similar)
- **`sh/`**: `.sh` files + extension-less files → wrapped via `writeShellScriptBin`

## nvim

A **git submodule** (`git@github.com:ruanyouxing/nvim`), not part of this flake's own config. Its `AGENTS.md` is at `nvim/AGENTS.md`.

## Dev environment

```sh
nix develop           # or direnv auto-loads via .envrc (use flake)
```

Shell packages: `bash-language-server`, `nil` (nix LSP), `alejandra` (nix fmt), `lua-language-server`, `stylua` (lua fmt), `statix` (nix linter), `shfmt` (sh fmt).

## Custom lib (`lib/`)

| File | What |
|---|---|
| `lib/autoImport.nix` | `importModules` — recursive `.nix` auto-importer |
| `lib/excludeExt.nix` | `excludeNixFiles`, `excludeExt` — file filtering via `lib.fileset` |
| `lib/default.nix` | Merges both into `nixpkgs.lib // customLib` |

## Key files

- `flake.nix` — entrypoint: hosts, HM, devShell
- `install.sh` — deploy orchestrator
- `modules/home-manager/` — HM modules: `apps/` (browser, kitty, mpv, obs), `audio/` (mpd, cava), `cli/` (btop, neovim, yazi), `desktop/` (hyprland, waybar, wlogout, rofi), `shell/` (git, zsh), `theming/` (gtk, qt)
- `modules/nixos/` — shared NixOS modules (boot, audio, graphics, virtualization, services)
- `fonts/default.nix` — font config (Fira Code, Noto CJK, Nerd Fonts, etc.)
- `extra-pkgs/` — custom package derivations (catppuccin-icons, grub-theme-particles, stretch-pro, scripts)

## Formatter / lint conventions

- Nix: `alejandra` (no config file — defaults)
- Lua: `stylua` with `stylua.toml` in `nvim/`
- Shell: `shfmt`
