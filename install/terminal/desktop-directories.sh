mkdir -p "$HOME/.local/share/desktop-directories"

cat <<EOF > ~/.local/share/desktop-directories/codecompass.directory
[Desktop Entry]
Type=Directory
Name=CodeCompass
Comment=CodeCompass Tools
Icon=folder
Encoding=UTF-8
EOF

cat <<EOF > ~/.local/share/desktop-directories/interview.directory
[Desktop Entry]
Type=Directory
Name=Interview
Comment=Interview Preparation Resources
Icon=folder
Encoding=UTF-8
EOF
