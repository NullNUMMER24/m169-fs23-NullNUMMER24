#Update the System
sudo pacman -Syy

#Clone the git repo from snapd
git clone https://aur.archlinux.org/snapd.git
cd snapd

#Make Snapd
makepkg -si

#Enable Snapd
sudo systemctl enable --now snapd.socket
