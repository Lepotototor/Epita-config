#!/bin/sh

feh --bg-fill "$HOME/.config/i3/Wallpapers/hello-kitty-antifa.jpg"

cp -r ~/.config/kitty ~/.config/kitty-backup
rm -rf ~/.config/kitty

nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
nix-channel --add https://github.com/nixos/nixpkgs/archive/refs/tags/25.11.tar.gz nixpkgs
nix-channel --update

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-shell '<home-manager>' -A install

nix profile install github:NixOS/nixpkgs/nixos-unstable#neovim

fc-cache -f -v

systemd-run --user picom

rm -rf ~/.config/kitty
mv ~/.config/kitty-backup ~/.config/kitty

feh --bg-fill "$HOME/.config/i3/Wallpapers/hello-kitty-antifa.jpg"
xset r rate 250

mkdir ~/.local/share/fonts
[ ! -d ~/.local/share/fonts/CascadiaCode ] && \
     tar -xf ~/.config/i3/CascadiaCode.tar.xz -C ~/.local/share/fonts && \
fc-cache -f -v

systemd-run --user polybar

# keep terminal open
systemd-run --user kitty

