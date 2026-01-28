# Quinton's Dotfiles

This repository contains my personal NixOS configuration using Flakes.

## Hosts

This flake provides configurations for the following hosts:

- **nuc**: Intel NUC (Media Center/Desktop)
- **lilbuddy**: Portable setup
- **blackbox**: Secondary workstation
- **CaptainBapple**: MacBook Pro 11,4 (NixOS on Mac)

## Major Applications

### Core & Desktop
- **Niri**: Tiling Wayland compositor
- **Zen Browser**: Primary web browser
- **Chromium**: Secondary web browser
- **Alacritty**: GPU-accelerated terminal emulator
- **LibreOffice**: Office suite
- **VLC**: Media player
- **Remmina**: Remote desktop client
- **Foliate**: E-book reader
- **Nicotine+**: Soulseek client
- **PCManFM**: File manager
- **Antigravity**: AI Agentic Assistant

### Development & Tools
- **Neovim**: Editor configured via home-manager (LSP, Treesitter, Telescope, nvim-cmp)
- **Git**: Version control
- **Tmux**: Terminal multiplexer
- **Htop / Btop**: System resource monitors
- **Fastfetch**: System information fetcher
- **Starship**: Cross-shell prompt

## Flake Inputs

The configuration leverages the following key inputs:

- **nixpkgs**: `nixos-unstable` branch
- **home-manager**: Managing user environment
- **nixos-hardware**: Hardware-specific configurations (e.g., for Macbooks)
- **noctalia**: Custom helper library/shell
- **wallpapers**: External wallpaper collection
- **zen-browser**: Flake for Zen Browser

## Using Noctalia theming
In order to use noctalia theming with QT applications, you must set values from within qt6ct. GTK theming is not functioning as of yet. Icons must also be set within both qt6ct and nwg-look.