# config/default.nix
{ pkgs }:
let
  luaFiles = [
    ./nvim-0-init.lua
    ./nvim-keybinds.lua
    ./nvim-options.lua
  ];

  # For each file in the list, create the full "luafile <path>" command.
  sourceCmds = pkgs.lib.lists.map (file: "luafile " + toString file) luaFiles;

in
# Join all the commands into a single string, separated by newlines.
pkgs.lib.strings.concatStringsSep "\n" sourceCmds
