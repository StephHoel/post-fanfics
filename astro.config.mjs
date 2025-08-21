// @ts-check
import { defineConfig } from 'astro/config';

import tailwindcss from '@tailwindcss/vite';

// https://astro.build/config
export default defineConfig({
  base: '/post-fanfics/', // seu subdiretório do GitHub Pages
  site: 'https://stephhoel.github.io/post-fanfics/',
  vite: {
    plugins: [tailwindcss()]
  }
});