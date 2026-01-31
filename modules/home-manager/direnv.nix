{ ... }:
{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;

    # Standard library extensions
    stdlib = ''
      # Layout for Nix flakes with automatic garbage collection protection
      layout_flake() {
        watch_file flake.nix
        watch_file flake.lock
        eval "$(nix print-dev-env --profile "$(direnv_layout_dir)/flake-profile")"
      }
    '';
  };
}
