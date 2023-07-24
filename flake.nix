{
  description = "Harmos' NixOS configuation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs:
    let
      lib = import ./lib { inherit inputs; };
      nixpkgs.config.allowUnsupportedSystem = true;
    in
    {
      nixosConfigurations = {
        whale = lib.mkSystem {
          hostname = "whale";
          system = "aarch64-linux";
          users = [ "whale" ];
        };
      };
      homeConfigurations = {
        "whale@whale" = lib.mkHome {
          username = "whale";
          system = "aarch64-linux";
          hostname = "whale";
          stateVersion = "23.05";
        };
      };

    } // inputs.flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import inputs.nixpkgs { inherit system; };
        in
        {
          # If you're not using NixOS and only want to load your home
          # configuration when `nix` is installed on your system and
          # flakes are enabled.
          #
          # Enable a `nix develop` shell with home-manager and git to
          # only load your home configuration.
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [ home-manager git ];
            NIX_CONFIG = "experimental-features = nix-command flakes";
          };
        }
      );
}
