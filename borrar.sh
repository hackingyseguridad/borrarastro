#!/bin/sh

echo 

# Limpiar caché de usuario
rm -rf ~/.cache/*
rm -rf ~/.thumbnails/* 2>/dev/null

# Limpiar historiales
rm -f ~/.zsh_history ~/.bash_history ~/.python_history 2>/dev/null
echo "" > ~/.zsh_history 2>/dev/null
echo "" > ~/.bash_history 2>/dev/null

# Limpiar directorios temporales
rm -rf /tmp/* 2>/dev/null
rm -rf /var/tmp/* 2>/dev/null
sudo rm -rf /tmp/* 2>/dev/null

# Limpiar logs del sistema
sudo journalctl --vacuum-time=1s 2>/dev/null

# Truncar logs
sudo find /var/log -type f -name "*.log" -exec truncate -s 0 {} \; 2>/dev/null
sudo find /var/log -name "*.log" -exec truncate -s 0 {} \; 2>/dev/null

# Sobrescribir y eliminar logs sensibles
sudo shred -n 7 /var/log/wtmp /var/log/lastlog /var/log/*.log /var/log/*.log.* 2>/dev/null
echo "" > /var/log/wtmp 2>/dev/null
echo "" > /var/log/lastlog 2>/dev/null

# Eliminar logs comprimidos
sudo rm /var/log/*.log.*.gz /var/log/*.gz 2>/dev/null

echo 

