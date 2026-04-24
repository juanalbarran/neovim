# src/packages/neovim/java/_dependencies.nix
{pkgs}:
with pkgs; let
  jdtls-with-lombok = writeShellScriptBin "jdtls" ''
    export JDTLS_JVM_ARGS="-javaagent:${lombok}/share/java/lombok.jar"
    exec ${jdt-language-server}/bin/jdtls "$@"
  '';
in [
  jdtls-with-lombok

  google-java-format
  temurin-bin

  unzip
  curl
]
