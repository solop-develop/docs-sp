import { defineUserConfig } from "@vuepress/cli";
import theme from "./theme";
import { searchPlugin } from '@vuepress/plugin-search'
import { path } from "@vuepress/utils";

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