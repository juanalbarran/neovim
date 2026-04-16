# src/packages/vimPlugins/java-creator-nvim.nix
{pkgs}:
pkgs.vimUtils.buildVimPlugin {
  name = "java-creator.nvim";
  src = pkgs.fetchFromGitHub {
    owner = "alessio-vivaldelli";
    repo = "java-creator-nvim";
    rev = "main";
    hash = "sha256-aPSjvgB7UM9FchZCD+MRc6seWQnubYeSQJqvONwEKnI=";
  };
}
