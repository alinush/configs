#######
# GRC #
#######

# Check if grc is installed before creating potentially
# unusable aliases
if grc &>/dev/null; then
    alias gcc='grc -es gcc'
    alias make='grc make'
    alias configure='grc ./configure'
    alias ping='grc ping'
    alias dig='grc dig'
    alias last='grc last'
    alias g++='grc -es g++'
    alias traceroute='grc traceroute'
    alias ld='grc ld'
    alias df='grc df'
fi
