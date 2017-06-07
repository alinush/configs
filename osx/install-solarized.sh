set -e

cd /tmp

git clone https://github.com/seebi/dircolors-solarized
(
    cd dircolors-solarized/
    #cp dircolors.256dark ~/.dircolors
    cp dircolors.ansi-dark ~/.dircolors
)

# NOTE: Deprecated Terminal solarized theme
#repo="osx-terminal.app-colors-solarized"
#git clone https://github.com/tomislav/${repo}.git

#echo
#echo "Cloned Solarized profile for Terminal in OS X in /tmp/$repo"
#echo "Please install profile manually in Terminal."
#echo

wget "https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Dark.itermcolors"
wget "https://raw.githubusercontent.com/altercation/solarized/master/iterm2-colors-solarized/Solarized%20Light.itermcolors"

echo
echo "Cloned Solarized profile for iTerm2 (not Terminal) on OS X in /tmp/Solarized Dark.itermcolors and /tmp/Solarized Light.itermcolors"
echo "Please install profile manually:"
echo " - Open iTerm2 and type CMD+i"
echo " - Navigate to Colors tab"
echo " - Click on Load Presets"
echo " - Click on Import"
echo " - Select the .itermcolors file(s) of the scheme(s) you'd like to use"
echo " - Click on Load Presets and choose a color scheme"
echo
