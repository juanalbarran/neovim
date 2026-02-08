# src/packages/neovim/java/treesitterPlugins.nix
{}: treesitterPlugins:
with treesitterPlugins; [
  java
  javadoc
]
