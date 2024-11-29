curl -o telegram.tar.xz $(curl -sI https://telegram.org/dl/desktop/linux | grep 'location' | awk '{print $2}' | tr -d '\r')
sudo rm -rf /opt/telegram 
sudo mkdir -p /opt/telegram 
sudo chown -R $USER:$USER /opt/telegram
sudo tar -xf telegram.tar.xz -C /opt/telegram
cd /opt/telegram
mv Telegram tmp
mv tmp/* .
rm -r tmp
cd -
sudo rm /bin/telegram
sudo ln -s /opt/telegram/Telegram /bin/telegram
