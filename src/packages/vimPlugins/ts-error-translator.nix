# src/packages/vimPlugins/ts-error-translator.nix
{ pkgs }:
pkgs.vimUtils.buildVimPlugin {
  name = "ts-error-translator";
  src = pkgs.fetchFromGitHub {
    owner = "dmmulroy";
    repo = "ts-error-translator.nvim";
    rev = "47e5ba89f71b9e6c72eaaaaa519dd59bd6897df4";
    hash = "sha256-fi68jJVNTL2WlTehcl5Q8tijAeu2usjIsWXjcuixkCM=";
  };
}
