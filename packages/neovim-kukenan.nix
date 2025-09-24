{ pkgs }:
let
    customRC = import ../config { inherit pkgs; };
    #plugins = import ../plugins.nix { inherit pkgs; };
in pkgs.wrapNeovim pkgs.nvim {
    configure = {
        # My config
        inherit customRC;
        #packages.all.start = plugins;
    };
}
