#!/bin/bash

ORIGEN="$HOME/var/nombreAlumno/log"
DESTINO="$HOME/var/www/backup"
FECHA=$(date +%Y%m%d_%H%M%S)
NOMBRE_BASE="backup_$FECHA"

crear_tar() {
    tar -czf "$DESTINO/${NOMBRE_BASE}.tar.gz" "$ORIGEN"
    if [ $? -ne 0 ]; then
        exit 1
    fi
}

crear_zip() {
    zip -r "$DESTINO/${NOMBRE_BASE}.zip" "$ORIGEN"
    if [ $? -ne 0 ]; then
        exit 2
    fi
}

main() {
    crear_tar
    crear_zip
}

main