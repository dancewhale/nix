{ inputs, config, pkgs, lib, ... }:
{
  programs.hyprland = {
    enable = true;
    xwayland.hidpi = true;
    xwayland.enable = true;
  };
}
