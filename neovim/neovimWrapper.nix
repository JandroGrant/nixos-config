{pkgs}: let
  plugins = import ./plugins.nix {inherit pkgs;};
in
  pkgs.wrapNeovim pkgs.neovim {
    configure = {
      packages.all.start = plugins;
      customLuaRC = ''
         vim.g.mapleader = " "
         vim.g.maplocalleader = "\\"

         -- basic settings
         vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.cursorline = true
        vim.opt.scrolloff = 10
        vim.opt.sidescrolloff = 8
        vim.opt.wrap = false
        vim.opt.cmdheight = 1
        vim.opt.spelllang = { "en", "es" }

        -- tabbing and indentation
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 2
        vim.opt.expandtab = true
        vim.opt.smartindent = true
        vim.opt.autoindent = true
      '';
    };
  }
