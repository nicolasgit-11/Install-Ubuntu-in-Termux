#!/data/data/com.termux/files/usr/bin/bash
clear
sleep 5
echo 'Script Made for Install Ubuntu 22.04 in your device!'
sleep 5
echo 'Lets Started!'
sleep 5
read -p 'Do you Want to Install Ubuntu 22.04 in your device? (y/n) ' contentofquestion
if [ "$contentofquestion" = "y" ]; then
  apt install proot wget tar -y
  echo 'OK!'
  sleep 3
  clear
  echo 'Downloading Rootfs...'
  wget https://cdimage.ubuntu.com/ubuntu-base/releases/22.04/release/ubuntu-base-22.04-base-arm64.tar.gz
  sleep 5
  clear
  echo 'Extracting Rootfs...'
  mkdir ubuntu-rootfs
  proot -l -0 tar -xf ubuntu-base-22.04-base-arm64.tar.gz -C ubuntu-rootfs
  rm ubuntu-base-22.04-base-arm64.tar.gz
  sleep 5
  clear
  echo 'Setting Rootfs...'
  echo 'nameserver 1.1.1.1' > ubuntu-rootfs/etc/resolv.conf
  touch ubuntu-rootfs/root/.hushlogin
  touch ubuntu-rootfs/etc/skel/.hushlogin
  sleep 5
  clear
  echo 'Creating Script...'
  echo 'unset LD_PRELOAD && proot -l -0 -r $(pwd)/ubuntu-rootfs -b /proc -b /dev -b /sys -w /root /bin/su -' > $(pwd)/startubuntu.sh
  chmod +x $(pwd)/startubuntu.sh
  sleep 5
  clear
  echo 'You can acess Ubuntu with ./startubuntu.sh'
else
  echo 'Aborted'
  exit 1
fi
  
  
  

