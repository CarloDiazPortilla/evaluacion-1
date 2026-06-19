#!/bin/bash

APPS_DIR="$HOME/var/www/apps"
REPORTE="$HOME/var/log/apps_reporte.txt"

poblar_archivos() {
    for app in "$APPS_DIR"/*/; do
        NUMERO=$(basename "$app" | tr -dc '0-9')
        for i in $(seq 1 "$NUMERO"); do
            touch "${app}archivo_${i}.log"
            if [ $? -ne 0 ]; then
                exit 1
            fi
        done
    done
}

generar_reporte() {
    echo "Reporte de archivos" > "$REPORTE"
    echo "Fecha: $(date '+%Y-%m-%d %H:%M:%S')" >> "$REPORTE"
    for app in "$APPS_DIR"/*/; do
        NOMBRE=$(basename "$app")
        CANTIDAD=$(ls "$app" | wc -l)
        echo "$NOMBRE: $CANTIDAD archivos" >> "$REPORTE"
    done
    if [ $? -ne 0 ]; then
        exit 2
    fi
}

main() {
    poblar_archivos
    generar_reporte
}

main