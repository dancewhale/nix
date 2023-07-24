{ inputs, config, pkgs, lib, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../common/dewm/sway.nix # Include this for a lighter DE
    # ../common/dewm/kdeplasma.nix # Include this for fucking plasma desktop
    ../common/dewm/gnome.nix # Include this for Gnome (the best of all)
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #networking.hostName = "nuggets"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Asia/Shanghai";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = lib.mkDefault true;
  networking.networkmanager.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  services.xserver = {
    enable = true;
 #   videosDrivers = ["nvidia"];
    displayManager.gdm = {
        enable = true;
        wayland = true;
    };
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = false;
  };

  # hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    nvidiaPatches = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";


  # Use same config for linux console
  console.useXkbConfig = true;

  # Prevent Spotify from muting when another audio source is running
  hardware.pulseaudio.extraConfig = "unload-module module-role-cork";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Enable fish
  programs.fish.enable = true;

  # Enable dconf editor
  programs.dconf.enable = true;

  # Enable Nix Flakes
  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nix_2_7
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Optimize Nix Store storage consumption
  nix.settings.auto-optimise-store = true;

  # Run Nix garbage collector every week
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    curl
    exfat
    fish
    fuse
    gcc
    git
    gnumake
    neovim
    python3
    tree
    wget
  ];

  # Set Neovim as default editor
  environment.variables.EDITOR = "nvim";
  environment.variables.DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = "1";

  virtualisation = {
    docker.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      Macs = [ "hmac-sha1" "hmac-sha1-96" "hmac-md5" "hmac-sha2-512-etm@openssh.com" "hmac-sha2-256-etm@openssh.com" "umac-128-etm@openssh.com" "hmac-sha2-512" "hmac-sha2-256"];
    };
    extraConfig = "PubkeyAcceptedAlgorithms +ssh-rsa";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ 3000 5000 ];
  # networking.firewall.allowedUDPPorts = [ 3000 5000 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
