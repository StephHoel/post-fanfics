/**
 * Agrupa uma lista de posts por fanfic (slug antes da primeira barra)
 * @param posts - array de posts
 * @returns objeto agrupado por slug da fanfic
 */
export function groupPostsByFic(posts: Array<{ slug: string }>): Record<string, typeof posts> {
  return posts.reduce((acc, post) => {
    const [ficSlug] = post.slug.split('/');
    acc[ficSlug] ??= [];
    acc[ficSlug].push(post);
    return acc;
  }, {} as Record<string, typeof posts>);
}
