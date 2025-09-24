{ config, pkgs, ... }:

{
  fonts.fontconfig.enable = true;

  home = {
    username = "victor.flament";
    homeDirectory = "/home/victor.flament";

    packages = with pkgs; [
      lua-language-server
      clang-tools
      rofi
      starship
      fish
      man-pages
      tldr
      eza
      bat
      ripgrep
      fd
      bat
      picom
      polybarFull

      kitty
      dunst
      yazi
    ];

    stateVersion = "24.05";
  };

  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;
    neovim = {
      enable = true;
      extraPackages = with pkgs; [
        clang-tools
        lua-language-server
      ];
    };
  };

  programs.kitty.enable = true; # required for the default Hyprland config
  # wayland.windowManager.hyprland.enable = true; # enable Hyprland
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.displayManager.sddm.wayland.enable = true;

}
