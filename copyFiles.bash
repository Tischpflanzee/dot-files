printMenu () {
	echo "1 - i3.conf"
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

Menu
