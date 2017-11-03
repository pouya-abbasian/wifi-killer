#!/bin/bash
clear
echo -e "\nTo run the program, we need to install the listed tools :\n\tnmap\n"
##Check installed NMAP OR Not
if nmap -v &> /dev/null ;then
	echo "NMAP Is Installed!"
	nmap_install="0"
else
	echo "You Don't Have nmap, I want To Install That."
	nmap_install="1"
fi
##Install NMAP
nmap_pacman(){
	sudo pacman -Syu nmap
}
nmap_apt(){
	sudo apt update
	sudo apt install nmap
}
nmap_yum(){
	sudo yum install nmap
}
nmap_zypper(){
	sudo zypper install nmap
}
#Checking if the distro is Debian Base/ Arch Base/ Redhat Base/ OpenSUSE base and running the correct script
chmod +x wifi-killer
id | grep sudo  > /dev/null
sudo="$?"
if [ "$nmap_install" != "0" ] ;then 	
	if [ "$sudo" != "0" ];then
		echo "you need to install 'nmap' which needs root access!!! contact your system admin"
		exit 1
	else	
	if pacman -Q &> /dev/null ;then
		nmap_pacman
	elif apt list --installed &> /dev/null ;then
		nmap_apt
	elif dnf list &> /dev/null ;then
		nmap_yum
	elif zypper search i+ &> /dev/null ;then
		nmap_zypper
	else
		echo "Your distro is neither Debian Base nor Arch Base nor Redhat Base nor OpenSUSE Base So, install NMAP On Your Sys and Try again."
		exit 1
	fi
fi
##Install wifi-killer
if [ "$sudo" == "0" ];then  #If Its == Ture , You Are Sudo
	sudo cp -vv wifi-killer /bin/
	if [ "$?" != "0" ];then
		echo "You have An ERROR in copying file!!!"		
	fi
else
	mkdir -p "~/bin"
	cp -vv wifi-killer ~/bin/
	chmod +x ~/bin/wifi-killer
	PATH="$PATH:/home/$USER/bin"
	echo "PATH=$PATH:/homse/$USER/bin" >> ~/.bashrc
fi
echo "the programm was installed successfully"
echo "you can use the 'wifi-killer' command whenever you need to use the program"
