# config/options.nix
{ self, ... }:
{
  globalOpts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # More colors
    termguicolors = true;

    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ];

    # Search
    ignorecase = true;
    smartcase = true;

    # Splits
    splitright = true;
    splitbelow = true;

    expandtab = true;
    shiftwidth = 2;
    smartindent = true;

    clipboard = {
     providers.wl-copy.enable = true;
     register = "wl-copy";
    };

    encoding = "utf-8";
    fileencoding = "utf-8";

    undofile = true;
    swapfile = false;
    backup = false;
    autoread = true;

    cursorline = true;

    ruler = true;
    scrolloff = 15;

    showmode = false;
  };

  diagnostic.settings = {
    update_in_insert = true;
    security_sort = true;
    float = {
      border = "rounded";
    };
    jump = {
      severity.__raw = "vim.diagnostic.severity.WARN";
    };
  };
  globals.mapleader = " ";
}
