#!/bin/sh
echo "Borra logs del systema .."
shred -n 7 -t /var/log/wtmp
shred -n 7 -t /var/log/lastlog
shred -n 7 -t /var/log/*.log
shred -n 7 -t /var/log/*.log.*
rm /var/log/*.log.*.gz
rm /var/log/*.gz
echo "Borra historia de comandos .. "
echo "" > ~/.bash_history
ecjp "" > ~/.zsh_history
history -c
history -cw && exit
