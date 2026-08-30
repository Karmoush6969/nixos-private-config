{ config, pkgs, ... }:

{
  home.username = "karmoush";
  home.homeDirectory = "/home/karmoush";

  home.stateVersion = "26.05";

  home.file = {
    ".scripts" = {
      source = ../scripts;
      force = true;
    };

    ".pki/nssdb" = {
      source = ../.pki/nssdb;
      force = true;
    };

    ".config/btop" = {
      source = ../.config/btop;
      force = true;
    };

    ".config/cava" = {
      source = ../.config/cava;
      force = true;
    };

    ".config/fastfetch" = {
      source = ../.config/fastfetch;
      force = true;
    };

    ".config/gtk-3.0" = {
      source = ../.config/gtk-3.0;
      force = true;
    };

    ".config/gtk-4.0" = {
      source = ../.config/gtk-4.0;
      force = true;
    };

    ".config/hypr" = {
      source = ../.config/hypr;
      force = true;
    };

    ".config/kitty" = {
      source = ../.config/kitty;
      force = true;
    };

    ".config/noctalia" = {
      source = ../.config/noctalia;
      force = true;
    };

    ".config/kdeglobals" = {
      source = ../.config/kde/kdeglobals;
      force = true;
    };

    ".config/kwinrc" = {
      source = ../.config/kde/kwinrc;
      force = true;
    };

    ".config/plasmarc" = {
      source = ../.config/kde/plasmarc;
      force = true;
    };

    ".config/plasma-org.kde.plasma.desktop-appletsrc" = {
      source = ../.config/kde/plasma-org.kde.plasma.desktop-appletsrc;
      force = true;
    };

    ".config/GIMP/3.0" = {
      source = ../.config/GIMP/3.0;
      force = true;
    };

    ".local/share/applications/org.gimp.GIMP.desktop" = {
      source = ../.local/share/applications/org.gimp.GIMP.desktop;
      force = true;
    };

    ".local/share/icons/hicolor/photogimp.png" = {
      source = ../.local/share/icons/hicolor/photogimp.png;
      force = true;
    };
  };

  programs.home-manager.enable = true;
}
:::

Then run:

```bash
sudo nixos-rebuild switch
