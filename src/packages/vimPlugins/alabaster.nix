# src/packages/vimPlugins/alabaster.nix
{ pkgs }:
pkgs.vimUtils.buildVimPlugin {
  name = "alabaster";
  src = pkgs.fetchFromGitHub {
    owner = "p00f";
    repo = "alabaster.nvim";
    rev = "f7d0ed5d6d0dd449b39acd3610a41b55bb693648";
    hash = "sha256-rLYA4WI5PsqH5qzOZaCCBpehdwTHqQqokUJEcexzWsE=";
  };
}
