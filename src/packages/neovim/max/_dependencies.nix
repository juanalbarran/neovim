# src/packages/neovim/max/_dependencies.nix
{ pkgs }:
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
  nixfmt

  prettier
  viu
  ueberzugpp

  vtsls
]
