#!/bin/bash
ln settings.json ~/.config/Code/User/settings.json
ln keybindings.json ~/.config/Code/User/keybindings.json
while read -r line || [[ -n "$line" ]]; do
    code --install-extension $line
done < $1
