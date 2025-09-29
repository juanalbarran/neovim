# config/default.nix
{ pkgs }:

let
  vimPlugins = import ./plugins.nix { inherit pkgs; }
  luaConfig = pkgs.vimUtils.buildVimPlugin {
    name = "kukenan";
    src = ./lua;
  };
in
pkgs.neovim.override {
  vimAlias = true;
  configure = {
    packages.plugins = vimPlugins // {
      start = vimPlugins.start ++ [ luaConfig ];
    };
  };
}
