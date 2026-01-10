# src/packages/neovim/base/treesitterPlugins.nix
{}: treesitterPlugins:
with treesitterPlugins; [
  bash
  html
  markdown
  markdown_inline
  regex
  lua
  luadoc
  nix
  json
  jsonc
  yaml
  xml
  qmljs
  qmldir
  css
]
