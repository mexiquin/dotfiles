{ ... }: {
  # config for neovim
  programs.nvf = {
    enable = true;

    settings = {
      vim = {

        binds = {
          whichKey.enable = true;
        };

        options = {
          tabstop = 2;
          shiftwidth = 0;
          expandtab = true;
          autoindent = true;
        };

        utility.sleuth.enable = true;

        viAlias = true;
        vimAlias = true;

        theme = {
          enable = true;
          transparent = true;
        };

        lineNumberMode = "number";

        statusline.lualine.enable = true;
        telescope.enable = true;
        autocomplete.nvim-cmp.enable = true;
        lsp.enable = true;

        terminal.toggleterm = {
          enable = true;
          lazygit.enable = true;

        };

        languages = {
          enableTreesitter = true;

          nix.enable = true;
          python.enable = true;
          rust.enable = true;
          ts.enable = true;
          html.enable = true;
          css.enable = true;
        };
      };
    };
  };
}
