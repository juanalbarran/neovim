# config/plugins/others.nix
{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    python3
  ];
}

