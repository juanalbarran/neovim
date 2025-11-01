# src/packages/neovim/max/_dependenciesEnd.nix
{ pkgs }:
with pkgs;
[
  nodePackages.typescript
  nodePackages.eslint_d
  nodePackages.prettier
]
