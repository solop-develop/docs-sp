# Usar la última versión estable de nginx
FROM nginx:stable

# Argumentos para configuración
ARG DEFAULT_BRANCH=main

# Convertir los ARGs en variables de entorno
ENV DEFAULT_BRANCH=${DEFAULT_BRANCH}

# Crear directorio temporal para los archivos comprimidos
WORKDIR /tmp

# Copiar todos los archivos tar.gz descargados de S3
COPY s3-downloads/*.tar.gz /tmp/

# Copiar configuración estática de nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar el script de configuración de base paths
COPY configure-base-paths.sh /tmp/configure-base-paths.sh

# Dar permisos de ejecución y ejecutar el script
RUN chmod +x /tmp/configure-base-paths.sh && \
    /tmp/configure-base-paths.sh && \
    rm /tmp/configure-base-paths.sh

# Exponer el puerto 80
EXPOSE 80

# El comando por defecto de nginx ya está definido en la imagen base
# nginx -g "daemon off;"
