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

      fastfetch
      kitty
      dunst
      yazi

      vtsls
      prettierd
      prettier
      eslint_d
      eslint

	  libnotify
	
	  (pkgs.python313.withPackages (ppkgs: [
		ppkgs.beautifulsoup4
		ppkgs.types-beautifulsoup4
		ppkgs.requests
	  ]))
    ];

    stateVersion = "25.11";
  };

  programs = {
    home-manager.enable = true;
    command-not-found.enable = true;
    neovim = {
      enable = true;
      extraPackages = with pkgs; [
		vscode-langservers-extracted

        clang-tools
        lua-language-server
		cppcheck
		selene

        vtsls
        prettierd
        nodePackages.prettier
        eslint_d
        eslint
		nodejs
      ];
    };
  };

  programs.kitty.enable = true; # required for the default Hyprland config
  # wayland.windowManager.hyprland.enable = true; # enable Hyprland
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.displayManager.sddm.wayland.enable = true;

}
