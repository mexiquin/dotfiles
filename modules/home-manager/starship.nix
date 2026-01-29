{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "[\\[](bold red)$username[@](bold green)$hostname $directory[\\]](bold red)$nix_shell$nodejs$lua$golang$rust$php $git_branch$git_commit$git_state$git_status$character";

      username.show_always = true;
      username.format = "[$user](bold yellow)";

      hostname.ssh_only = false;
      hostname.format = "[$hostname](bold blue)";

      directory.format = "[$path]($style)[$read_only]($read_only_style)";
      directory.style = "bold purple";

      character.success_symbol = "[\\$](bold)";
      character.error_symbol = "[\\$](bold red)";

      git_branch.format = "on [$branch(:$remote_branch)]($style) ";
      git_branch.style = "bold green";
    };
  };
}
