#export TERM='xterm-256color'
#export TERM='xterm-color'

dc_cmd=dircolors
which $dc_cmd || dc_cmd=gdircolors

eval `$dc_cmd --bourne-shell ~/.dircolors`
