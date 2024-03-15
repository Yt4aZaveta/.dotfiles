#░█▀▄▀█░▄▀▀▄░█▀▀▄░░▀░░▀█▀░▄▀▀▄░█▀▀▄░█▀▀
#░█░▀░█░█░░█░█░▒█░░█▀░░█░░█░░█░█▄▄▀░▀▀▄
#░▀░░▒▀░░▀▀░░▀░░▀░▀▀▀░░▀░░░▀▀░░▀░▀▀░▀▀▀
xrandr --output eDP --auto --pos 0x0 --output DisplayPort-0 --auto --pos 0x-1080

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh

# For nemo
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty
