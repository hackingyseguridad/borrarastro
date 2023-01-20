#!/bin/sh
# Borrar rastro en remoto
# Antonio Taboada 2023 - hackingyseguridad.com
cd /tmp/
sudo wget https://raw.githubusercontent.com/hackingyseguridad/borrarastro/master/borrar.sh -q -O - | bash
