/**
 * Conta o número de palavras em um conteúdo de texto
 * @param content - string do conteúdo
 * @returns número de palavras
 */
export function countWords(content: string): number {
  if (!content) return 0;
  const clean = content
    .replace(/<[^>]*>/g, '') // remove tags HTML
    .replace(/[#*_`\-]/g, '') // remove alguns caracteres markdown
    .replace(/\s+/g, ' ') // normaliza espaços
    .trim();
  if (!clean) return 0;
  return clean.split(' ').filter(Boolean).length;
}
