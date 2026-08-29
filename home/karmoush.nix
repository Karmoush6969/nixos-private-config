{ config, pkgs, ... }:

{
  home.username = "karmoush";
  home.homeDirectory = "/home/karmoush";

  home.stateVersion = "26.05";

  home.file = {
    ".scripts".source = ../scripts;

    ".config/btop".source = ../.config/btop;
    ".config/cava".source = ../.config/cava;
    ".config/fastfetch".source = ../.config/fastfetch;
    ".config/gtk-3.0".source = ../.config/gtk-3.0;
    ".config/gtk-4.0".source = ../.config/gtk-4.0;
    ".config/hypr".source = ../.config/hypr;
    ".config/kitty".source = ../.config/kitty;
    ".config/noctalia".source = ../.config/noctalia;

    ".config/kdeglobals".source =
      ../.config/kde/kdeglobals;

    ".config/kwinrc".source =
      ../.config/kde/kwinrc;

    ".config/plasmarc".source =
      ../.config/kde/plasmarc;
    ".pki/nssdb".source =
      ../.pki/nssdb;

    ".config/plasma-org.kde.plasma.desktop-appletsrc" = {
      source = ../.config/kde/plasma-org.kde.plasma.desktop-appletsrc;
      force = true;
    };

    ".config/GIMP/3.0".source = ../.config/GIMP/3.0;

    ".local/share/applications/org.gimp.GIMP.desktop".source =
      ../.local/share/applications/org.gimp.GIMP.desktop;

    ".local/share/icons/hicolor/photogimp.png".source =
      ../.local/share/icons/hicolor/photogimp.png;

    ".local/bin/karm-blue-layout.sh".source =
      ../scripts/karm-blue-layout.sh;

    "scripts".source = ../scripts;
  };

  programs.home-manager.enable = true;
}
