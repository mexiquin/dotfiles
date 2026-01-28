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
    shell = pkgs.fish;
  };

  services.gnome.gnome-keyring.enable = true;

  # enable pwfeedback
  security.sudo.extraConfig = ''
    Defaults    pwfeedback
  '';
}
