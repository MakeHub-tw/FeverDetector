#!/usr/bin/env bash

install_system_updates(){

    echo "updating system."
    brew update

}

install_uvc_dependencies(){

    echo "Installing thermal dependencies."
    git clone https://github.com/groupgets/libuvc
    brew install cmake
    brew install libusb
    brew install jpeg
    cd libuvc
    mkdir build
    cd build
    cmake ..
    make

    cp libuvc.dylib ../../src
}

main () {
    install_system_updates
    install_uvc_dependencies

    brew install python3
}

main "$@"

