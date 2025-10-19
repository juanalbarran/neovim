# src/packages/neovim/max/_dependencies.nix
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

  prettier
  viu
  ueberzugpp

  vtsls
]
