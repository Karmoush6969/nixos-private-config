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

  # System packages
  environment.systemPackages = with pkgs; [
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

    ripgrep
    fd
    fzf
    jq
    yq

    tmux
    zsh
    starship
    eza
    bat
    zoxide

    shellcheck
    direnv
    nix-direnv

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

    pciutils
    usbutils
    lshw
    lm_sensors
    smartmontools
    nvme-cli

    brightnessctl

    ffmpeg
    yt-dlp
    mpv
    cava
    imagemagick

    flameshot
    wl-clipboard
    grim
    slurp

    steam
    lutris
    protonup-qt
    mangohud
    gamemode
    prismlauncher

    virt-manager
    qemu
    libvirt
    docker
    docker-compose
    podman

    gparted
    parted
    cryptsetup
    btrfs-progs
    efibootmgr
    lsof

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

    unimatrix
    tty-clock
    lavat

    spotify
    discord

    pokemon-colorscripts
    ani-cli
    tor-browser

    flatpak
    bazaar

    hyprshot

    kdePackages.dolphin
    kdePackages.ark
  ];

  # Firewall
  networking.firewall.enable = true;

  # NixOS state version
  system.stateVersion = "26.05";
}
