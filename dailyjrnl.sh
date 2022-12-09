#!/bin/bash
#
jrnl 
newdate=$(date +"%Y-%m-%d")
jrnl -day $newdate --format markdown > $HOME/.local/share/jrnl/$(date +"%Y").md
cp $HOME/.local/share/jrnl/$(date +"%Y").md $HOME/HCI/Bashyll-Clone/bashyll/posts/

