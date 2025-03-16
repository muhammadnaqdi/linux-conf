apt -y update
apt -y full-upgrade
apt -y install build-essential gdb linux-headers-amd64 cmake clang clangd libclang-dev default-jdk mit-scheme sbcl emacs vim alacritty vlc qbittorrent openconnect git unzip p7zip-full wget curl aria2 ffmpeg htop pkg-config texinfo pandoc flatpak neofetch redshift picom nitrogen numlockx libghc-xmonad-contrib-dev suckless-tools xmonad xmobar scrot byzanz smlnj unclutter trayer blueman notification-daemon pcmanfm
apt -y purge ibus
apt -y autopurge
apt -y clean

mkdir -p /etc/sysctl.d

cp -f keyboard /etc/default/keyboard
cp -f fonts/* /usr/local/share/fonts/
cp -f 99-max-map-count.conf /etc/sysctl.d/99-max-map-count.conf

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

DEBIAN_CODENAME=$(lsb_release -c | awk '{print $2}')

if [ "$DEBIAN_CODENAME" = "bookworm" ];
then
    mkdir -p /etc/apt/preferences.d
    cp -f preferences.d/* /etc/apt/preferences.d/
    cp -f sources.list /etc/apt/sources.list
    
    apt -y install -t bookworm-backports emacs
fi
