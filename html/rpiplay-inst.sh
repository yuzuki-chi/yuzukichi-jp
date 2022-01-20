#/bin/bash

sudo -i

apt update
apt upgrade -y
apt install git -y

$(which timedatectl) set-timezone Asia/Tokyo

$(which git) clone https://github.com/FD-/RPiPlay.git
cd RPiPlay

# default
apt install cmake -y
apt install libavahi-compat-libdnssd-dev -y
apt install libplist-dev -y
apt install libssl-dev -y

# Ubuntu
apt install libgstreamer1.0-dev -y
apt install libgstreamer-plugins-base1.0-dev -y
apt install gstreamer1.0-libav -y
apt install gstreamer1.0-vaapi -y
apt install gstreamer1.0-plugins-bad -y

mkdir build
cd build

$(which cmake) ..
$(which make) -j

# link rpiplay
ln rpiplay /usr/bin/

echo ""

echo "# ==================================================== #" &&\
echo "# [install success]                                    #" &&\
echo "# next command -> 'rpiplay -n <device name> -b auto'   #" &&\
echo "# ==================================================== #"

# rpiplay -n AirPlayTest -b auto
