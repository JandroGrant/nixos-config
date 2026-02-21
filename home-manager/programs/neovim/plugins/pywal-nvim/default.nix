{pkgs, ...}: {
  plugin = pkgs.vimPlugins.pywal-nvim;
  type = "lua";
  config = ''require("pywal").setup()'';
}
