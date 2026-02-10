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
echo "" > ~/.bash_history
ecjp "" > ~/.zsh_history
rm ~/.zsh_history
rm -f ~/.bash_history
history -c
history -cw && exit
