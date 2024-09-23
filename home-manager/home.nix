{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home = {
    username = "victor.flament";
    homeDirectory = "/home/victor.flament";

    packages = with pkgs; [
      neofetch
      neovim
      lua-language-server
      clang-tools
      rofi
      starship
      fish
      man-pages
      pfetch
      tldr
      eza
      bat
      zsh
      ripgrep
      fd
      bat
      picom
      polybarFull

      hyprland
      swaylock-effects
      kitty
      dunst
      waybar
      eww
      yazi
    ];

    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;
  };

  programs.kitty.enable = true; # required for the default Hyprland config
  wayland.windowManager.hyprland.enable = true; # enable Hyprland

}
