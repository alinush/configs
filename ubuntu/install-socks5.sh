# INSECURE AUTHENTICATION: sudo apt-get install -y dante-server

echo
echo "Use SSH tunnelling instead."
echo
echo "On your client machine start an SSH tunnel with your proxy machine:"
echo
echo " $ ssh -N -D <client-bind-addr:client-bind-port> <proxy-username>@<proxy-server>"
echo " $ ssh -N -D 127.0.0.1:8080 alinush@chopin"
echo
echo "This will start a SOCKS5 proxy for you on the <proxy-server> that you can access from your client machine at port 8080."
echo
