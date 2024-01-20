#!/bin/bash

# Ajustar zona horaria
sudo timedatectl set-timezone "Europe/Madrid"

# Lista de repositorios
repos=(
  "https://github.com/drorganvidez/shellinabox"
  "https://github.com/drorganvidez/filebrowser"
  "https://github.com/drorganvidez/docker-ubuntu"
  "https://github.com/drorganvidez/portainer"
  "https://github.com/drorganvidez/fail2ban"
  "https://github.com/drorganvidez/cockpit"
)

# Directorio de destino
destination_dir="/home"

# Iterar a través de los repositorios
for repo in "${repos[@]}"
do
  # Obtener el nombre del repositorio
  repo_name=$(basename $repo)

  # Clonar el repositorio
  git clone $repo $destination_dir/$repo_name

  # Cambiar el directorio de trabajo al repositorio clonado
  cd $destination_dir/$repo_name

  # Dar permisos de ejecución al archivo install.sh
  chmod +x install.sh

  # Ejecutar el archivo install.sh (si existe)
  if [ -f install.sh ]; then
    ./install.sh
  fi

  # Volver al directorio de trabajo original
  cd -
done
