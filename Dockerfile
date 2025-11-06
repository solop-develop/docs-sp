# Usar la última versión estable de nginx
FROM nginx:stable

# Crear directorio temporal para los archivos comprimidos
WORKDIR /tmp

# Copiar todos los archivos tar.gz descargados de S3
COPY s3-downloads/*.tar.gz /tmp/

# Descomprimir cada archivo tar.gz en su propio directorio dentro de nginx
# El directorio por defecto de nginx es /usr/share/nginx/html
RUN for file in /tmp/*.tar.gz; do \
    if [ -f "$file" ]; then \
        # Obtener el nombre base sin la extensión .tar.gz
        dirname=$(basename "$file" .tar.gz); \
        echo "Descomprimiendo $file en directorio $dirname..."; \
        # Crear directorio específico y descomprimir
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
