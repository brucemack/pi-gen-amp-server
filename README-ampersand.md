This is a fork of the pi-gen repo with the customizations used to build
[amp-server]() images for the Raspberry Pi 4/5.

# Steps

    git clone https://github.com/brucemack/pi-gen-amp-server.git
    cd pi-gen-amp-server
    git switch arm64
    sudo bash
    # EDIT THE config FILE TO SET THE NAME OF THE RESULTING IMAGE!
    # Select the appropriate amp-server package
    export AMP_SERVER_VERSION=20260610
    export AMP_ARCH=$(uname -m)
    # Clean up from previous builds
    rm -rf work deploy
    ./build.sh
    


