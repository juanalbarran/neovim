# src/packages/neovim/java/_dependencies.nix
{pkgs}:
with pkgs; let
  # Create a custom wrapper for jdtls that automatically injects the lombok javaagent
  jdtls-with-lombok = writeShellScriptBin "jdtls" ''
    # JDTLS provided by nixpkgs respects the JDTLS_JVM_ARGS environment variable.
    # We inject the absolute path to the lombok jar into it.
    export JDTLS_JVM_ARGS="-javaagent:${lombok}/share/java/lombok.jar ''${JDTLS_JVM_ARGS:-}"

    # Execute the real jdtls with any arguments passed by Neovim
    exec ${jdt-language-server}/bin/jdtls "$@"
  '';
in [
  # Drop our custom wrapped jdtls into the environment instead of the bare one
  jdtls-with-lombok

  # The rest of your dependencies
  google-java-format
  temurin-bin

  unzip
  curl
]
