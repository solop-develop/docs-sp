# Usar la última versión estable de nginx
FROM nginx:stable

# Argumento para definir la rama/tag principal que se montará en la raíz
ARG DEFAULT_BRANCH=main

# Crear directorio temporal para los archivos comprimidos
WORKDIR /tmp

# Copiar todos los archivos tar.gz descargados de S3
COPY s3-downloads/*.tar.gz /tmp/

# Descomprimir archivos tar.gz
# Si existe el archivo de la rama principal, se descomprime en la raíz
# Los demás se descomprimen en sus propios directorios
RUN DEFAULT_FILE="docs-sp-${DEFAULT_BRANCH}.tar.gz" && \
    echo "Buscando archivo principal: $DEFAULT_FILE" && \
    # Primero verificar si existe el archivo principal y descomprimirlo en la raíz
    if [ -f "/tmp/$DEFAULT_FILE" ]; then \
        echo "Descomprimiendo $DEFAULT_FILE en la raíz..."; \
        tar -xzf "/tmp/$DEFAULT_FILE" -C /usr/share/nginx/html/; \
    fi && \
    # Descomprimir los demás archivos en sus propios directorios
    for file in /tmp/*.tar.gz; do \
        if [ -f "$file" ]; then \
            filename=$(basename "$file"); \
            # Saltar el archivo principal si ya se procesó
            if [ "$filename" != "$DEFAULT_FILE" ]; then \
                dirname=$(basename "$file" .tar.gz); \
                # Eliminar el prefijo "docs-sp-" si existe
                dirname=${dirname#docs-sp-}; \
                echo "Descomprimiendo $file en directorio $dirname..."; \
                mkdir -p /usr/share/nginx/html/$dirname; \
                tar -xzf "$file" -C /usr/share/nginx/html/$dirname/; \
            fi \
        fi \
    done && \
    # Limpiar los archivos comprimidos para reducir el tamaño de la imagen
    rm -f /tmp/*.tar.gz

# Exponer el puerto 80
EXPOSE 80

# El comando por defecto de nginx ya está definido en la imagen base
# nginx -g "daemon off;"
