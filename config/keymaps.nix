# config/keymaps.nix
{ self, ... }:

{
  keymaps = [
    {
      mode = "i";
      key = "jk";
      action = "<esc>";
    }
    {
      mode = "i";
      key = "kj";
      action = "<esc>";
    }
    {
      mode = "n";
      key = "<leader>vs";
      action = "<cmd>vsplit<CR>";
    }
    {
      mode = "n";
      key = "<c-l>";
      action = "<c-w>l";
    }
    {
      mode = "n";
      key = "<c-h>";
      action = "<c-w>h";
    }    
    {
      mode = "n";
      key = "<c-j>";
      action = "<c-w>j";
    }   
    {
      mode = "n";
      key = "<c-k>";
      action = "<c-w>k";
    }
    # Commentary
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>Commentary<CR>";
    }
    # Oil
    {
      mode = "n";
      key = "-";
      action = "<cmd>Oil<CR>";
    }
    # Fzf-lua
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>FzfLua files<CR>";
      options = { 
	desc = "[F]ind [F]iles";
      };
    }
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>FzfLua buffers<CR>";
      options = { 
	desc = "Find [B]uffers";
      };
    }
    {
      mode = "n";
      key = "<leader>cs";
      action = "<cmd>FzfLua colorschemes<CR>";
      options = {
        desc = "[C]olor[S]cheme";
      };
    }
  ];
}
