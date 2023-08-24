#!/bin/bash

distro=$(lsb_release -si)

tools=("python3" "go_lang")

if [[ $distro == "Ubuntu" ]]; then
    sudo apt update
    sudo apt install "${tools[@]}"
elif [[ $distro == "Fedora" ]]; then
    sudo dnf update
    sudo dnf install "${tools[@]}"
elif [[ $distro == "Arch" ]]; then
    sudo pacman -Syu
    sudo pacman -S "${tools[@]}"
elif [[ $distro == "CentOS" ]]; then
    sudo yum update
    sudo yum install "${tools[@]}"
elif [[ $distro == "Debian" ]]; then
    sudo apt update
    sudo apt install "${tools[@]}"
elif [[ $distro == "OpenSUSE" ]]; then
    sudo zypper refresh
    sudo zypper install "${tools[@]}"
elif [[ $distro == "Gentoo" ]]; then
    sudo emerge --sync
    sudo emerge "${tools[@]}"
elif [[ $distro == "Alpine" ]]; then
    sudo apk update
    sudo apk add "${tools[@]}"
elif [[ $distro == "FreeBSD" ]]; then
    sudo pkg update
    sudo pkg install "${tools[@]}"
elif [[ $distro == "OpenBSD" ]]; then
    sudo pkg_add "${tools[@]}"
elif [[ $distro == "Manjaro" ]]; then
    sudo pacman -Syu
    sudo pacman -S "${tools[@]}"
elif [[ $distro == "Solus" ]]; then
    sudo eopkg update-repo
    sudo eopkg install "${tools[@]}"
elif [[ $distro == "Void" ]]; then
    sudo xbps-install -Syu
    sudo xbps-install -S "${tools[@]}"
else
    echo "The disto you are using is not supported yet": $distro"
    exit 1
fi
