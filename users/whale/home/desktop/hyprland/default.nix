{ inputs, config, pkgs, lib, ... }:
{
  # Install hyprland
  imports = [
    inputs.hyprland.nixosModules.default
    ./home.nix
    ./hyprland_waybar.nix
  ];

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
  };

  programs = {
    dconf.enable = true;
    light.enable = true;
  };

  security.pam.services.swaylock = { };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
