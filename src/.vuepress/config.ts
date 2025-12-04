import { defineUserConfig } from "@vuepress/cli";
import theme from "./theme";
import { searchPlugin } from '@vuepress/plugin-search'
import { path } from "@vuepress/utils";
import * as fs from 'fs'; // Necesario para verificar si el archivo `.env` existe
import * as dotenv from 'dotenv'; // Necesario para cargar el archivo de variables de entorno

const envPath = path.resolve(__dirname, '../../.env'); 
// Verifica si el archivo .env existe
if (fs.existsSync(envPath)) {
    console.log(`Cargando variables desde: ${envPath}`);

    // 2. Carga las variables desde el archivo .env
    // Nota: Por defecto, dotenv NO sobrescribe variables de entorno ya existentes.
    dotenv.config({ path: envPath }); 
} else {
    console.log(`El archivo .env no existe en ${envPath}. Usando variables del entorno.`);
}

// Configuración dinámica del base path según la rama
// TODAS las ramas usan su propio base path (incluyendo la rama principal)
// La variable BRANCH_NAME debe ser pasada desde el build
const branchName = process.env.BRANCH_NAME;

if (!branchName) {
  throw new Error('ERROR: BRANCH_NAME no está definida. Debe ser pasada desde el build.');
}

// Siempre usar /nombre-de-la-rama/ (sin excepciones)
const basePath = `/${branchName}/`;

console.log('========================================');
console.log('VuePress Base Path Configuration');
console.log('========================================');
console.log('BRANCH_NAME:', branchName);
console.log('Base Path:', basePath);
console.log('========================================');

export default defineUserConfig({
  base: basePath,

  alias: {
    "@Releases": path.resolve(__dirname, "components/Releases.vue"),
  },
  dest: "dist",

  head: [
    ["link", { rel: "icon", href: "/favicon.ico" }],
    ["meta", { name: "baidu-site-verification", content: "4H7tszevS8" }],
    ["meta", { name: "baidu-site-verification", content: "nGf5yi0Gec" }],
    [
      "link",
      {
        rel: "mask-icon",
        href: "/assets/safari-pinned-tab.svg",
        color: "#5c92d1",
      },
    ],
  ],

  locales: {
    "/": {
      lang: "es-ES",
      title: "",
      description: "Página oficial de documentación Solop ERP",
    },
  },

  theme,

  plugins: [
    searchPlugin({
      // options
      locales: {
        '/': {
          placeholder: 'Buscar',
        },
      },
    })
  ],

  shouldPrefetch: false,
});