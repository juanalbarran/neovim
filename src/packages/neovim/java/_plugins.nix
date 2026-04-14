# src/packages/neovim/java/_plugins.nix
{pkgs}:
let
  # Manually fetch and build the missing dependency
  spring-boot-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "spring-boot.nvim";
    version = "master";
    src = pkgs.fetchFromGitHub {
      owner = "JavaHello";
      repo = "spring-boot.nvim";
      rev = "main";
      # Note: If Nix complains about a hash mismatch, copy the "got:" hash 
      # from the error message and replace this string with it!
      hash = "sha256-JkOWlqyVLcwW7hxOGj5jb8BpUge3bUHbSV0o5qOYW1c="; 
    };
  };
in
with pkgs.vimPlugins; [
  # LSP Plugin
  nvim-java
  # Required dependencies for nvim-java
  spring-boot-nvim

  # Note: Depending on your Nixpkgs channel, you *might* also need to explicitly
  # add these if nvim-java complains about them next:
  # nvim-java-core
  # nvim-java-test
  # lua-async-await
  # nui-nvim
]
