#!/bin/bash

ARR=()
ARR+=("Application:")
ARR+=(" terminal")
ARR+=(" filemanager (ranger)")
ARR+=(" filemanager (mc)")
ARR+=(" filemanager (thunar)")
ARR+=(" webbrowser (qutebrowser)")
ARR+=(" webbrowser (edge)")
ARR+=(" calculator")
ARR+=(" notion")
ARR+=(" libreoffice")
ARR+=(" telegram")
ARR+=(" 1password")
ARR+=("")
ARR+=("Development:")
ARR+=(" visual studio code")
ARR+=(" virt-manager")
ARR+=(" android studio")
ARR+=(" android emulator")
ARR+=(" drawio")
ARR+=(" figma")
ARR+=(" postman")
ARR+=(" remmina")
ARR+=(" dbeaver")
ARR+=(" github-desktop")
ARR+=(" neovim")
ARR+=(" rgb-tui")
ARR+=("")
ARR+=("Game Development:")
ARR+=(" unreal-engine")
ARR+=(" epic games launcher")
ARR+=(" unityhub")
ARR+=(" rider")
ARR+=(" aseprite")
ARR+=("")
ARR+=("Sound Programming:")
ARR+=(" ardour")
ARR+=(" audacity")
ARR+=(" ncmpcpp")
ARR+=(" cadence")
ARR+=("")
ARR+=("Graphics:")
ARR+=(" gimp")
ARR+=(" krita")
ARR+=(" azpainter")
ARR+=(" blender")
ARR+=(" darktable")
ARR+=(" fontforge")
ARR+=("")
ARR+=("Multimedia:")
ARR+=(" obsstudio")
ARR+=(" vlc")
ARR+=("")
ARR+=("Fun:")
ARR+=(" lutris")
ARR+=(" steam")
ARR+=(" dosbox")

CHOICE=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -l 20 -p "app")

case $CHOICE in
  " terminal (alacritty)") exec alacritty;;
  " filemanager (ranger)") exec alacritty -e ranger;;
  " filemanager (mc)") exec alacritty -e mc;;
  " filemanager (thunar)") exec thunar;;
 	" webbrowser (qutebrowser)") exec qutebrowser --target window;;
 	" webbrowser (edge)") exec microsoft-edge-stable;;
 	" email (mutt)") exec alacritty -e mutt;;
 	" calculator") exec rofi -show calc -modi calc -no-show-match -no-sort;;
 	" notion") exec notion-app;;
 	" libreoffice") exec libreoffice;;
  " telegram") exec telegram-desktop;;
  " bpytop") exec alacritty -e bpytop;;
  " 1password") exec 1password;;
	" visual studio code") exec code;;
  " virt-manager") exec virt-manager;;
  " android studio") exec ~/Android/Studio/bin/studio.sh;;
  " android emulator") exec ~/.local/bin/RunEmulator.sh;;
  " drawio") exec drawio;;
  " figma") exec figma-linux;;
  " postman") exec postman;;
  " remmina") exec remmina;;
  " dbeaver") exec dbeaver;;
  " github-desktop") exec github-desktop;;
  " neovim") exec alacritty -e nvim;;
  " rgb-tui") exec alacritty -e rgb-tui;;
  " unreal-engine") exec ~/UnrealEngine/Engine/Binaries/Linux/UnrealEditor;;
  " epic games launcher") env WINEPREFIX="/home/kyiimn/.wine" wine C:\\users\\kyiimn\\AppData\\Roaming\\Microsoft\\Windows\\Start\ Menu\\Programs\\Epic\ Games\ Launcher.lnk;;
  " unityhub") exec unityhub;;
  " rider") exec rider;;
  " aseprite") exec aseprite;;
  " audacity") exec audacity;;
  " zrythm") exec zrythm;;
  " ardour") exec ardour6;;
  " ncmpcpp") exec alacritty --title 'MPDClient-floating' -e ncmpcpp;;
  " cadence") exec cadence;;
  " gimp") exec gimp;;
  " krita") exec krita;;
  " azpainter") exec azpainter;;
  " inkscape") exec inkscape;;
  " blender") exec blender;;
  " scribus") exec scribus;;
  " darktable") exec darktable;;
  " texmaker") exec texmaker;;
  " fontforge") exec fontforge;;
  " obsstudio") exec obs;;
  " vlc") exec vlc;;
  " lutris") exec lutris;;
  " steam") exec steam;;
  " dosbox") exec dosbox-x;;
  " webbrowser (edge over tor)") exec google-chrome-stable --proxy-server="socks5://localhost:9050" --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE localhost";;
esac
