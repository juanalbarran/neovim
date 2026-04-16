# src/packages/vimPlugins/spring-boot-nvim.nix
{pkgs}:
pkgs.vimUtils.buildVimPlugin {
  name = "spring-boot.nvim";
  src = pkgs.fetchFromGitHub {
    owner = "JavaHello";
    repo = "spring-boot.nvim";
    rev = "main";
    hash = "sha256-JkOWlqyVLcwW7hxOGj5jb8BpUge3bUHbSV0o5qOYW1c=";
  };
}
