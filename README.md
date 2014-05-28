configs
=======

Linux configs (.bash_aliases, .vimrc, .gitconfig) that become a pain to maintain across three different machines.

As of now, all of them go into the home directory.

Repository structure
--------------------

* conf-files/ -- the actual configuration files that you want to version (stuff like .bashrc or .vimrc)
* diff.sh -- script that prints the differences between your system's configs and the ones in the repository
