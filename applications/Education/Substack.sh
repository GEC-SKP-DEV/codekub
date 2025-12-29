
cat <<EOF > ~/.local/share/applications/Substack.desktop
[Desktop Entry]
Name=Substack
Comment=Read and write newsletters
Exec=xdg-open https://substack.com/
Icon=/home/$USER/.local/share/omakub/applications/icons/Substack.png
Terminal=false
Type=Application
Categories=Education;News;
StartupNotify=true
EOF
