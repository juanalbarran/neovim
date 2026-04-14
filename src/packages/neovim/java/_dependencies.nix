# src/packages/neovim/java/_dependencies.nix
{pkgs}:
with pkgs; [
  jdt-language-server
  google-java-format
  temurin-bin

  unzip
  curl
]
