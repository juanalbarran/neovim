# flake.nix
{
  description = "A nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/25.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { nixpkgs, nixpkgs-stable, flake-parts, nvf, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      perSystem = { pkgs, system, ... }:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              (_final: _prev: {
                stable = import nixpkgs-stable {
                  inherit system;
                  config.allowUnfree = true;
                  config.nvidia.acceptLicense = true;
                };
              })
            ];
            config.allowUnfree = true;
          };
          nvimConfig = nvf.lib.neovimConfiguration {
            inherit pkgs;
            modules = [ ./config ];
          };
        in {
          _module.args.pkgs = pkgs;
          packages.default = nvimConfig.neovim;

          apps.default = {
            type = "app";
            program = "${nvimConfig.neovim}/bin/nvim";
            meta = { description = "Launch NVF Config"; };
          };
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            formatCheck = pkgs.runCommand "format-check" {
              nativeBuildInputs =
                [ pkgs.nixfmt-rfc-style pkgs.diffutils pkgs.rsync ];
            } ''
              echo "📏 Running nixfmt-rfc-style check..."

              mkdir $TMPDIR/orig
              mkdir $TMPDIR/formatted

              rsync -a --exclude orig --exclude formatted --exclude .git --exclude result ./ $TMPDIR/orig/
              rsync -a $TMPDIR/orig/ $TMPDIR/formatted/

              find $TMPDIR/formatted -name '*.nix' -exec nixfmt {} +

              diff -ru $TMPDIR/orig $TMPDIR/formatted || (echo '❌ Formatting issues found'; exit 1)

              touch $out
            '';
            ## ✅ 2) Deadnix check
            deadnix = pkgs.runCommand "deadnix-check" {
              nativeBuildInputs = [ pkgs.deadnix ];
            } ''
              echo "🧹 Running deadnix..."
              deadnix check . || (echo "❌ Dead code found"; exit 1)
              touch $out
            '';

            ## ✅ 3) Statix check
            statix = pkgs.runCommand "statix-check" {
              nativeBuildInputs = [ pkgs.statix ];
            } ''
              echo "🕵️ Running statix..."
              statix check . || (echo "❌ Style issues found"; exit 1)
              touch $out
            '';
          };
          formatter = pkgs.nixfmt-rfc-style;
          devShells.default = pkgs.mkShell {
            packages = with pkgs;
              [
                git
                fd
                nixfmt-rfc-style
                nixd
                nerd-font.jetbrains-mono
                ripgrep
                deadnix
                statix
              ] ++ pkgs.lib.optionals pkgs.stdenv.isLinux [ pkgs.fontpreview ];
          };
        };
      flake = {
        homeModules.default = { pkgs, ... }: {
          home.packages = with pkgs; [
            git
            fd
            nixfmt-rfc-style
            nixd
            nerd-font.jetbrains-mono
            ripgrep
            deadnix
            statix

            (nvf.lib.neovimConfiguration {
              inherit pkgs;
              modules = [ ./config ];
            }).neovim
          ];
        };
      };
    };
}
