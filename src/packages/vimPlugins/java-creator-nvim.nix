# src/packages/vimPlugins/java-creator-nvim.nix
{pkgs}:
pkgs.vimUtils.buildVimPlugin {
  name = "java-creator.nvim";
  src = pkgs.fetchFromGitHub {
    owner = "alessio-vivaldelli";
    repo = "java-creator-nvim";
    rev = "main";
    hash = "sha256-JkOWlqyVLcwW7hxOGj5jb8BpUge3bUHbSV0o5qOYW1c=";
  };
}
