#!/bin/sh

mv ~/.config/hypr ~/.config/hyprv
mv ~/.config/kitty ~/.config/kittyv

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

unzip ~/.config/i3/CascadiaCode.zip -d ~/.local/share/fonts
fc-cache -f -v

picom &
polybar &

rm -rf ~/.config/hypr
rm -rf ~/.config/kitty
cp -r ~/.config/hyprv ~/.config/hypr
cp -r ~/.config/kittyv ~/.config/kitty

feh --bg-fill "$HOME/.config/i3/Wallpapers/fairy.png"
xset r rate 250
