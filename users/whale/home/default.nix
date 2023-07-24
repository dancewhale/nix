{ config, pkgs, unstable-pkgs, ... }:
{
  imports = [
    ./python
    ./shell
    #./latex
    #./custom-fonts
  ];


  # Environment variables for Nuggets
  home.sessionVariables = {
    EDITOR = "vim";
    GIT_EDITOR = "vim";
    VISUAL = "vim";
  };

  # Basic Git configuration
  programs.git = {
    enable = true;
    userName = "dancewhale";
    userEmail = "542727233@qq.com";
    aliases = {
      puhs = "push";
    };
    extraConfig = {
      core.pager = "delta";
      interactive.diffFilter = "delta --color-only --features=interactive";
      delta = {
        features = "decoration";
        navigate = "true";
        side-by-side = "true";
        line-numbers = "false";
      };
      merge.conflictstyle = "diff3";
      diff.colorMoved = "default";
    };
  };

  # enable font configuration
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    bat
    fzf
    jq
    vim
    unstable-pkgs.nodejs
    pyright
    ripgrep
    silver-searcher
  ];
}

