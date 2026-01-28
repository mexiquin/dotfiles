# Quinton's Dotfiles (Plasma Branch)

This branch contains a migration of my personal NixOS configuration from Niri to **KDE Plasma 6**.

## Branch Differences

This branch (`plasma`) differs from the `main` branch in the following ways:

- **Desktop Environment**: Uses **KDE Plasma 6** instead of the Niri tiling compositor.
- **Simplified Configuration**: Removed **Noctalia**, Niri-specific tools (`nwg-look`, `nwg-displays`), and Alacritty.
- **Theming**: Leveraging Plasma's native system-wide theming for both Qt and GTK applications, removing the need for manual `qt6ct` or `nwg-look` management.
- **Cleaned Up Dependencies**: Removed redundant applications like `imv`, `pavucontrol`, and `pcmanfm` in favor of Plasma's integrated alternatives (Gwenview, Plasma Audio/Network widgets, Dolphin).

## Hosts

This flake provides configurations for the following hosts:

- **nuc**: Intel NUC (Media Center/Desktop) - *includes FreeTube*
- **lilbuddy**: Portable setup
- **blackbox**: Secondary workstation
- **CaptainBapple**: MacBook Pro 11,4 (NixOS on Mac)

## Major Applications

### Core & Desktop
- **KDE Plasma 6**: Modern, feature-rich desktop environment
- **Zen Browser**: Primary web browser
- **Chromium**: Secondary web browser
- **Konsole / Yakuake**: KDE terminal emulators
- **Dolphin**: Advanced file manager
- **LibreOffice**: Office suite
- **VLC**: Media player
- **Remmina**: Remote desktop client
- **Foliate**: E-book reader
- **Nicotine+**: Soulseek client
- **Antigravity**: AI Agentic Assistant

### Development & Tools
- **NVF**: Neovim configuration (configured for Nix, Python, Rust, TypeScript, HTML/CSS)
- **Git**: Version control
- **Fish Shell**: Modern, user-friendly command-line shell
- **Tmux**: Terminal multiplexer
- **Htop / Btop**: System resource monitors
- **Fastfetch**: System information fetcher
- **Starship**: Cross-shell prompt

## Flake Inputs

The configuration leverages the following key inputs:

- **nixpkgs**: `nixos-unstable` branch
- **home-manager**: Managing user environment
- **nixos-hardware**: Hardware-specific configurations (e.g., for Macbooks)
- **nvf**: Neovim Flake configuration
- **wallpapers**: External wallpaper collection
- **zen-browser**: Flake for Zen Browser