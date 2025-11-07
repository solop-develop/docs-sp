#!/bin/bash
set -e

echo "=== Configuración ==="
echo "DEFAULT_BRANCH: ${DEFAULT_BRANCH}"
echo "MAIN_DOMAIN: ${MAIN_DOMAIN}"
echo ""
echo "Generando configuración de nginx dinámicamente..."

# Iniciar el archivo de configuración
cat > /etc/nginx/conf.d/default.conf << 'EOF_HEADER'
# Configuración generada dinámicamente para subdominios

EOF_HEADER

# Procesar cada archivo tar.gz
for file in /tmp/*.tar.gz; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        dirname=$(basename "$file" .tar.gz)
        # Eliminar el prefijo "docs-sp-" si existe
        branch=${dirname#docs-sp-}
        echo "Procesando: $branch"

        # Descomprimir el archivo
        mkdir -p /usr/share/nginx/html/$branch
        tar -xzf "$file" -C /usr/share/nginx/html/$branch/

        # Generar configuración de nginx para este branch
        # Si es el DEFAULT_BRANCH, configurar tanto el dominio principal como el subdominio
        if [ "$branch" = "${DEFAULT_BRANCH}" ]; then
            echo "Configurando $branch como dominio principal (${MAIN_DOMAIN}) y subdominio (${branch}.${MAIN_DOMAIN})"
            cat >> /etc/nginx/conf.d/default.conf << EOF_MAIN
# Configuración para el dominio principal - rama ${DEFAULT_BRANCH}
server {
    listen 80 default_server;
    server_name ${MAIN_DOMAIN};

    root /usr/share/nginx/html/$branch;
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

    # Configuración para archivos estáticos comunes
    location ~* \.(jpg|jpeg|png|gif|ico|css|js|svg|woff|woff2|ttf|eot|json|xml|txt|pdf|map)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
        try_files \$uri =404;
    }

    # Configuración SPA: redirigir todo a index.html
    location / {
        try_files \$uri \$uri/ /index.html =404;
    }
}

EOF_MAIN
        fi

        # Configurar subdominio para todas las ramas (incluyendo la principal)
        echo "Configurando subdominio: ${branch}.${MAIN_DOMAIN}"
        cat >> /etc/nginx/conf.d/default.conf << EOF_SERVER
# Configuración para $branch
server {
    listen 80;
    server_name ${branch}.${MAIN_DOMAIN};

    root /usr/share/nginx/html/$branch;
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

    # Configuración para archivos estáticos comunes
    location ~* \.(jpg|jpeg|png|gif|ico|css|js|svg|woff|woff2|ttf|eot|json|xml|txt|pdf|map)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
        try_files \$uri =404;
    }

    # Configuración SPA: redirigir todo a index.html
    location / {
        try_files \$uri \$uri/ /index.html =404;
    }
}

EOF_SERVER
    fi
done

echo ""
echo "=== Configuración de nginx generada ==="
cat /etc/nginx/conf.d/default.conf
echo "========================================"

# Limpiar los archivos comprimidos para reducir el tamaño de la imagen
rm -f /tmp/*.tar.gz
