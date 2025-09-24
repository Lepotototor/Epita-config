#!/bin/sh

cp -r ~/.config/kitty ~/.config/kitty-backup
rm -rf ~/.config/kitty

nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.05.tar.gz home-manager
nix-channel --add https://github.com/nixos/nixpkgs/archive/refs/tags/24.05.tar.gz nixpkgs
nix-channel --update

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-shell '<home-manager>' -A install

nix profile install nixpkgs#neovim

unzip ~/.config/i3/CascadiaCode.zip -d ~/.local/share/fonts
fc-cache -f -v

systemd-run --user picom
systemd-run --user polybar
#polybar &

rm -rf ~/.config/kitty
mv ~/.config/kitty-backup ~/.config/kitty

feh --bg-fill "$HOME/.config/i3/Wallpapers/hello-kitty-antifa.jpg"
xset r rate 250

# keep terminal open
#fish
systemd-run --user kitty
