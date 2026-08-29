# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

let
  driftwm-flake = builtins.getFlake "github:malbiruk/driftwm";
in

{
  imports =
    [
      ./hardware-configuration.nix
      <home-manager/nixos>
      driftwm-flake.nixosModules.default
    ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.timeout = 0;

  # Nix
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Home Manager
  home-manager.users.karmoush = import ./home/karmoush.nix;

  # Networking
  networking.hostName = "karmoush";
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "Africa/Tunis";

  # Desktop
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;

  # Wayland compositors
  programs.hyprland.enable = true;

  # Printing
  services.printing.enable = true;

  # Audio
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Touchpad
  services.libinput.enable = true;

  # ------------------------------------------------------------
  # NVIDIA + AMD HYBRID GRAPHICS
  # ------------------------------------------------------------

  # Both GPUs are present:
  # AMD Radeon 680M:
  #   35:00.0 -> PCI:53@0:0:0
  #
  # NVIDIA RTX 4060 Mobile:
  #   01:00.0 -> PCI:1@0:0:0
  #
  # PRIME offload keeps the AMD iGPU handling the desktop while
  # allowing games/applications to use the RTX 4060 when requested.

  services.xserver.videoDrivers = [
    "amdgpu"
    "nvidia"
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Use NVIDIA's open kernel module.
    open = true;

    # Required/recommended for Wayland.
    modesetting.enable = true;

    # NVIDIA settings application.
    nvidiaSettings = true;

    prime = {
      offload.enable = true;
      offload.enableOffloadCmd = true;

      amdgpuBusId = "PCI:53@0:0:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };

  # ------------------------------------------------------------
  # STEAM / GAMING
  # ------------------------------------------------------------

  programs.steam = {
    enable = true;

    # Enable the GameScope Steam session.
    gamescopeSession.enable = true;

    # Protontricks support.
    protontricks.enable = true;
  };

  # GameMode service.
  programs.gamemode.enable = true;

  # GameScope.
  programs.gamescope.enable = true;

  # User
  users.users.karmoush = {
    isNormalUser = true;

    extraGroups = [
      "wheel"
    ];

    packages = with pkgs; [
      tree
    ];
  };

  # Flatpak
  services.flatpak.enable = true;

  # Firefox
  programs.firefox.enable = true;

  # Unfree packages
  nixpkgs.config.allowUnfree = true;

  # ------------------------------------------------------------
  # SYSTEM PACKAGES
  # ------------------------------------------------------------

  environment.systemPackages = with pkgs; [
    # ----------------------------------------------------------
    # Basic utilities
    # ----------------------------------------------------------
    git
    curl
    wget
    aria2

    neovim
    vim
    nano

    btop
    htop
    fastfetch
    tree
    file
    which

    unzip
    zip
    p7zip
    rsync
    wmctrl
    ripgrep
    fd
    fzf
    jq
    yq
    gtk3
    tmux
    zsh
    starship
    eza
    bat
    zoxide

    # ----------------------------------------------------------
    # Development
    # ----------------------------------------------------------
    shellcheck
    direnv
    nix-direnv
    kdotool
    gcc
    gnumake
    cmake
    pkg-config

    (pkgs.python3.withPackages (ps: [
      ps.evdev
    ]))

    nodejs
    rustc
    cargo
    go

    gdb
    strace
    ltrace

    # ----------------------------------------------------------
    # Hardware / system diagnostics
    # ----------------------------------------------------------
    pciutils
    usbutils
    lshw
    lm_sensors
    smartmontools
    nvme-cli

    brightnessctl

    # ----------------------------------------------------------
    # Media
    # ----------------------------------------------------------
    ffmpeg
    yt-dlp
    mpv
    cava
    imagemagick

    flameshot
    wl-clipboard
    grim
    slurp

    # ----------------------------------------------------------
    # GAMING
    # ----------------------------------------------------------

    # Steam is enabled through programs.steam above.
    # Keeping the package here would be redundant, so it is
    # intentionally not listed a second time.

    lutris
    protonup-qt

    # FPS / performance monitoring
    mangohud

    # Minecraft
    prismlauncher

    # Vulkan diagnostics
    vulkan-tools

    # Windows gaming / compatibility
    wineWowPackages.stable
    winetricks

    mgba
    # ----------------------------------------------------------
    # Virtualization
    # ----------------------------------------------------------
    virt-manager
    qemu
    libvirt
    docker
    docker-compose
    podman

    # ----------------------------------------------------------
    # Disk / filesystem tools
    # ----------------------------------------------------------
    gparted
    parted
    cryptsetup
    btrfs-progs
    efibootmgr
    lsof

    # ----------------------------------------------------------
    # Desktop / Wayland
    # ----------------------------------------------------------
    waypaper
    rofi
    noctalia-shell
    networkmanagerapplet
    pavucontrol
    playerctl
    blueman
    polkit_gnome

    xdg-utils
    xdg-user-dirs

    kitty
    hyprlauncher
    hyprpaper

    # ----------------------------------------------------------
    # Terminal / fun
    # ----------------------------------------------------------
    unimatrix
    tty-clock
    lavat

    # ----------------------------------------------------------
    # Applications
    # ----------------------------------------------------------
    spotify
    discord

    pokemon-colorscripts
    ani-cli
    tor-browser

    flatpak
    bazaar

    hyprshot

    # KDE applications
    kdePackages.dolphin
    kdePackages.ark
  ];

  # Firewall
  networking.firewall.enable = true;

  # NixOS state version
  system.stateVersion = "26.05";
}

