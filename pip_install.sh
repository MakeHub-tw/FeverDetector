#!/usr/bin/env bash
#File Created by Fox Chao
#sudo chmod 775 pip_install.sh
#sudo ./pip_install.sh

install_thermal_dependencies(){

    echo "Installing thermal dependencies."
    pip install PyQt5
    pip install opencv-python
    pip install psutil
    pip install h5py
    pip install tifffile

}

install_thermal_app(){

    echo "Installing and building thermal app."
    sudo apt install git -y
    #git clone https://github.com/Kheirlb/purethermal1-uvc-capture.git
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

main() {
    #install_system_updates
    install_thermal_dependencies
    #install_thermal_app
}

main "$@"
