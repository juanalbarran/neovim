# config/plugins/oil.nix
{
  plugins.oil = {
    enable = true;
    settings = {
      view_options = {
        show_hidden = true;
      };
    };
  };
}
