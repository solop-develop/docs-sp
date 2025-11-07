#!/bin/bash
set -e

echo "=== Configuración ==="
echo "DEFAULT_BRANCH: ${DEFAULT_BRANCH}"
echo ""
echo "Generando configuración de nginx dinámicamente..."

# Iniciar el archivo de configuración con el bloque server principal
cat > /etc/nginx/conf.d/default.conf << 'EOF_HEADER'
# Configuración generada dinámicamente para múltiples ramas/tags

server {
    listen 80;
    server_name localhost;

    root /usr/share/nginx/html;
    index index.html index.htm;

    # Logs
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    # Desactivar logs para favicon
    location = /favicon.ico {
        log_not_found off;
        access_log off;
    }

    # Desactivar logs para robots.txt
    location = /robots.txt {
        log_not_found off;
        access_log off;
    }

    # Configuración para archivos estáticos comunes (debe ir primero para mayor prioridad)
    location ~* \.(jpg|jpeg|png|gif|ico|css|js|svg|woff|woff2|ttf|eot|json|xml|txt|pdf|map)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
        try_files $uri =404;
    }

EOF_HEADER

# Procesar cada archivo tar.gz y descomprimir
echo ""
echo "=== Descomprimiendo archivos ==="
for file in /tmp/*.tar.gz; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        dirname=$(basename "$file" .tar.gz)
        # Eliminar el prefijo "docs-sp-" si existe
        branch=${dirname#docs-sp-}
        echo "Procesando: $branch"

        # Si es el DEFAULT_BRANCH, descomprimir en la raíz
        if [ "$branch" = "${DEFAULT_BRANCH}" ]; then
            echo "  -> Descomprimiendo en la raíz (rama principal)"
            tar -xzf "$file" -C /usr/share/nginx/html/
        else
            # Descomprimir en su propio subdirectorio
            echo "  -> Descomprimiendo en /$branch/"
            mkdir -p /usr/share/nginx/html/$branch
            tar -xzf "$file" -C /usr/share/nginx/html/$branch/
        fi
    fi
done

# Generar las configuraciones de location para cada directorio (excepto la raíz)
echo ""
echo "=== Generando configuraciones de location ==="
for dir in /usr/share/nginx/html/*/; do
    if [ -d "$dir" ]; then
        branch=$(basename "$dir")
        echo "Configurando location para: /$branch/"

        # Agregar location para esta rama
        cat >> /etc/nginx/conf.d/default.conf << EOF_LOCATION
    # Configuración para /$branch/ (SPA)
    location ~ ^/$branch(/|$) {
        alias /usr/share/nginx/html/$branch/;
        index index.html index.htm;

        # Intentar servir el archivo, si no existe servir index.html de esa rama
        try_files \$uri \$uri/ /$branch/index.html =404;
    }

EOF_LOCATION
    fi
done

# Cerrar el bloque server y agregar configuración para la raíz (rama principal)
cat >> /etc/nginx/conf.d/default.conf << 'EOF_FOOTER'
    # Configuración para la raíz (rama principal)
    # Esto debe ir al final para que tenga menor prioridad
    location / {
        try_files $uri $uri/ /index.html =404;
    }
}
EOF_FOOTER

echo ""
echo "=== Configuración de nginx generada ==="
cat /etc/nginx/conf.d/default.conf
echo "========================================"

echo ""
echo "=== Estructura de directorios ==="
ls -la /usr/share/nginx/html/
echo "========================================"

# Limpiar los archivos comprimidos para reducir el tamaño de la imagen
rm -f /tmp/*.tar.gz
