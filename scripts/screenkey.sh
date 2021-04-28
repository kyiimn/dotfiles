#!/bin/bash

if [ "$1" = 'run' ]; then
	ps ax | grep screenkey | grep python | grep -v grep || screenkey &
elif [ "$1" = 'kill' ]; then
	pkill -9 screenkey
elif [ "$1" = 'toggle' ]; then
	ST=`ps ax | grep screenkey | grep python | grep -v grep | wc -l`
	if [ $ST -eq 0 ]; then
		ps ax | grep screenkey | grep python | grep -v grep || screenkey &
	else
		pkill -9 screenkey
	fi
elif [ "$1" = 'status' ]; then
	MOUNT=`ps ax | grep screenkey | grep python | grep -v grep | wc -l`
	if [ $MOUNT -eq 0 ]; then
		echo 
	else
		echo 
	fi
fi

