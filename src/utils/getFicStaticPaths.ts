import { getCollection } from 'astro:content';

/**
 * Função utilitária para gerar static paths para páginas de fanfics
 */
export async function getFicStaticPaths() {
  const posts = await getCollection('fanfics');
  const fics = [...new Set(posts.map((p) => p.slug.split('/')[0]))];

  return fics.map((fic) => ({
    params: { fic },
    props: {
      chapters: posts.filter((p) => p.slug.startsWith(fic)),
      fic,
    },
  }));
}
