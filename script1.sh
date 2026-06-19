#!/bin/bash

ORIGEN="$HOME/var/www/log"
DESTINO="$HOME/var/nombreAlumno/log"

copiar_archivos() {
    cp -r "$ORIGEN/." "$DESTINO/"
    if [ $? -ne 0 ]; then
        exit 1
    fi
}

limpiar_origen() {
    rm -rf "${ORIGEN:?}/"*
    if [ $? -ne 0 ]; then
        exit 1
    fi
}

main() {
    copiar_archivos
    limpiar_origen
}

main