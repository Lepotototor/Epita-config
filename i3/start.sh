#!/bin/sh

bg=0
CHANGE_BG() 
{
	killall i3lock &> /dev/null
	feh --bg-fill "$HOME/.config/i3/img/loadings/loading$bg.png"
	bg=$(($bg+1))
	i3lock -p win -i "$HOME/.config/i3/img/loadings/loading$bg.png"
}

nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
nix-channel --add https://github.com/nixos/nixpkgs/archive/refs/tags/24.05.tar.gz nixpkgs
nix-channel --update

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-shell '<home-manager>' -A install

xset r rate 250
