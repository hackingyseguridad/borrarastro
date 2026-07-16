#!/bin/sh

rm -f ~/.zsh_history ~/.bash_history ~/.python_history ~/.node_repl_history 2>/dev/null
rm -f ~/.sh_history ~/.sqlite_history ~/.mysql_history 2>/dev/null
rm -rf ~/.mozilla/firefox/*.default-release/storage/default/* 2>/dev/null
rm -rf ~/.mozilla/firefox/*.default-release/datareporting/* 2>/dev/null
rm -rf ~/.cache/mozilla ~/.cache/google-chrome ~/.cache/chromium 2>/dev/null
rm -rf ~/.config/google-chrome/Default/Service\ Worker/* 2>/dev/null
rm -rf ~/.config/chromium/Default/Service\ Worker/* 2>/dev/null
rm -rf ~/.cache/* ~/.thumbnails/* ~/.local/share/Trash/* 2>/dev/null
rm -rf ~/.local/share/recently-used.xbel 2>/dev/null
rm -rf ~/.recently-used 2>/dev/null
rm -rf ~/.xsession-errors* 2>/dev/null
rm -rf ~/.local/share/RecentDocuments/* 2>/dev/null
rm -rf ~/.kde/share/apps/RecentDocuments/* 2>/dev/null
sudo rm -rf /tmp/* /var/tmp/* 2>/dev/null
sudo rm -rf /var/cache/apt/archives/*.deb 2>/dev/null
sudo rm -rf /var/cache/apt/*.bin 2>/dev/null
sudo rm -rf /var/cache/pacman/pkg/* 2>/dev/null  # Para Arch Linux
sudo rm -rf /var/cache/yum/* 2>/dev/null  # Para RHEL/Fedora
sudo journalctl --vacuum-time=1s 2>/dev/null
sudo rm -rf /var/log/journal/* 2>/dev/null
sudo find /var/log -type f \( -name "*.log" -o -name "*.log.*" \) -exec truncate -s 0 {} \; 2>/dev/null
sudo truncate -s 0 /var/log/auth.log /var/log/syslog /var/log/kern.log /var/log/dmesg 2>/dev/null
sudo truncate -s 0 /var/log/btmp /var/log/faillog /var/log/tallylog 2>/dev/null
echo "Sobrescribiendo logs sensibles..."
sudo shred -n 7 -z -u /var/log/wtmp /var/log/lastlog /var/log/btmp 2>/dev/null
sudo shred -n 7 -z /var/log/auth.log.* /var/log/syslog.* 2>/dev/null 2>/dev/null
echo "" | sudo tee /var/log/wtmp >/dev/null 2>&1
echo "" | sudo tee /var/log/lastlog >/dev/null 2>&1
echo "" | sudo tee /var/log/btmp >/dev/null 2>&1
sudo rm -f /var/log/*.gz /var/log/*.log.*.gz /var/log/*.1 /var/log/*.old 2>/dev/null
echo "Limpiando datos adicionales..."
which apt-get >/dev/null 2>&1 && sudo apt-get clean
which yum >/dev/null 2>&1 && sudo yum clean all
which pacman >/dev/null 2>&1 && sudo pacman -Scc --noconfirm
sudo systemd-resolve --statistics 2>/dev/null | grep -q "Cache" && sudo systemd-resolve --flush-caches
sudo rm -f /var/cache/nscd/* 2>/dev/null
free | awk '/^Mem:/ {if ($4/$2 > 0.2) print "1"}' | grep -q 1 && sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null 2>&1
docker system prune -af 2>/dev/null
rm -rf ~/.docker/config.json 2>/dev/null
rm -rf ~/.ssh/known_hosts 2>/dev/null
rm -rf ~/.gnupg/*~ 2>/dev/null
rm -rf ~/.local/share/mail/* 2>/dev/null
sudo find /var -name "*lock*" -type f -delete 2>/dev/null
sudo rm -f /var/lib/systemd/coredump/* 2>/dev/null
sudo rm -f /core /var/core /*.core 2>/dev/null
sudo chmod 640 /var/log/auth.log /var/log/syslog 2>/dev/null


