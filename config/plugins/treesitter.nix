{ ... }:
let
  treesitterLanguages = [
    "bash"
    "css"
    "html"
    "java"
    "js"
    "json"
    "lua"
    "markdown"
    "nix"
    "sql"
    "terraform"
    "tsx"
    "typescript"
    "yaml"
  ];
  treesitterEnables = builtins.listToAttrs (
    builtins.map (lang: {
      name = lang;
      value = {
        treesitter.enable = true;
      };
    }) treesitterLaguages
  );
  in
  {
    vim = {
      treesitter = {
        enable = true;
        fold = true;
        highlight.enable = true;
        indent.enable = true;
        addDefaultGrammars = true;
        autotagHtml = true;
        context = {
          enable = true;
          setupOpts = {
            line_numbers = true;        # show numbers in the sticky header
            max_lines = 3;              # show at least 3 lines from the header
            min_window_height = 0;      # no min limit, always on
            mode = "cursor";            # calculate context from the cursor
            multiline_threshold = 20;   # default is fine
            separator = "-";            # shows a line between header and content
            trim_scope = "outer";       # trim outer context if too long
            zindex = 20;                # default, fine
          };
        };
      };
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;
      } // treesitterEnables;
    };
  }
