# src/packages/neovim/web/_dependenciesEnd.nix
{pkgs}:
with pkgs; [
  nodePackages.typescript
  nodePackages.eslint_d
  nodePackages.prettier
]
