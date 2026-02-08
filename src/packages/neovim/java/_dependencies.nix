# src/packages/neovim/java/_dependencies.nix
{pkgs}: let
  jdkPath = "${pkgs.temurin-bin}";
in
  with pkgs; {
    JAVA_VIM_HOME = jdkPath;

    packages = [
      java-language-server
      google-java-format
      # aliad that point to the latest Long Term Service Temurin JDK
      temurin-bin
    ];
  }
