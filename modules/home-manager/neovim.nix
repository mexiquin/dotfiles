{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # LSP servers for neovim
    nil
    pyright
    rust-analyzer
    nodePackages.typescript-language-server
    vscode-langservers-extracted
    # Dependencies
    ripgrep
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      # Statusline
      lualine-nvim
      nvim-web-devicons

      # Fuzzy finder
      telescope-nvim
      plenary-nvim

      # Completion
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      luasnip
      cmp_luasnip

      # LSP
      nvim-lspconfig

      # Keybinding helper
      which-key-nvim

      # Treesitter
      (nvim-treesitter.withPlugins (p: [
        p.nix
        p.python
        p.rust
        p.typescript
        p.javascript
        p.html
        p.css
        p.lua
        p.bash
        p.json
        p.yaml
        p.markdown
      ]))
    ];

    initLua = ''
      -- Leader key
      vim.g.mapleader = ' '

      -- Basic options
      vim.opt.tabstop = 2
      vim.opt.shiftwidth = 0
      vim.opt.expandtab = true
      vim.opt.autoindent = true
      vim.opt.number = true
      vim.opt.termguicolors = true

      -- Lualine setup
      require('lualine').setup({
        options = {
          theme = 'auto',
          component_separators = { left = ' ', right = ' ' },
          section_separators = { left = ' ', right = ' ' },
        },
      })

      -- Telescope setup
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
      vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Buffers' })

      -- Which-key setup
      local wk = require('which-key')
      wk.setup({
        delay = 300,
        icons = {
          mappings = false,
        },
      })
      wk.add({
        { "<leader>f", group = "find" },
        { "<leader>c", group = "code" },
        { "<leader>r", group = "refactor" },
      })

      -- nvim-cmp setup
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
          { name = 'path' },
        }),
      })

      -- LSP setup using new vim.lsp.config API (Neovim 0.11+)
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Configure LSP servers
      vim.lsp.config('nil_ls', { capabilities = capabilities })
      vim.lsp.config('pyright', { capabilities = capabilities })
      vim.lsp.config('rust_analyzer', { capabilities = capabilities })
      vim.lsp.config('ts_ls', { capabilities = capabilities })
      vim.lsp.config('html', { capabilities = capabilities })
      vim.lsp.config('cssls', { capabilities = capabilities })

      -- Enable LSP servers
      vim.lsp.enable({ 'nil_ls', 'pyright', 'rust_analyzer', 'ts_ls', 'html', 'cssls' })

      -- LSP keybindings
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
        end,
      })
    '';
  };
}
