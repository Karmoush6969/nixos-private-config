# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 3;
  boot.loader.timeout = 0;  



  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  home-manager.users.karmoush = import ./home/karmoush.nix;

  networking.hostName = "karmoush"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;


  # Set your time zone.
   time.timeZone = "Africa/Tunis";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.enable = true;
  programs.hyprland.enable = true;
  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
   services.printing.enable = true;

  # Enable sound.
  # services.pulseaudio.enable = true;
  # OR
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  # Enable touchpad support (enabled default in most desktopManager).
   services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.karmoush = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
       tree
     ];
   };
   services.flatpak.enable = true;
   programs.firefox.enable = true;
   nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
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
     python3
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

   ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
   networking.firewall.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}

