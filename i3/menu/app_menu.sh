#!/bin/bash

ARR=()
ARR+=("Application:")
ARR+=(" terminal (alacritty)")
ARR+=(" filemanager (ranger)")
ARR+=(" filemanager (mc)")
ARR+=(" filemanager (pcmanfm)")
ARR+=(" webbrowser (firefox)")
ARR+=(" webbrowser (chrome)")
ARR+=(" email (thunderbird)")
ARR+=(" calculator")
ARR+=(" joplin")
ARR+=(" libreoffice")
ARR+=(" telegram")
ARR+=(" discord")
ARR+=(" bpytop")
ARR+=(" system update (yaourt)")
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

CHOICE=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -lines 25 -p "app")

case $CHOICE in
    " lutris") i3-msg "exec lutris";;
	" svstudio") i3-msg "exec svstudio";;
	" vocaloid") i3-msg "excc /usr/share/playonlinux/playonlinux --run 'Vocaloid4FE' ";;
	" unityhub") i3-msg "exec unityhub";;
    	" blender") i3-msg "exec blender";;
    	" maya") i3-msg "exec /usr/autodesk/maya2020/bin/maya2020";;
	" unreal-engine") i3-msg "exec ~/UnrealEngine/Engine/latest/Engine/Binaries/Linux/UE4Editor";;
	" joplin") i3-msg "exec /opt/appimages/Joplin.AppImage";;
    	" calculator") i3-msg "exec rofi -show calc -modi calc -no-show-match -no-sort";;
    	" google keep") i3-msg "exec google-keep";;
    	" emacs") i3-msg "exec emacs";;
	" filemanager (pcmanfm)") i3-msg "exec pcmanfm";;
	" itch") i3-msg "exec itch";;
	" ankama") i3-msg "exec ankama-launcher";;
	" gambas3") i3-msg "exec gambas3";;
	" lazarus") i3-msg "exec lazarus";;
	" terminal (alacritty)") i3-msg "exec alacritty";;
	" filemanager (vifm)") i3-msg "exec alacritty -e vifmrun";;
	" filemanager (mc)") i3-msg "exec alacritty -e mc";;
    	" filemanager (ranger)") i3-msg "exec alacritty -e ranger";;
    	" filemanager (pcmanfm)") i3-msg "exec pcmanfm";;
	" webbrowser (qutebrowser)") i3-msg "exec qutebrowser --target window";;
	" telegram") i3-msg "exec telegram-desktop";;
	" gotop") i3-msg "exec alacritty -e gotop";;
    	" bpytop") i3-msg "exec alacritty -e bpytop";;
	" system update (yaourt)") i3-msg "exec alacritty --title yaourt -e systemupdate.sh";;
	" email (thunderbird)") i3-msg "exec thunderbird";;
	" discord") i3-msg "exec discord";;
	" visual studio code") i3-msg "exec code";;
	" vim") i3-msg "exec alacritty -e vim";;
	" emacs") i3-msg "exec emacs";;
	" dbeaver") i3-msg "exec dbeaver";;
	" mpdclient (ncmpcpp)") i3-msg "exec alacritty --title 'MPDClient-floating' -e ncmpcpp";;
	" videoplayer (vlc)") i3-msg "exec vlc";;
	" steam") i3-msg "exec steam";;
	" virt-manager") i3-msg "exec virt-manager";;
	" libreoffice") i3-msg "exec libreoffice";;
    	" azure data studio") i3-msg "exec azuredatastudio";;
	" mame") i3-msg "exec mame";;
	" chrome") i3-msg "exec chrome";;
	" gimp") i3-msg "exec gimp";;
	" davinci resolve") i3-msg "exec /opt/resolve/bin/resolve";;
	" audacity") i3-msg "exec audacity";;
	" photoshop") i3-msg "exec wine ~/.wine/drive_c/Photoshop7/Photoshop.exe";;
	" krita") i3-msg "exec krita";;
	" flstudio") i3-msg "exec /usr/share/playonlinux/playonlinux --run 'FLStudio 20' ";;
    	" remmina") i3-msg "exec remmina";;
	" darktable") i3-msg "exec darktable";;
	" matrix") i3-msg "exec alacritty --title 'Matrix' -e ncmatrix";;
	" fontforge") i3-msg "exec fontforge";;
    	" github-desktop") i3-msg "exec github-desktop";;
    	" obsstudio") i3-msg "exec obs";;
    	" webbrowser (chrome)") i3-msg "exec google-chrome-stable";;
    	" inkscape") i3-msg "exec inkscape";;
    	" texmaker") i3-msg "exec texmaker";;
    	" scribus") i3-msg "exec scribus";;
    	" muse") i3-msg "exec muse3";;
    	" ardour") i3-msg "exec ardour6";;
    	" rosegarden") i3-msg "exec rosegarden";;
    	" webbrowser (firefox)") i3-msg "exec firefox-developer-edition";;
    	" pgmodeler") i3-msg "exec pgmodeler";;
esac
