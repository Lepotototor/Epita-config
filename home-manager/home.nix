{ config, pkgs, ... }

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
      exa
      bat
      zsh
      ripgrep
      fd
      bat
      picom
      nerdfonts
      polybarFull

      (pkgs.nerdfonts.override { fonts = [ "Hack" ]; })
    ];

    stateVersion = "23.05";
  };

  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;
  };
}
