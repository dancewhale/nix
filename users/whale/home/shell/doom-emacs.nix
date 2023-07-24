{ inputs, config, pkgs, lib, ... }:
{
  # Install Doom Emacs from here: https://github.com/hlissner/doom-emacs

  # Doom configuration
  imports = [ inputs.nix-doom-emacs.hmModule ];
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./doom.d;
  };
}
