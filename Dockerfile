# Usar la última versión estable de nginx
FROM nginx:stable

# Argumentos para configuración
ARG DEFAULT_BRANCH=main
ARG MAIN_DOMAIN=docs1.dev.solopcloud.com

# Convertir los ARGs en variables de entorno
ENV DEFAULT_BRANCH=${DEFAULT_BRANCH}
ENV MAIN_DOMAIN=${MAIN_DOMAIN}

# Crear directorio temporal para los archivos comprimidos
WORKDIR /tmp

# Copiar todos los archivos tar.gz descargados de S3
COPY s3-downloads/*.tar.gz /tmp/

# Copiar el script de generación de configuración
COPY generate-nginx-config.sh /tmp/generate-nginx-config.sh

# Dar permisos de ejecución y ejecutar el script
RUN chmod +x /tmp/generate-nginx-config.sh && \
    /tmp/generate-nginx-config.sh && \
    rm /tmp/generate-nginx-config.sh

# Exponer el puerto 80
EXPOSE 80

# El comando por defecto de nginx ya está definido en la imagen base
# nginx -g "daemon off;"
