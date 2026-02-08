# src/packages/neovim/web/treesitterPlugins.nix
{}: treesitterPlugins:
with treesitterPlugins; [
  javascript
  typescript
  # html and css already in base
  jsdoc
  scss
  tsx
  http
]
