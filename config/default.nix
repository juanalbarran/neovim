# config/default.nix
{ pkgs }:

let
  allPlugins = (import ./plugins.nix { inherit pkgs; }).start;
in
pkgs.neovim.override {
  vimAlias = true;
  configure = {
    packages.myPlugins = {
      start = allPlugins;
    };
    customRC = ''
      lua << EOF
      -- Add our local lua directory to Lua's package path
      package.path = package.path .. ';${../lua}/?.lua'
      require('init')
      EOF
    '';
  };
}
