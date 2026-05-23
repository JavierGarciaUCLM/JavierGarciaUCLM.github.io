import { defineConfig } from 'astro/config';
import mdx from '@astrojs/mdx';
import sitemap from '@astrojs/sitemap';
import tailwind from "@astrojs/tailwind";


export default defineConfig({
  site: 'https://javiergarciatercero.es',
  compressHTML: true,
  integrations: [
    mdx(),
    sitemap({
      filter: (page) => !page.includes('/store/'),
      serialize(item) {
        if (item.url.includes('/blog/') && !item.url.includes('/tag/')) {
          return { ...item, changefreq: 'monthly', priority: 0.8 };
        }
        if (item.url === 'https://javiergarciatercero.es/') {
          return { ...item, changefreq: 'weekly', priority: 1.0 };
        }
        return { ...item, changefreq: 'monthly', priority: 0.5 };
      },
    }),
    tailwind(),
  ],
});