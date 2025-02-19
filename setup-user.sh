mkdir -p ~/backgrounds ~/gits ~/keys ~/scripts ~/tmp ~/.config/alacritty ~/.xmonad ~/roms ~/apps ~/projects

cp -f vimrc ~/.vimrc
cp -f init.el ~/.emacs
cp -f alacritty.yml ~/.config/alacritty/alacritty.yml
cp -f scripts/* ~/scripts/
cp -f xmobarrc ~/.xmobarrc
cp -f xmonad.hs ~/.xmonad/xmonad.hs
cp -f backgrounds/plain.png ~/backgrounds/plain.png

if [[ -z $(grep '# user' ~/.profile) ]]
then
    cat profile >> ~/.profile
fi

if [[ -z $(grep '# user' ~/.bashrc) ]]
then
    cat bashrc >> ~/.bashrc
fi

systemctl --user enable emacs
