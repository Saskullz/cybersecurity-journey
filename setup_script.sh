#!/bin/bash

# =============================================================================
# CYBERSECURITY JOURNEY - SETUP SCRIPT
# =============================================================================
# Script para configurar automáticamente el repositorio y estructura inicial
# Autor: Tu nombre
# Fecha: $(date +%Y-%m-%d)
# =============================================================================

set -e  # Salir si cualquier comando falla

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Función para imprimir con colores
print_status() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_info() {
    echo -e "${BLUE}[i]${NC} $1"
}

print_header() {
    echo -e "${PURPLE}==============================================================================${NC}"
    echo -e "${PURPLE}$1${NC}"
    echo -e "${PURPLE}==============================================================================${NC}"
}

# Función para crear directorios
create_directory_structure() {
    print_header "CREANDO ESTRUCTURA DE DIRECTORIOS"
    
    directories=(
        "resources/cheatsheets"
        "resources/lab-setup"
        "resources/certifications"
        "projects/01-bash-scripts"
        "projects/02-network-lab"
        "projects/03-active-directory-lab"
        "projects/04-web-pentesting"
        "projects/05-buffer-overflow"
        "writeups/tryhackme"
        "writeups/hackthebox"
        "writeups/templates"
        "monthly-progress/month-01"
        "monthly-progress/month-02"
        "monthly-progress/month-03"
        "monthly-progress/month-04"
        "monthly-progress/month-05"
        "monthly-progress/month-06"
        "monthly-progress/month-07"
        "monthly-progress/month-08"
        "monthly-progress/month-09"
        "monthly-progress/month-10"
        "monthly-progress/month-11"
        "monthly-progress/month-12"
        "tools-configs/kali-setup"
        "tools-configs/burp-extensions"
        "tools-configs/dotfiles"
    )
    
    for dir in "${directories[@]}"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir"
            print_status "Creado: $dir"
        else
            print_warning "Ya existe: $dir"
        fi
    done
}

# Función para crear archivos .gitkeep en directorios vacíos
create_gitkeep_files() {
    print_header "CREANDO ARCHIVOS .gitkeep"
    
    find . -type d -empty -not -path './.git*' | while read -r dir; do
        touch "$dir/.gitkeep"
        print_status "Creado .gitkeep en: $dir"
    done
}

