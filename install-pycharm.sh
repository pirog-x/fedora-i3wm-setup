#!/bin/bash

if [ 0 -ne $(id -u) ]; then 
    exec sudo -- "$0"
fi

mkdir -p /tmp/pycharm
cd /tmp/pycharm

pycharm_redirect_link=$(curl -s 'https://data.services.jetbrains.com/products/releases?code=PCP&latest=true&type=release' | jq -r '.PCP[0].downloads.linux.link')
pycharm_download_link=$(curl -Is $pycharm_redirect_link | grep 'location' | awk '{print $2}' | tr -d '\r')
pycharm_file="${pycharm_download_link##*/}"
echo "PyCharm version is: $pycharm_file"
echo "Fetching..."
curl -so $pycharm_file $pycharm_download_link

echo "Installing..."
tar -xzf $pycharm_file -C /opt
cd /opt
mv $(ls -d pycharm*) pycharm
ln -s /opt/pycharm/bin/pycharm.sh /bin/pycharm

echo "Cleaning..."
rm -rf /tmp/pycharm
echo "Done!"

