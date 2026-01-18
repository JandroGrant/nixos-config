{ pkgs }:

pkgs.writeShellScriptBin "pywal-reload" ''
  pkill waybar
  ${pkgs.waybar}/bin/waybar
''
