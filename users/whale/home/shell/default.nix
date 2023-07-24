{ inputs, config, pkgs, lib, ... }:
{
  imports = [
    ./doom-emacs.nix
    ./kitty.nix
    ./fish.nix
    ./foot.nix
  ];
}
