if [ "$(uname -s)" = "Darwin" ]; then
    OS="OS X"
elif [ "$(uname -s)" = "Linux" ]; then
    OS="Linux"

    if [ -f /etc/issue ]; then
        if grep Fedora /etc/issue >/dev/null; then
    	    OS_FLAVOR="Fedora"
        fi
    elif [ -f /etc/lsb-release ]; then
	if grep "DISTRIB_ID=Ubuntu" /etc/lsb-release >/dev/null; then
            OS_FLAVOR="Ubuntu"
        fi
    else
        OS_FLAVOR="Unknown"
    fi
fi

echo "OS: $OS"
echo "OS Flavor: $OS_FLAVOR"
