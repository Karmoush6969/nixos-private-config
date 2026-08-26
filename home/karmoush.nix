{ config, pkgs, ... }:

{
  home.username = "karmoush";
  home.homeDirectory = "/home/karmoush";

  home.stateVersion = "26.05";

  home.file = {
    ".config/btop".source = ../.config/btop;
    ".config/cava".source = ../.config/cava;
    ".config/fastfetch".source = ../.config/fastfetch;
    ".config/gtk-3.0".source = ../.config/gtk-3.0;
    ".config/gtk-4.0".source = ../.config/gtk-4.0;
    ".config/hypr".source = ../.config/hypr;
    ".config/kitty".source = ../.config/kitty;
    ".config/noctalia".source = ../.config/noctalia;
  };

  programs.home-manager.enable = true;
}
