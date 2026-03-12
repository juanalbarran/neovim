# src/packages/neovim/salesforce/_dependencies.nix
{pkgs}: let
  # 1. Fetch the VS Code Extension from GitHub Releases and extract the JAR
  apex-jar = pkgs.stdenv.mkDerivation rec {
    pname = "apex-jorje-lsp";
    version = "65.18.0"; # Updated to the latest release

    src = pkgs.fetchurl {
      name = "salesforcedx-vscode-apex-${version}.zip";
      # GitHub releases are significantly more reliable for Nix fetchurl
      url = "https://github.com/forcedotcom/salesforcedx-vscode/releases/download/v${version}/salesforcedx-vscode-apex-${version}.vsix";
      hash = "sha256-rHH8SfHrIWGh5vXDajQGal1OEhvpKbV8RSzhdaKwsyo=";
    };

    nativeBuildInputs = [pkgs.unzip];

    unpackPhase = "unzip $src";

    installPhase = ''
      mkdir -p $out/share/apex-lsp
      cp extension/dist/apex-jorje-lsp.jar $out/share/apex-lsp/
    '';
  };

  # 2. Create the wrapper script
  apex-language-server = pkgs.writeShellScriptBin "apex-language-server" ''
    exec ${pkgs.jdk21_headless}/bin/java -jar ${apex-jar}/share/apex-lsp/apex-jorje-lsp.jar "$@"
  '';
in
  with pkgs; [
    apex-language-server
    universal-ctags
  ]
