#!/bin/bash
PS3="Please select an option: "
options=("Full backup" "Home backup" "Full restore" "Home restore" "Exit")
select opt in "${options[@]}"
do
case $opt in
	"Full backup")
			echo "Beginning full backup.."
			sudo tar -cvpzf fullbackup.tar.gz \
			--exclude=/fullbackup.tar.gz \
			--exclude=/homebackup.tar.gz \
			--exclude=/home/user/restores/* \
			--exclude=/dev \
			--exclude=/boot \
			--exclude=/bin \
			--exclude=/proc \
			--exclude=/sys \
			--exclude=/tmp \
			--exclude=/run \
			--exclude=/mnt \
			--exclude=/media \
			--exclude=/lost+found \
			--one-file-system /
			;;
	"Home backup")
			echo "Beginning Home backup.."
			sudo tar -cvpzf homebackup.tar.gz \
			--exclude=/home/user/fullbackup.tar.gz \
			--exclude=/home/user/homebackup.tar.gz \
			--exclude=/home/user/restores/* \
 			--exclude=/dev \
			--exclude=/proc \
			--exclude=/root \
			--exclude=/sys \
			--exclude=/tmp \
			--exclude=/run \
			--exclude=/mnt \
			--exclude=/boot \
			--exclude=/bin \
			--exclude=/media \
			--exclude=/lost+found \
			--exclude=/etc \
			--exclude=/live-build \
			--exclude=/opt \
			--exclude=/lib \
			--exclude=/sbin \
			--exclude=/srv \
			--exclude=/var \
			--exclude=/usr \
			--exclude=/selinux \
			--exclude=/lib64 \
			--exclude=/cdrom \
			--exclude=/initrd.img \
 			--exclude=/vmlinuz\
			--one-file-system /
			;;
	"Full restore")
			echo "Beginning full restore"
			tar xvzf fullbackup.tar.gz -C restores/full
			;;
	"Home restore")
			echo "Beginning home restore"
			tar xvzf homebackup.tar.gz -C restores/home
			;;
	"Exit")
			break
			;;
	*) echo "Invalid option";;
	esac
done
