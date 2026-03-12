# src/psckages/neovim/salesforce/_treesitterPlugins.nix
{}: treesitterPlugins:
with treesitterPlugins; [
  apex
  soql
  sosl
  sflog
]
