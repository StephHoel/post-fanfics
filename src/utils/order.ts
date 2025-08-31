/**
 * Ordena capítulos por número do capítulo, ignorando capítulo 0
 * @param chapters - array de capítulos
 * @returns capítulos ordenados
 */
export function orderChapters<T extends { data: { chapter?: number } }>(chapters: T[]): T[] {
  return chapters
    .filter((chapter) => typeof chapter.data.chapter === 'number' && chapter.data.chapter !== 0)
    .sort((a, b) => (a.data.chapter ?? 0) - (b.data.chapter ?? 0))
}
