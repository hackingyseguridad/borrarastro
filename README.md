## borrarastro

# 🧹 borrarastro

**Borra rastros, historial y logs en sistemas Linux/Unix**

[![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)
[![License](https://img.shields.io/badge/license-MIT-green?style=for-the-badge)](LICENSE)
[![GitHub last commit](https://img.shields.io/github/last-commit/hackingyseguridad/borrarastro?style=for-the-badge)](https://github.com/hackingyseguridad/borrarastro/commits/main)

---

## 📋 Descripción General

**borrarastro** es una colección de scripts shell diseñados para **limpiar, borrar y eliminar** de forma segura el historial de comandos, archivos de logs y otros rastros digitales en sistemas Linux. Estos scripts son útiles para:

- 🧹 **Mantenimiento del sistema**: Liberar espacio en disco eliminando logs antiguos.
- 🕵️ **Privacidad**: Borrar el historial de comandos ejecutados en el terminal.
- 🔒 **Seguridad**: Eliminar archivos de configuración que puedan contener información sensible (ej: `known_hosts`).
- ⚡ **Automatización**: Facilitar tareas repetitivas de limpieza.

> ⚠️ **Advertencia**: Utilice estos scripts con precaución. La eliminación de logs puede afectar la auditoría y solución de problemas del sistema. Se recomienda hacer una copia de seguridad antes de ejecutarlos.

---

## 🚀 Instalación y Uso Rápido

### Clonar el repositorio
```bash
git clone https://github.com/hackingyseguridad/borrarastro.git
cd borrarastro
Dar permisos de ejecución
bash
chmod +x *.sh
Ejecutar un script específico
bash
# Ejemplo: Borrar todos los logs
sudo ./borrarastro.sh

# Ejemplo: Limpiar el historial del usuario actual
./borrar.sh
📊 Resumen de Scripts
Script	Función Principal	Comandos Clave	¿Requiere sudo?	Nivel de Riesgo
borrarastro.sh	Borra logs del sistema y archivos comprimidos.	find /var/log -type f -exec truncate -s 0 {} \;
rm -f /var/log/*.gz /var/log/*.1	✅ Sí	Alto
borrar.sh	Limpia el historial de comandos del usuario actual.	history -c (vacía el historial de la sesión actual)
rm -f ~/.bash_history (elimina el archivo de historial)	❌ No	Medio
eliminar.sh	Elimina archivos o directorios específicos (personalizable).	rm -rf [ruta] (eliminación forzosa y recursiva)	❌ No (a menos que se requiera para ciertas rutas)	Muy Alto
liberarespacio.sh	Libera espacio en disco limpiando cachés y paquetes temporales.	apt-get clean (limpia caché de paquetes .deb)
journalctl --vacuum-size=50M (reduce logs de systemd)	✅ Sí	Bajo-Medio
🛠️ Descripción Detallada de los Scripts
1. borrarastro.sh - Borrado Profundo de Logs del Sistema
Este script realiza una limpieza agresiva de los archivos de registro del sistema.

Acción 1: Usa find para localizar todos los archivos dentro de /var/log y los trunca a tamaño cero (truncate -s 0). Esto borra el contenido de los logs pero mantiene los archivos.

Acción 2: Elimina archivos de logs rotados y comprimidos (terminaciones .gz y .1).

Consecuencia: Puede borrar evidencia de eventos del sistema, por lo que debe usarse con precaución y en sistemas donde la auditoría no sea crítica.

2. borrar.sh - Limpieza de Historial de Comandos
Ideal para entornos de desarrollo o estaciones de trabajo personales.

Acción 1: history -c limpia el historial de la sesión actual de la terminal.

Acción 2: rm -f ~/.bash_history elimina el archivo persistente que guarda el historial entre sesiones.

Consejo: Para que el cambio sea efectivo en nuevas sesiones, también puede sobrescribir el archivo con cat /dev/null > ~/.bash_history.

3. eliminar.sh - Eliminación Forzosa de Archivos/Directorios
Script de propósito general para eliminaciones masivas.

Acción: Utiliza rm -rf para borrar archivos o carpetas.

Personalización: Antes de usarlo, debe editar el script y definir las rutas exactas a eliminar.

Precaución: rm -rf es un comando potente y peligroso. Un error en la ruta puede borrar datos importantes del sistema.

4. liberarespacio.sh - Liberación de Espacio en Disco
Script orientado al mantenimiento y optimización del almacenamiento.

Acción 1: apt-get clean elimina los paquetes .deb descargados que ya no son necesarios (en sistemas basados en Debian/Ubuntu).

Acción 2: journalctl --vacuum-size=50M reduce el tamaño de los logs de systemd a 50 MB, descartando los más antiguos.

Beneficio: Ayuda a recuperar espacio en disco sin comprometer la funcionalidad del sistema.

🔧 Personalización y Adaptación
Puede modificar estos scripts para adaptarlos a sus necesidades:

Añadir más rutas de logs: Edite el comando find en borrarastro.sh para incluir otros directorios como /var/log/nginx/ o /var/log/mysql/.

Cambiar el tamaño de los logs: Modifique el parámetro --vacuum-size=50M en liberarespacio.sh.

Programar la ejecución: Use cron para ejecutar estos scripts periódicamente (ej: 0 2 * * * /ruta/al/script/liberarespacio.sh).

🌐 Contribuciones y Soporte
¿Tiene ideas para mejorar los scripts o añadir nuevas funcionalidades? ¡Las contribuciones son bienvenidas!

Realice un fork del repositorio.

Cree su rama de características (git checkout -b feature/nueva-funcion).

Realice commit de sus cambios (git commit -m 'Añadir nueva función').

Push a la rama (git push origin feature/nueva-funcion).

Abra un Pull Request.

Para reportar problemas o sugerencias, utilice el sistema de issues de GitHub.

📄 Licencia
Este proyecto está bajo la licencia MIT. Consulte el archivo LICENSE para más detalles.

ℹ️ Acerca del Autor
Desarrollado por hackingyseguridad.com – Especialistas en ciberseguridad y administración de sistemas.

🌐 Visita nuestro sitio web

¿Encontraste útil este proyecto? ¡Dale una ⭐ en GitHub!

text

---

### Instrucciones para usar el archivo:

1. **Descargar**: Haz clic en el enlace de arriba para descargar el archivo `README.md`.
2. **Reemplazar**: Sustituye el archivo `README.md` existente en tu repositorio local por este nuevo.
3. **Subir cambios**: Haz commit y push a GitHub:
   ```bash
   git add README.md
   git commit -m "Actualizar README con información más detallada"
   git push origin main




#
http://www.hackingyseguridad.com/
#
