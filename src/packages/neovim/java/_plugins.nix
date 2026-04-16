# src/packages/neovim/java/_plugins.nix
{
  pkgs,
  root,
}:
with pkgs.vimPlugins;
with root.packages.vimPlugins; [
  # LSP Plugin
  nvim-java
  spring-boot-nvim
]
