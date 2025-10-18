# src/packages/neovim/web/treesitterPlugins.nix
{}: treesitterPlugins:
with treesitterPlugins; [
  javascript
  typescript
  # html already in base
  css
  jsdoc
  scss
  tsx
  http
]
