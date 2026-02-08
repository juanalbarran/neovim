# src/packages/neovim/java/_plugins.nix
{pkgs}:
with pkgs.vimPlugins; [
  # LSP Plugin
  nvim-java
]
