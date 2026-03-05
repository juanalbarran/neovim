# src/packages/vimPlugins/sf-nvim.nix
{pkgs}:
pkgs.vimUtils.buildVimPlugin {
  pname = "sf.nvim";
  version = "master";
  src = pkgs.fetchFromGitHub {
    owner = "xixiaofinland";
    repo = "sf.nvim";
    rev = "master";
    hash = "sha256-mW4jVOSOjML1S33cYzGAmunusKhwdTwzRldqEwagqRg=";
  };
}
