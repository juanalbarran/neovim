# src/packages/neovim/max/_treesitterPlugins.nix
{ }:
treesitterPlugins:
with treesitterPlugins; [
  bash
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

  # web development
  javascript
  typescript
  html
  css
  jsdoc
  scss
  tsx
  http
]
