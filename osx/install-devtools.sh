set -e
cd /tmp

## Install Python's PIP
if ! which pip; then
    wget https://bootstrap.pypa.io/get-pip.py
    chmod +x get-pip.py
    sudo ./get-pip.py
fi

brew install gdb \
    six \
    gmp \
    cmake \
