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
    poimandres.enable = true;
    base16.enable = false;
  };
}
