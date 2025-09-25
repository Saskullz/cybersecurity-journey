#!/bin/bash

# =============================================================================
# SCRIPT TEMPLATE
# =============================================================================
# Descripción: [Breve descripción del script]
# Autor: [Tu nombre]
# Fecha: $(date +%Y-%m-%d)
# Versión: 1.0
# =============================================================================

set -e  # Salir si cualquier comando falla

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para mostrar ayuda
show_help() {
    echo "Uso: $0 [opciones]"
    echo ""
    echo "Opciones:"
    echo "  -h, --help     Mostrar esta ayuda"
    echo "  -v, --verbose  Modo verbose"
    echo ""
    echo "Ejemplo:"
    echo "  $0 --verbose"
}

# Función para logging
log() {
    echo -e "${GREEN}[$(date +'%Y-%m-%d %H:%M:%S')]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1" >&2
}

# Variables por defecto
VERBOSE=false

# Parsear argumentos
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            show_help
            exit 0
            ;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
        *)
            error "Opción desconocida: $1"
            show_help
            exit 1
            ;;
    esac
done

# Función principal
main() {
    log "Iniciando script..."
    
    # Tu código aquí
    
    log "Script completado exitosamente"
}

# Ejecutar función principal
main "$@"
