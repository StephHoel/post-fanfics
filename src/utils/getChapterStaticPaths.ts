import { getCollection } from 'astro:content';

/**
 * Função utilitária para gerar static paths para páginas de capítulos de fanfic
 */
export async function getChapterStaticPaths() {
  const posts = await getCollection('fanfics');
  return posts.map((post) => {
    const [fic] = post.slug.split('/');
    
    const chapters = posts.filter(p => p.slug.startsWith(fic));
    
    const [_, chapter] = post.slug.split('/');
    
    return {
      params: { fic, chapter },
      props: { post, chapters },
    };
  });
}
