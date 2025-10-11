# config/plugins/others.nix
{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    # Python provider (needed by most plugins)
    (pkgs.python3.withPackages (ps: with ps; [ pynvim ]))

    # Node.js provider (for plugins like coc.nvim, etc.)
    (pkgs.nodejs_20)

    # Ruby provider (less common, but still supported)
    (pkgs.ruby.withPackages (ps: with ps; [ neovim ]))
  ];
  extraPlugins = [pkgs.vimPlugins."zenbones-nvim"];
  extraConfigLua = "require('zenbones').setup()";
}

