{pkgs}: let
  toLua = str: "lua << EOF\n${str}\nEOF\n";
  toLuaFile = file: "lua << EOF\n ${builtins.readFile file}\nEOF\n";
in
  with pkgs.vimPlugins; [
    {
      plugin = blink-cmp;
      config = toLua ''
           require("blink-cmp").setup({
             keymap = {
               preset = "default",
               ["<C-K>"] = { "select_prev", "fallback" },
               ["<C-J>"] = { "select_next", "fallback" },
               ["<TAB>"] = { "accept", "fallback" },
             },
             appearance = {
               nerd_font_variant = "mono",
             },
             completion = { documentation = { auto_show = true } },
             sources = {
               default = {
                 "lsp",
          "path",
          "snippets",
          "buffer",
        },
             },
             fuzzy = { implementation = "prefer_rust_with_warning" },
           })
      '';
    }

    {
      plugin = pywal-nvim;
      config = toLua ''require("pywal").setup()'';
    }

    {
      plugin = lualine-nvim;
      config = toLua ''
           require("lualine").setup({
             options = {
               theme = "pywal",
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = "|",
             }
           })
      '';
    }

    mini-ai
    mini-comment
    mini-move
    mini-surround
    mini-cursorword
    mini-indentscope
    mini-pairs
    mini-trailspace
    mini-bufremove
    mini-notify

    nvim-lspconfig

    {
      plugin = tiny-inline-diagnostic-nvim;
      config = toLua ''
        require("tiny-inline-diagnostic").setup({
          preset = "modern",
          options = {
            enable_on_insert = true,
          }
        })
        vim.diagnostic.config({ virtual_text = false })
      '';
    }

    nvim-web-devicons

    {
      plugin = which-key-nvim;
      config = toLua ''
           local whichkey = require("which-key")
           whichkey.add({
             {
               "<leader>?",
        function()
                 whichkey.show({ global = false })
        end,
        desc = "Buffer Local Keymaps (whichkey)",
             }
           })
      '';
    }

    {
      plugin = yazi-nvim;
      config = toLua ''
           vim.keymap.set("n", "<leader>z", function()
             require("yazi").yazi()
           end)

           vim.g.loaded_netrwPlugin = 1
           vim.api.nvim_create_autocmd("UIEnter", {
             callback = function()
               require("yazi").setup({
          open_for_directories = true,
        })
             end,
           })
      '';
    }

    nvim-treesitter.withAllGrammars
  ]
