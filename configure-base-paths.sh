#!/bin/bash
set -e

# La variable DEFAULT_BRANCH debe ser pasada como variable de entorno
if [ -z "$DEFAULT_BRANCH" ]; then
    echo "ERROR: DEFAULT_BRANCH no está definida"
    exit 1
fi

echo "=== Configurando base paths para cada directorio ==="
echo "DEFAULT_BRANCH: ${DEFAULT_BRANCH}"
echo ""

# Procesar cada archivo tar.gz descargado
# TODAS las ramas van a subdirectorios (incluyendo la principal)
for file in /tmp/*.tar.gz; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        dirname=$(basename "$file" .tar.gz)
        # Eliminar el prefijo "docs-sp-" si existe
        branch=${dirname#docs-sp-}

        echo "Procesando: $branch"

        # TODAS las ramas van a su propio subdirectorio
        BASE_PATH="/${branch}/"
        TARGET_DIR="/usr/share/nginx/html/${branch}"

        if [ "$branch" = "${DEFAULT_BRANCH}" ]; then
            echo "  -> Base path: ${BASE_PATH} (rama principal)"
        else
            echo "  -> Base path: ${BASE_PATH}"
        fi

        # Crear el directorio de destino
        mkdir -p "${TARGET_DIR}"

        # Descomprimir
        echo "  -> Descomprimiendo en ${TARGET_DIR}"
        tar -xzf "$file" -C "${TARGET_DIR}/"

        # Agregar/modificar el base tag en todos los archivos HTML
        echo "  -> Configurando base path en archivos HTML"
        find "${TARGET_DIR}" -type f -name "*.html" | while read html_file; do
            # Verificar si ya existe un <base> tag
            if grep -q "<base" "$html_file"; then
                # Reemplazar el base tag existente
                sed -i "s|<base href=\"[^\"]*\"|<base href=\"${BASE_PATH}\"|g" "$html_file"
            else
                # Agregar base tag después de <head>
                sed -i "s|<head>|<head>\n    <base href=\"${BASE_PATH}\">|" "$html_file"
            fi
        done

        echo "  -> ✓ Completado"
        echo ""
    fi
done

# Crear redirección 301 en la raíz hacia la rama principal
echo "=== Creando redirección en raíz ==="
cat > /usr/share/nginx/html/index.html << EOF
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="0;url=/${DEFAULT_BRANCH}/">
    <link rel="canonical" href="/${DEFAULT_BRANCH}/" />
    <title>Redireccionando...</title>
</head>
<body>
    <p>Redireccionando a <a href="/${DEFAULT_BRANCH}/">/${DEFAULT_BRANCH}/</a>...</p>
    <script>window.location.replace("/${DEFAULT_BRANCH}/");</script>
</body>
</html>
EOF
echo "  -> Redirección creada: / → /${DEFAULT_BRANCH}/"

echo ""
echo "=== Estructura de directorios final ==="
ls -la /usr/share/nginx/html/
echo ""

# Limpiar los archivos comprimidos
rm -f /tmp/*.tar.gz

echo "=== Configuración completada ==="
