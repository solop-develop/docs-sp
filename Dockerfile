# Usar la última versión estable de nginx
FROM nginx:stable

# Crear directorio temporal para los archivos comprimidos
WORKDIR /tmp

# Copiar todos los archivos tar.gz descargados de S3
COPY s3-downloads/*.tar.gz /tmp/

# Copiar configuración personalizada de nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Descomprimir archivos tar.gz
# Todos los archivos (incluyendo la rama principal) se descomprimen en sus propios subdirectorios
RUN for file in /tmp/*.tar.gz; do \
        if [ -f "$file" ]; then \
            filename=$(basename "$file"); \
            dirname=$(basename "$file" .tar.gz); \
            # Eliminar el prefijo "docs-sp-" si existe
            dirname=${dirname#docs-sp-}; \
            echo "Descomprimiendo $file en directorio $dirname..."; \
            mkdir -p /usr/share/nginx/html/$dirname; \
            tar -xzf "$file" -C /usr/share/nginx/html/$dirname/; \
        fi \
    done && \
    # Limpiar los archivos comprimidos para reducir el tamaño de la imagen
    rm -f /tmp/*.tar.gz

# Exponer el puerto 80
EXPOSE 80

# El comando por defecto de nginx ya está definido en la imagen base
# nginx -g "daemon off;"
