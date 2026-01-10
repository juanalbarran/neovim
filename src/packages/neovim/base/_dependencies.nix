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
  # css, html, etc.
  vscode-langservers-extracted

  prettier
  viu
  ueberzugpp
]
