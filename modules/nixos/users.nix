{ pkgs, ... }: {
  # Define a user account.
  users.users.quinton = {
    isNormalUser = true;
    description = "Quinton Jasper";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "kvm"
      "libvirtd"
    ];
    shell = pkgs.zsh;
  };

  # prevent new user dialog for zsh
  system.userActivationScripts.zshrc = "touch .zshrc";

  services.gnome.gnome-keyring.enable = true;

  # enable pwfeedback
  security.sudo.extraConfig = ''
    Defaults    pwfeedback
  '';
}
