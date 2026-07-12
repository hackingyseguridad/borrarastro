## borrarastro

# 🧹 borrarastro

**Borra rastros, historial, logs y libera espacio en sistemas Linux/Unix**

[![GitHub stars](https://img.shields.io/github/stars/hackingyseguridad/borrarastro.svg)](https://github.com/hackingyseguridad/borrarastro)
[![GitHub license](https://img.shields.io/github/license/hackingyseguridad/borrarastro.svg)](https://github.com/hackingyseguridad/borrarastro/blob/main/LICENSE)
[![Shell](https://img.shields.io/badge/language-Shell-89e051.svg)](https://github.com/hackingyseguridad/borrarastro)

---

## 📋 Descripción General

**borrarastro** es una suite de scripts shell diseñados para **limpiar de forma segura y agresiva** los rastros digitales, historiales de comandos, logs del sistema, cachés y archivos temporales en distribuciones Linux.

### 🎯 Usos principales

- **Privacidad**: Eliminar historial de comandos (`bash`, `zsh`, etc.) y rastros de navegadores.
- **Mantenimiento**: Liberar espacio en disco eliminando logs, cachés y temporales.
- **Seguridad**: Borrar archivos sensibles (`known_hosts`, `ssh`, logs de autenticación, etc.).
- **Forense / Red Team**: Limpiar rastros después de pruebas de penetración o auditorías.
- **Automatización**: Ejecutar periódicamente con `cron`.

> ⚠️ **Advertencia importante**  
> Estos scripts realizan eliminaciones irreversibles. **Siempre haz una copia de seguridad** antes de ejecutarlos. Su uso puede dificultar la auditoría y el diagnóstico de problemas del sistema.

---

## 📊 Tabla Resumen de Scripts

| Script                | Función Principal                          | Nivel de Agresividad | Requiere `sudo` | Distros Recomendadas          | Uso Recomendado                  |
|-----------------------|--------------------------------------------|----------------------|-----------------|-------------------------------|----------------------------------|
| `borrarastro.sh`     | Limpieza profunda de logs, cachés y rastros del usuario y sistema | **Muy Alto**        | Sí             | Debian, Ubuntu, Arch, Fedora | Uso periódico / post-auditoría  |
| `borrar.sh`          | Limpieza rápida de historial y temporales  | Medio               | Parcial        | Todas                        | Uso diario / estaciones de trabajo |
| `liberarespacio.sh`  | Liberación máxima de espacio en disco      | Alto                | Sí             | Debian/Ubuntu (principal)    | Servidores con poco espacio     |
| `eliminar.sh`        | Ejecutar `borrar.sh` directamente desde internet | Medio              | Sí             | Todas                        | Uso rápido sin clonar repo      |

---

## 🛠️ Descripción Detallada de los Scripts

### 1. `borrarastro.sh` - **Limpieza Profunda**

Es el script más completo. Realiza las siguientes acciones:

- Borra historiales de shell (`bash`, `zsh`, `python`, `mysql`, etc.).
- Limpia cachés de navegadores (Firefox, Chrome, Chromium).
- Elimina archivos temporales, papelera, miniaturas y `recently-used`.
- Limpia `/tmp`, `/var/tmp`, cachés de paquetes (`apt`, `yum`, `pacman`).
- Trunca y sobrescribe logs del sistema (`/var/log`).
- Usa `shred` para sobrescribir logs sensibles (7 pasadas).
- Limpia cachés de DNS, Docker, SSH (`known_hosts`), etc.
- Libera memoria con `drop_caches`.

### 2. `borrar.sh` - **Limpieza Rápida de Historial**

Versión ligera enfocada en:
- Historial de comandos del usuario actual.
- Cachés del usuario.
- Logs básicos del sistema.

Ideal para uso frecuente en entornos de escritorio.

### 3. `liberarespacio.sh` - **Liberación Máxima de Espacio**

Script muy completo con:
- Muestra de espacio antes/después.
- Limpieza por etapas (cachés, logs, kernels antiguos, paquetes huérfanos, etc.).
- Opción interactiva para eliminar archivos grandes (> 500 MB).
- Compatible con múltiples gestores de paquetes.

### 4. `eliminar.sh` - **Ejecución Remota**

Script mínimo que descarga y ejecuta `borrar.sh` directamente desde GitHub (útil cuando no quieres clonar el repositorio).

---

## 🚀 Instalación y Uso

```bash
# 1. Clonar el repositorio
git clone https://github.com/hackingyseguridad/borrarastro.git
cd borrarastro

# 2. Dar permisos de ejecución
chmod +x *.sh

# 3. Ejemplos de uso
sudo ./borrarastro.sh          # Limpieza profunda (recomendado)
./borrar.sh                    # Limpieza rápida de historial
sudo ./liberarespacio.sh       # Liberar espacio en disco

#
http://www.hackingyseguridad.com/
#
