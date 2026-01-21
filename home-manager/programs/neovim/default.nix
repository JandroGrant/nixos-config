{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      ${builtins.readFile ./lua/globals.lua}
      ${builtins.readFile ./lua/keymaps.lua}
      ${builtins.readFile ./lua/options.lua}
      ${builtins.readFile ./lua/lspinit.lua}
    '';
    plugins = with pkgs.vimPlugins; [
      (import ./plugins/pywal-nvim { inherit pkgs; })

      {
        plugin = blink-cmp;
        type = "lua";
        config = ''
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

      # {
      #   plugin = pywal-nvim;
      #   type = "lua";
      #   config = ''require("pywal").setup()'';
      # }

      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          require("lualine").setup({
            options = {
              theme = "pywal",
              icons_enabled = true,
              section_separators = { left = "", right = "" },
              components_separators = "|",
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
        type = "lua";
        config = ''
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
        type = "lua";
        config = ''
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
        type = "lua";
        config = ''
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

      {
        plugin = fzf-lua;
        type = "lua";
        config = ''
          vim.keymap.set("n", "<leader><leader>", function()
            require("fzf-lua").files()
          end)
        '';
      }

      nvim-treesitter.withAllGrammars
    ];
    extraPackages = with pkgs; [
      nil
      lua-language-server
      libclang
    ];
  };
}
