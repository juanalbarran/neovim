# config/colorschemes.nix
{ pkgs, ... }:
{
  colorschemes = { 
    rose-pine = { 
      enable = false;
      settings = {
        transparency = true;
      };
    };
    poimandres.enable = false;
    base16.enable = false;
    gruvbox.enable = true;
  };
}
