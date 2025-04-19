## borrarastro

borrar historia de comandos ejecutados y logs


sudo find /var/log -type f -exec truncate -s 0 {} \;

sudo rm -f /var/log/*.gz /var/log/*.1


rm -rf ~/.ssh/known_hosts

