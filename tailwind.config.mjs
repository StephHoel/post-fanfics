import typography from '@tailwindcss/typography'

/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./src/**/*.{astro,html,js,jsx,ts,tsx,vue,svelte,md,mdx}",
  ],
  darkMode: 'class', // ou 'media' se quiser automático pelo SO
  theme: {
    extend: {},
  },
  plugins: [typography],
};
