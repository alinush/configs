set -e

cd /tmp

git clone https://github.com/seebi/dircolors-solarized
(
    cd dircolors-solarized/
    #cp dircolors.256dark ~/.dircolors
    cp dircolors.ansi-dark ~/.dircolors
)

repo="osx-terminal.app-colors-solarized"
git clone https://github.com/tomislav/${repo}.git

echo
echo "Cloned Solarized profile for Terminal in OS X in /tmp/$repo"
echo "Please install profile manually in Terminal."
echo
