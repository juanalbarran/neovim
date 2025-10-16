# config/default.nix
{ pkgs }:

let
  allPlugins = (import ./plugins.nix { inherit pkgs; }).start;
  extraExecutables = import ./extraPackages.nix { inherit pkgs; };
in
pkgs.neovim.override {
  vimAlias = true;
  configure = {
    packages.myPlugins = {
      start = allPlugins;
    };
    extraWrappedArgs = [
      "--prefix" "PATH" ":" (pkgs.lib.makeBinPath extraExecutables)
    ];
    customRC = ''
      lua << EOF
      -- Add our local lua directory to Lua's package path
      package.path = package.path .. ';${../lua}/?.lua'
      require('init')
      EOF
    '';
  };
}
