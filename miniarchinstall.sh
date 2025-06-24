#!/bin/sh -e

echo "This script is to be run after partitioning your disk and formatting the partitions. (The Pre-installation section in the arch wiki.)"
echo "This script expects the root to be mounted at /mnt and the EFI partition to be mounted at /efi."
echo "Press Enter to continue..."
read -r

# reflector --protocol https,rsync --latest 5 --sort delay --save /etc/pacman.d/mirrorlist

packages=(
    # Base packages
    base{,-devel}
    linux{,-firmware}
    intel-ucode
    nvidia-open
    sof-firmware
    networkmanager
    # Bootloader
    grub
    efibootmgr
    os-prober
    # Desktop environment, essential apps, and utilities
    sudo
    sddm
    plasma
    hyprland hyprlock hyprpaper
    kitty
    waybar
    git
    openssh
    neovim
    man-{db,pages}
    texinfo
    libreoffice-fresh
    reflector
    docker
    # Games and entertainment
    steam
    discord
    qbittorrent
    jellyfin-{server,web}
)

sed -i '/^#\[multilib\]/{s/^#//;n;s/^#//;}' /etc/pacman.conf
pacstrap -K /mnt "${packages[@]}"

genfstab -U /mnt > /mnt/etc/fstab

ln -sf /mnt/usr/share/zoneinfo/Africa/Cairo /mnt/etc/localtime

arch-chroot /mnt hwclock --systohc

sed -i '/^#en_US.UTF-8 UTF-8/s/^#//' /mnt/etc/locale.gen

echo 'LANG=en_US.UTF-8' > /mnt/etc/locale.conf
echo 'KEYMAP=dvorak-programmer' > /mnt/etc/vconsole.conf
echo 'Archie' > /mnt/etc/hostname

sed -i '/^#GRUB_DISABLE_OS_PROBER=false/s/^#//' /mnt/etc/default/grub
arch-chroot /mnt grub-install --efi-directory=/efi
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

echo "EDITOR=nvim\nMANPAGER='nvim +Man!'" > /mnt/etc/environment

sed -i '/^#\[multilib\]/{s/^#//;n;s/^#//;}' /mnt/etc/pacman.conf

arch-chroot /mnt systemctl enable NetworkManager sddm jellyfin docker.socket

# FIX:
arch-chroot /mnt git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin && cd /tmp/yay-bin && makepkg -si --noconfirm

sed -i '/^# %wheel ALL=(ALL:ALL) ALL/s/^# //' /mnt/etc/sudoers

echo 'Change the root password (run passwd) and create a user (run useradd -m -G wheel -s /bin/bash username)'

arch-chroot /mnt

umount -R /mnt
reboot
