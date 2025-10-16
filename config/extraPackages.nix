# config/extraPackages.nix
{ pkgs, ... }:


  with pkgs; {
    start = [
      lua-language-server
      nil
      stylua
    ];
  }

