# src/packages/vimPlugins/vague.nix
{ pkgs }:
pkgs.vimUtils.buildVimPlugin {
  name = "vague";
  src = pkgs.fetchFromGitHub {
    owner = "vague-theme";
    repo = "vague.nvim";
    rev = "5689afda42d60c8db12ff93dd6e1322f59e46a93";
    hash = "sha256-EVkOpFFb7EeaA+ptNHSUj6hh1DNPPh4SCm/sorreG4M=";
  };
}
