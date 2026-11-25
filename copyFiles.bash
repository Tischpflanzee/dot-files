printWarning () {
	echo "THIS SCRIPT MAY NEED TO BE EXECUTED AS ROOT"
	echo "THIS SCRIPT MUST BE EXECUTED FROM THE ROOT OF THE GIT REPO ELSE IT WILL NOT FIND THE CONFIGS"
	echo ""
}

printMenu () {
	echo "1 - i3 conf"
	echo "2 . NixOs conf"
	echo ""
	
}
Menu () {
	printMenu
	read number
	if [ $number -eq 1 ]; then
		copyI3Config
	fi
	if [ $number -eq 2 ]; then
		copyNixOSConfig
	fi
}
copyI3Config () {
	cp ./i3/config ~/.config/i3
	echo "Copied i3 Conf to ~/.config/i3"
}

copyNixOSConfig () {
	cp -r ./nixos /etc/
	echo "Copied NixOS Conf to /etc/nixos/"
}

installProgramms () {
    sudo pacman -Syu yay kitty i3 obsidian
}

printWarning
Menu
