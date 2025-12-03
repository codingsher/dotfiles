#!/usr/bin/env bash

set -e

echo "=== Updating system ==="
sudo pacman -Syu --noconfirm

echo "=== Installing essential packages ==="
sudo pacman -S --noconfirm --needed \
    neovim \
    tmux \
    zsh \
    firefox \
    rofi \
    i3status \
    brightnessctl \
    feh \
    fzf \
    grep \
    ripgrep \
    bat \
    tree \
    git \
    openssh \
    curl \
    wget \
    nodejs \
    npm \
    go \
    cmake \
    clang \
    clang18 \
    clang19 \
    clang20 \
    gcc \
    make \
    docker \
    acpi \
    vlc \
    thunar \
    postgresql \

echo "=== Essential packages ==="

# Enable and start Docker
sudo systemctl enable --now docker.service

# Add user to docker group
if ! groups $USER | grep -q docker; then
    echo "=== Adding $USER to docker group ==="
    sudo usermod -aG docker $USER
    echo ">>> You must log out and log back in for docker group permissions to apply."
fi

# Install paru if missing
if ! command -v paru &>/dev/null; then
    echo "=== Installing paru (AUR helper) ==="
    sudo pacman -S --noconfirm --needed base-devel git

    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru
    makepkg -si --noconfirm
    cd -
fi

echo "=== paru installed ==="

# AUR packages via paru
echo "=== Installing AUR packages with paru ==="
paru -S --noconfirm --needed \
    brave-bin \
    google-chrome-bin \
    gromit-mpx \
    greenclip \

echo "=== AUR packages installed ==="

# Oh-My-Zsh setup
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "=== Installing Oh-My-Zsh ==="
    export RUNZSH="no"
    export CHSH="no"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "=== Oh-My-Zsh already installed ==="
fi

# Default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "=== Setting Zsh as default shell ==="
    chsh -s "$(which zsh)"
fi

echo "=== Setup complete! ==="
echo ">>> Reboot or log out and log back in (for Docker + Zsh)."

