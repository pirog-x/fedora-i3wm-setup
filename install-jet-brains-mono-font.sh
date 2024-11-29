#!/bin/bash

link=https://download.jetbrains.com/fonts/JetBrainsMono-2.304.zip
filename=${link##*/}

curl -so $filename $link

mv fonts /usr/share/fonts/JetBrainsMono
sudo chmod -R 755 /usr/share/fonts/JetBrainsMono

