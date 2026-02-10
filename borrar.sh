#!/bin/sh

echo "Borra logs del systema .."
rm -rf ~/.cache/*
sudo rm -rf /tmp/*
sudo journalctl --vacuum-time=1s
sudo find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;
shred -n 7  /var/log/wtmp
shred -n 7  /var/log/lastlog
shred -n 7  /var/log/*.log
shred -n 7  /var/log/*.log.*
rm /var/log/*.log.*.gz
rm /var/log/*.gz
echo "Borra historia de comandos .. "
ecjp "" > ~/.zsh_history
rm -f ~/.zsh_history 2>/dev/null
rm -f ~/.python_history 2>/dev/null
rm -rf ~/.cache/* 2>/dev/null
rm -rf ~/.thumbnails/* 2>/dev/null
find /var/log -name "*.log" -exec truncate -s 0 {} \; 2>/dev/null
journalctl --vacuum-time=1s 2>/dev/null
rm ~/.zsh_history
rm -f ~/.bash_history
rm -rf /tmp/* 
rm -rf /var/tmp/* 
echo "" > ~/.bash_history
echo "" > /var/log/wtmp 2>/dev/null
echo "" > /var/log/lastlog 2>/dev/null
echo "" > ~/.bash_history 2>/dev/null
rm -rf /tmp/* 2>/dev/null
rm -rf /var/tmp/* 2>/dev/null


