#!/bin/bash

ARR=()
ARR+=("Application:")
ARR+=(" terminal (alacritty)")
ARR+=(" filemanager (ranger)")
ARR+=(" filemanager (mc)")
ARR+=(" filemanager (pcmanfm)")
ARR+=(" webbrowser (firefox)")
ARR+=(" webbrowser (chrome)")
ARR+=(" webbrowser (chrome over tor)")
ARR+=(" email (thunderbird)")
ARR+=(" calculator")
ARR+=(" joplin")
ARR+=(" libreoffice")
ARR+=(" telegram")
ARR+=(" discord")
ARR+=(" bpytop")
ARR+=(" system update (yay)")
ARR+=("")
ARR+=("Development:")
ARR+=(" visual studio code")
ARR+=(" virt-manager")
ARR+=(" remmina")
ARR+=(" dbeaver")
ARR+=(" pgmodeler")
ARR+=(" azure data studio")
ARR+=(" github-desktop")
ARR+=(" fontforge")
ARR+=(" lazarus")
ARR+=(" emacs")
ARR+=(" vim")
ARR+=("")
ARR+=("Game Development:")
ARR+=(" unreal-engine")
ARR+=(" unityhub")
ARR+=(" maya")
ARR+=(" blender")
ARR+=("")
ARR+=("Sound Programming:")
ARR+=(" flstudio")
ARR+=(" vocaloid")
ARR+=(" ardour")
ARR+=(" audacity")
ARR+=(" muse")
ARR+=(" rosegarden")
ARR+=(" svstudio")
ARR+=("")
ARR+=("Graphics:")
ARR+=(" gimp")
ARR+=(" photoshop")
ARR+=(" krita")
ARR+=(" inkscape")
ARR+=(" darktable")
ARR+=(" scribus")
ARR+=(" texmaker")
ARR+=("")
ARR+=("Multimedia:")
ARR+=(" obsstudio")
ARR+=(" davinci resolve")
ARR+=(" mpdclient (ncmpcpp)")
ARR+=(" videoplayer (vlc)")
ARR+=("")
ARR+=("Fun:")
ARR+=(" lutris")
ARR+=(" steam")
ARR+=(" mame")
ARR+=(" matrix")

CHOICE=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -lines 25 -p "app" -theme ~/.config/rofi/nord.rasi)

case $CHOICE in
	" obsstudio") exec obs;;
    " lutris") exec lutris;;
	" svstudio") exec svstudio;;
	" vocaloid") excc /usr/share/playonlinux/playonlinux --run 'Vocaloid4FE' ;;
	" unityhub") exec unityhub;;
    	" blender") exec blender;;
    	" maya") exec /usr/autodesk/maya2020/bin/maya2020;;
	" unreal-engine") exec ~/UnrealEngine/Engine/latest/Engine/Binaries/Linux/UE4Editor;;
	" joplin") exec /opt/appimages/Joplin.AppImage;;
    	" calculator") exec rofi -show calc -modi calc -no-show-match -no-sort;;
    	" google keep") exec google-keep;;
    	" emacs") exec emacs;;
	" filemanager (pcmanfm)") exec pcmanfm;;
	" itch") exec itch;;
	" ankama") exec ankama-launcher;;
	" gambas3") exec gambas3;;
	" lazarus") exec lazarus;;
	" terminal (alacritty)") exec alacritty;;
	" filemanager (vifm)") exec alacritty -e vifmrun;;
	" filemanager (mc)") exec alacritty -e mc;;
    	" filemanager (ranger)") exec alacritty -e ranger;;
    	" filemanager (pcmanfm)") exec pcmanfm;;
	" webbrowser (qutebrowser)") exec qutebrowser --target window;;
	" telegram") exec telegram-desktop;;
	" gotop") exec alacritty -e gotop;;
    	" bpytop") exec alacritty -e bpytop;;
	" system update (yay)") exec alacritty --title 'System Update' -e ~/.config/scripts/pause yay -Syyu;;
	" email (thunderbird)") exec thunderbird;;
	" discord") exec discord;;
	" visual studio code") exec code;;
	" vim") exec alacritty -e vim;;
	" emacs") exec emacs;;
	" dbeaver") exec dbeaver;;
	" mpdclient (ncmpcpp)") exec alacritty --title 'MPDClient-floating' -e ncmpcpp;;
	" videoplayer (vlc)") exec vlc;;
	" steam") exec steam;;
	" virt-manager") exec virt-manager;;
	" libreoffice") exec libreoffice;;
    	" azure data studio") exec azuredatastudio;;
	" mame") exec mame;;
	" gimp") exec gimp;;
	" davinci resolve") exec /opt/resolve/bin/resolve;;
	" audacity") exec audacity;;
	" photoshop") exec wine ~/.wine/drive_c/Photoshop7/Photoshop.exe;;
	" krita") exec krita;;
	" flstudio") exec /usr/share/playonlinux/playonlinux --run 'FLStudio 20' ;;
    	" remmina") exec remmina;;
	" darktable") exec darktable;;
	" matrix") exec alacritty --title 'Matrix' -e ncmatrix;;
	" fontforge") exec fontforge;;
    	" github-desktop") exec github-desktop;;
    	" webbrowser (chrome)") exec google-chrome-stable;;
    	" webbrowser (chrome over tor)") exec google-chrome-stable --proxy-server="socks5://localhost:9050" --host-resolver-rules="MAP * ~NOTFOUND , EXCLUDE localhost";;
    	" inkscape") exec inkscape;;
    	" texmaker") exec texmaker;;
    	" scribus") exec scribus;;
    	" muse") exec muse3;;
    	" ardour") exec ardour6;;
    	" rosegarden") exec rosegarden;;
    	" webbrowser (firefox)") exec firefox-developer-edition;;
    	" pgmodeler") exec pgmodeler;;
esac
