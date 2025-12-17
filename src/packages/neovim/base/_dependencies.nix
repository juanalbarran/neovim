# src/packages/neovim/base/_dependencies.nix
{pkgs}:
with pkgs; [
  bashInteractive
  ripgrep
  fzf
  clang

  stylua
  lua-language-server

  statix
  alejandra
  nixd
  qt6.qtdeclarative

  prettier
  viu
  ueberzugpp
]
