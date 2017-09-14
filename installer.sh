#!/bin/bash
pacmngdl(){
	read -p "Do you want to continue? [Y/n] " want
	if [ "$want" == "Y" ] || [ "$want" == "y" ];then
		sudo apt update
		sudo apt namp 
	else
		echo "Abort." ; exit
}
clear
echo -e """
To run the program, we need to install the listed tools :
\tnmap
"""
id | grep sudo  > /dev/null
sudo=$?
chmod +x wifi-killer
if [ $sudo = "0" ];then
	pacmngdl
	checkdl=$?
	if [ "$checkdl" = "0" ];then
		echo -e "\t\tall programms are installed successfully!!!"
		echo "Now the programms should be added without any problem!!"
		if [ "$sudo" = "0" ];then  #If Its == Ture , You Are Sudo
			sudo cp wifi-killer /bin
			sudo chmod +x /bin/wifi-killer
		else 
			echo "you need to install 'nmap' which needs root access!!! contact your system admin"
			echo -e "use this command to install!!!\n\t sudo apt install nmap "
			PATH=$PATH:$PWD
			export PATH
			echo "$PATH" >> ~/.bashrc
		fi
		echo "the programm was installed successfully"
		echo "you can use the 'wifi-killer' command whenever you need to use the programm"
	else
		if [ "$checkdl" = "100" ] ; then
			echo "Make sure you have a working connection and your your repositories are up to date"
			exit
		else
			echo "Unknow ERROR!!!!"
			echo "you should first install the programms, then add wifi-killer to your commands and then recall wifi-kiiler"
		fi
	fi
else
	echo "you are not a sudo user. ask your administrator to install these programms or make you a sudo user!!!"
	echo "nmap"
fi
echo "Have Fun!!!"
## Installer Coded By Https://Pouya-abbasian
## translation by https://gitlab.com/mhmdreza_abedi
