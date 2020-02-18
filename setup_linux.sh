#!/usr/bin/env bash

install_system_updates(){

    echo "updating system."
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install git -y
    sudo apt-get dist-upgrade -y --autoremove

}

install_uvc_dependencies(){

    echo "Installing thermal dependencies."
    git clone https://github.com/groupgets/libuvc
    sudo apt-get install cmake -y
    sudo apt-get install libusb-1.0-0-dev -y
    sudo apt-get install libjpeg-dev -y
    cd libuvc
    mkdir build
    cd build
    cmake ..
    make && sudo make install
    sudo ldconfig -v
    cd ../..

    sudo sh -c "echo 'SUBSYSTEMS==\"usb\", ATTRS{idVendor}==\"1e4e\", ATTRS{idProduct}==\"0100\", SYMLINK+=\"pt1\", GROUP=\"usb\", MODE=\"666\"' > /etc/udev/rules.d/99-pt1.rules"

}

main () {
    install_system_updates
    install_uvc_dependencies

    sudo apt install python3-pip -y
}

main "$@"

