{ pkgs }: 
let
    customRC = import ../config { inherit pkgs; };
in pkgs.wrapNeovim pkgs.nvim {
    configure = {
        # My config
        inherit customRC;
        #packages.all.start = plugins;
    };
}
