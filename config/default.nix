{ pkgs }:
let
    scriptToConfigFiles = dir:
        let
            configDir = pkgs.stdenv.mkDerivation {
                name = "nvim-${dir}-configs";
                src = "./${dir}";
                installPhase = ''
                    mkdir -p $out
                    cp ./* $out/
                '';
            };
        in builtins.map(file: "${configDir}/${file}")
        (builtins.attrNames (builtins.readDir configDir));

    sourceConfigFiles = files:
        builtins.concatStringsSep "\n" (builtins.map (file:
            (if pkgs.lib.string.hasSufix "lua" file then "luafile" else "source")
            + " ${file}") files);
    lua = scriptToConfigFiles "lua";

in builtins.concatStringsSep "\n"
(builtins.map (configs: sourceConfigFiles configs) [ lua ])
    
