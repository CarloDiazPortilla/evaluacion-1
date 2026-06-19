#!/bin/bash

DESTINO="$HOME/var/www/log"
CONTENIDO="Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. 
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris."

crear_archivo() {
    NOMBRE="archivo_$(date +%H%M%S).log"
    echo "$CONTENIDO" > "$DESTINO/$NOMBRE"
    if [ $? -ne 0 ]; then
        exit 1
    fi
}

main() {
    crear_archivo
}

main