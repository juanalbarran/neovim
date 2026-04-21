# src/packages/neovim/java/_dependencies.nix
{pkgs}:
with pkgs; let
  jdtls-with-lombok = writeShellScriptBin "jdtls" ''
    exec ${jdt-language-server}/bin/jdtls \
      --jvm-arg=-javaagent:${lombok}/share/java/lombok.jar \
      "$@"
  '';
in [
  jdtls-with-lombok

  google-java-format
  temurin-bin

  unzip
  curl
]
