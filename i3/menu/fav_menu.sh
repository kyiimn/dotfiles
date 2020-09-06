#!/bin/bash

ARR=()
ARR+=("naver")
ARR+=("google")
ARR+=("google drive")
ARR+=("facebook")
ARR+=("youtube")
ARR+=("portainer")
ARR+=("onedrive")

CHOICE=$(printf '%s\n' "${ARR[@]}" | rofi -dmenu -p "fav")

case $CHOICE in
	"naver") i3-msg "exec xdg-open https://www.naver.com/";;
	"google") i3-msg "exec xdg-open https://www.google.com/";;
	"google drive") i3-msg "exec xdg-open https://drive.google.com/";;
	"facebook") i3-msg "exec xdg-open https://www.facebook.com/";;
	"youtube") i3-msg "exec xdg-open https://www.youtube.com/";;
	"portainer") i3-msg "exec xdg-open http://localhost:9000";;
	"onedrive") i3-msg "exec xdg-open https://onedrive.live.com";;
	*) ;;
esac
