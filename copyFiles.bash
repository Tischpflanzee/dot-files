printMenu () {
	echo "1 - i3.conf"
	echo "2 . NixOs conf"
	echo ""
	
}
Menu () {
	printMenu
	read number
	if [ $number -eq 1 ]; then
		cp ./i3/config ~/.config/i3
		echo "Copied to ~/.config/i3"
	fi
}
copyNixOSConfig () {
	cp -r ./nixos /etc/

}

Menu
