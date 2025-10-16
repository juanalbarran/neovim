{
  vim = {
    globals.mapleader = " ";
    options = {
      # Numbering
      number = true;
      relativenumber = true;

      # Tabs
      tabstop = 2;
      softtabstop = 2;
      showtabline = 2;
      expandtab = true;

      # Indentation
      smartindent = true;
      shiftwidth = 2;
      breakindent = true;

      # Fold Settings
      foldcolumn = "1";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = false;

      shada = "!,'100,<50,<s10,h";
    };
    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };
  };
}
