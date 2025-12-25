bascially you can install in your ubtunu or in a live virtula box virtuual i like box rather then vm box or vmararw
install gnome box 
install ubuntu 24 
install ubtunu 24 on device (this wont work live due to unsufficent storege )
then run teh script 
curl -sSL https://raw.githubusercontent.com/CodeCompasss/codekub/refs/heads/dev/boot.sh| bash

then for furhter testing 

rm -rf ~/.config ~/.local ~/.cache ~/.themes ~/.icons ~/.fonts ~/.mozilla ~/.gnome ~/.nv ~/.var ~/.pki ~/.java ~/.kde ~/.dbus ~/Desktop && mkdir ~/Desktop && dconf reset -f / && sudo reboot

tehn form ntail step onwards again 