# Función para crear archivos README básicos en cada directorio principal
create_readme_files() {
    print_header "CREANDO ARCHIVOS README"
    
    # README para recursos
    cat > resources/README.md << 'EOF'
# 📚 Recursos y Documentación

Esta carpeta contiene todos los recursos de apoyo para el journey de ciberseguridad.

## Estructura

- **cheatsheets/**: Hojas de referencia rápida por tecnología/herramienta
- **lab-setup/**: Guías para configurar laboratorios y entornos
- **certifications/**: Materiales y notas para certificaciones

## Cheat Sheets Disponibles

- [ ] Linux Commands
- [ ] Nmap
- [ ] Burp Suite
- [ ] Active Directory
- [ ] PowerShell
- [ ] Web Application Testing

## Lab Setup Guides

- [ ] Kali Linux Configuration
- [ ] Windows Server Lab
- [ ] Active Directory Lab
- [ ] Web Application Testing Lab
EOF

    # README para proyectos
    cat > projects/README.md << 'EOF'
# 🛠️ Proyectos Principales

Esta carpeta contiene todos los proyectos prácticos desarrollados durante el journey.

## Proyectos por Fase

### Fase 1: Fundamentos (Mes 1-2)
- **01-bash-scripts/**: Scripts de automatización y utilidades

### Fase 2: Redes y Windows (Mes 3-4)
- **02-network-lab/**: Laboratorio de redes y análisis de tráfico

### Fase 3: Active Directory (Mes 5-7)
- **03-active-directory-lab/**: Laboratorio AD completo y ataques

### Fase 4: Web Pentesting (Mes 8-9)
- **04-web-pentesting/**: Auditorías web y herramientas

### Fase 5: Avanzado (Mes 10-12)
- **05-buffer-overflow/**: Laboratorio y documentación BOF
EOF

    # README para writeups
    cat > writeups/README.md << 'EOF'
# 📝 Write-ups de CTFs

Documentación detallada de todas las máquinas y desafíos resueltos.

## Estructura de Write-ups

Cada write-up debe incluir:
1. **Información básica** (OS, dificultad, fecha)
2. **Reconocimiento** (nmap, enum, etc.)
3. **Explotación** (vulnerabilidades encontradas)
4. **Post-explotación** (escalada de privilegios)
5. **Lecciones aprendidas** y **herramientas utilizadas**

## Plataformas

- **tryhackme/**: Máquinas de TryHackMe
- **hackthebox/**: Máquinas de HackTheBox
- **templates/**: Plantillas para write-ups consistentes

## Estadísticas

- Total de máquinas: 0
- Fáciles: 0
- Medias: 0
- Difíciles: 0
EOF

    print_status "Archivos README creados"
}

# Función para crear templates útiles
create_templates() {
    print_header "CREANDO TEMPLATES"
    
    # Template para write-ups
    cat > writeups/templates/writeup-template.md << 'EOF'
# [Nombre de la Máquina] - Write-up

## Información Básica

- **Plataforma**: TryHackMe/HackTheBox
- **OS**: Linux/Windows
- **Dificultad**: Fácil/Media/Difícil
- **Fecha de resolución**: [YYYY-MM-DD]
- **Tiempo invertido**: [X] horas

## Reconocimiento

### Nmap Scan
```bash
# Comando utilizado
nmap -sC -sV -oN nmap_scan.txt [IP]
```

**Puertos abiertos:**
- Puerto X: Servicio Y
- Puerto Z: Servicio W

### Enumeración
[Describe el proceso de enumeración específico]

## Explotación

### Vulnerabilidad Encontrada
[Describe la vulnerabilidad]

### Exploit Utilizado
```bash
# Comando o código utilizado
```

### Acceso Inicial
[Cómo obtuviste el acceso inicial]

## Post-Explotación

### Escalada de Privilegios
[Método utilizado para escalar privilegios]

### Flags Obtenidas
- **User Flag**: [hash]
- **Root Flag**: [hash]

## Lecciones Aprendidas

### Herramientas Utilizadas
- [Herramienta 1]: Para [propósito]
- [Herramienta 2]: Para [propósito]

### Conceptos Clave
- [Concepto 1]
- [Concepto 2]

### Para Futuras Referencias
- [Nota importante 1]
- [Nota importante 2]

## Referencias
- [Link 1]
- [Link 2]
EOF

    # Template para scripts
    cat > projects/01-bash-scripts/script-template.sh << 'EOF'
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
EOF

    chmod +x projects/01-bash-scripts/script-template.sh
    
    print_status "Templates creados"
}

# Función para crear .gitignore
create_gitignore() {
    print_header "CREANDO .gitignore"
    
    cat > .gitignore << 'EOF'
# Sistema operativo
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Editores
.vscode/
.idea/
*.swp
*.swo
*~

# Archivos temporales
*.tmp
*.temp
*.log
*.bak
*.backup

# Credenciales y configuración sensible
config/credentials.*
*.key
*.pem
*.cert
*.crt
passwords.txt
secrets.*

# Archivos de hash y wordlists grandes
*.txt.gz
rockyou.txt
*.wordlist

# Resultados de herramientas
nmap_*.xml
nmap_*.txt
burp_*.xml
dirb_*.txt
gobuster_*.txt

# Archivos de máquinas virtuales
*.vmdk
*.vdi
*.qcow2
*.iso

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
env/
venv/

# Node.js (si usas herramientas JS)
node_modules/
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Archivos personales que no deben subir
TODO_personal.md
notes_private.md
EOF
    
    print_status ".gitignore creado"
}

# Función para inicializar git si no existe
initialize_git() {
    print_header "CONFIGURANDO GIT"
    
    if [ ! -d ".git" ]; then
        git init
        print_status "Repositorio git inicializado"
    else
        print_warning "Repositorio git ya existe"
    fi
    
    # Añadir todo al staging
    git add .
    print_status "Archivos añadidos al staging"
    
    # Primer commit si no hay commits
    if [ $(git rev-list --count HEAD 2>/dev/null || echo 0) -eq 0 ]; then
        git commit -m "Initial commit: Set up cybersecurity journey structure

- Created complete directory structure for 12-month plan
- Added README files and templates
- Configured .gitignore for security tools
- Ready to start the pentesting journey! 🚀"
        print_status "Commit inicial creado"
    else
        print_warning "Ya existen commits en el repositorio"
    fi
}

# Función para mostrar siguiente pasos
show_next_steps() {
    print_header "CONFIGURACIÓN COMPLETADA"
    
    echo -e "${CYAN}🎉 ¡El repositorio cybersecurity-journey está listo!${NC}"
    echo ""
    echo -e "${YELLOW}Próximos pasos:${NC}"
    echo "1. Configura tu repositorio remoto en GitHub:"
    echo -e "   ${BLUE}git remote add origin https://github.com/TU_USUARIO/cybersecurity-journey.git${NC}"
    echo ""
    echo "2. Sube el repositorio inicial:"
    echo -e "   ${BLUE}git push -u origin main${NC}"
    echo ""
    echo "3. Personaliza los archivos:"
    echo "   - Edita README.md con tu información personal"
    echo "   - Actualiza PROGRESS.md con la fecha de inicio"
    echo "   - Revisa monthly-progress/month-01/ para la primera semana"
    echo ""
    echo "4. Comienza con Mes 1, Semana 1:"
    echo "   - Organizar entorno Notion"
    echo "   - Configurar Kali Linux"
    echo "   - Empezar curso S4vitar"
    echo ""
    echo -e "${GREEN}¡A por esos 12 meses de ciberseguridad! 🛡️${NC}"
}

# FUNCIÓN PRINCIPAL
main() {
    print_header "CYBERSECURITY JOURNEY - SETUP SCRIPT"
    
    create_directory_structure
    create_gitkeep_files
    create_readme_files
    create_templates
    create_gitignore
    initialize_git
    show_next_steps
}

# Ejecutar si el script es llamado directamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi