{ lib, pkgs, ... }:

{
  plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;
      inlayHints = true;
      servers = {
        ts_ls.enable = true; # TS/JS
        cssls.enable = true; # CSS
        tailwindcss.enable = true; # TailwindCSS
        html.enable = true; # HTML
        dockerls.enable = true; # Docker
        bashls.enable = true; # Bash
        nixd = {
          enable = true;
          settings =
            let
              flake = ''(builtins.getFlake "github:elythh/flake)""'';
              flakeNixvim = ''(builtins.getFlake "github:elythh/nixvim)""'';
            in
            {
              nixpkgs = {
                expr = "import ${flake}.inputs.nixpkgs { }";
              };
              formatting = {
                command = [ "${lib.getExe pkgs.nixfmt-rfc-style}" ];
              };
              options = {
                nixos.expr = ''${flake}.nixosConfigurations.grovetender.options'';
                nixvim.expr = ''${flakeNixvim}.packages.${pkgs.system}.default.options'';
              };
            };
          };
        };
        yamlls = {
          enable = true;
          settings = {
            schemaStore = {
              enable = false;
              url = "";
            };
          };
        };
        lua_ls = {
          enable = true;
          settings.telemetry.enable = true;
        };
      };
      keymaps = {
        silent = true;
        lspBuf = {
          "<leader>gd" = {
            action = "definition";
            desc = "[G]o to [D]efinition";
          };
          "<leader>gr" = {
            action = "references";
            desc = "[G]o to [R]eferences";
          };
          "<leader>gi" = {
            action = "implementation";
            desc = "[G]o to [I]mplementation";
          };
          "<leader>rn" = {
            action = "rename";
            desc = "[R]ename";
          };
        };
      };
    };
  };
  extraConfigLua = ''
    local _border = "rounded"

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border
      }
    )

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help, {
        border = _border
      }
    )

    vim.diagnostic.config{
      float={border=_border}
    };

    require('lspconfig.ui.windows').default_options = {
      border = _border
    }

    config = function(_, opts)
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end;
  '';
}
