{ inputs, config, pkgs, lib, ... }:
{
  # Install hyprland
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./home.nix
    ./hyprland_waybar.nix
    ./hypr-variables.nix
  ];

  wayland.windowManager.hyprland.enable = true;

}
