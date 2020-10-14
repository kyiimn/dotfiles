#!/bin/bash

ARR=()
ARR+=("Application:")
ARR+=(" terminal (alacritty)")
ARR+=(" filemanager (polo)")
ARR+=(" filemanager (vifm)")
ARR+=(" filemanager (mc)")
ARR+=(" webbrowser (qutebrowser)")
ARR+=(" webbrowser (firefox)")
ARR+=(" webbrowser (chrome)")
ARR+=(" email (thunderbird)")
ARR+=(" libreoffice")
ARR+=(" vim")
ARR+=(" telegram")
ARR+=(" discord")
ARR+=(" gotop")
ARR+=(" system update (yaourt)")
ARR+=("")
ARR+=("Development:")
ARR+=(" visual studio code")
ARR+=(" dbeaver")
ARR+=(" firefox-developer")
ARR+=(" github-desktop")
ARR+=(" virtualmachine (virt-manager)")
ARR+=(" fontforge")
ARR+=(" remmina")
ARR+=(" lazarus")
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
ARR+=("Sound Programming:")
ARR+=(" flstudio")
ARR+=(" audacity")
ARR+=(" ardour")
ARR+=(" muse")
ARR+=(" rosegarden")
ARR+=("")
ARR+=("Multimedia:")
ARR+=(" obsstudio")
ARR+=(" davinci resolve")
ARR+=(" mpdclient (ncmpcpp)")
ARR+=(" videoplayer (vlc)")
ARR+=("")
ARR+=("Fun:")
ARR+=(" steam")
ARR+=(" mame")
ARR+=(" matrix")

CHOICE=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -lines 45 -p "app")

case $CHOICE in
	" filemanager (pcmanfm)") i3-msg "exec pcmanfm";;
	" itch") i3-msg "exec itch";;
	" ankama") i3-msg "exec ankama-launcher";;
	" gambas3") i3-msg "exec gambas3";;
	" lazarus") i3-msg "exec lazarus";;
	" terminal (alacritty)") i3-msg "exec alacritty -e tmux";;
	" filemanager (vifm)") i3-msg "exec alacritty -e vifmrun";;
	" filemanager (mc)") i3-msg "exec alacritty -e mc";;
	" webbrowser (qutebrowser)") i3-msg "exec qutebrowser --target window";;
	" telegram") i3-msg "exec telegram-desktop";;
	" gotop") i3-msg "exec alacritty -e gotop";;
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
	" virtualmachine (virt-manager)") i3-msg "exec virt-manager";;
	" libreoffice") i3-msg "exec libreoffice";;
	" mame") i3-msg "exec mame";;
	" chromium") i3-msg "exec chromium";;
	" gimp") i3-msg "exec gimp";;
	" davinci resolve") i3-msg "exec /opt/resolve/bin/resolve";;
	" audacity") i3-msg "exec audacity";;
	" photoshop") i3-msg "exec wine ~/.wine/drive_c/Photoshop7/Photoshop.exe";;
	" krita") i3-msg "exec krita";;
	" flstudio") i3-msg "exec wine ~/.wine/drive_c/FLStudio20/FL64.exe";;
    " remmina") i3-msg "exec remmina";;
	" darktable") i3-msg "exec darktable";;
	" matrix") i3-msg "exec alacritty --title 'Matrix' -e ncmatrix";;
	" fontforge") i3-msg "exec fontforge";;
    " github-desktop") i3-msg "exec github-desktop";;
    " obsstudio") i3-msg "exec obs";;
    " webbrowser (chrome)") i3-msg "exec google-chrome-beta";;
    " inkscape") i3-msg "exec inkscape";;
    " texmaker") i3-msg "exec texmaker";;
    " scribus") i3-msg "exec scribus";;
    " muse") i3-msg "exec muse3";;
    " ardour") i3-msg "exec ardour6";;
    " rosegarden") i3-msg "exec rosegarden";;
    " webbrowser (firefox)") i3-msg "exec firefox";;
    " firefox-developer") i3-msg "exec firefox-developer-edition";;
    " filemanager (polo)") i3-msg "exec polo-gtk";;
esac
