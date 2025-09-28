{
  description = "A Neovim flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        # Tu configuración de Neovim aquí
        neovim-with-plugins = pkgs.neovim.override {
          vimAlias = true;
          configure = {
            customRC = ''
              " Aquí puedes poner configuraciones básicas de Vimscript
              set number
              set relativenumber
            '';

            # O puedes importar un archivo de configuración completo
            # init.vim or init.lua
            # luaFile = ./init.lua;

            # Plugins de Neovim
            packages.myPlugins = with pkgs.vimPlugins; {
              start = [
                # Plugins que se cargan al inicio
                plenary-nvim
                telescope-nvim
                nvim-treesitter.withAllGrammars
                vim-sleuth
                tokyonight-nvim
              ];
              opt = [
                # Plugins que se cargan opcionalmente
              ];
            };
          };
        };
      in
      {
        packages.default = neovim-with-plugins;

        # Para poder ejecutarlo directamente con `nix run`
        apps.default = {
          type = "app";
          program = "${neovim-with-plugins}/bin/nvim";
        };
      }
    );
}
