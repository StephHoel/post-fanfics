import { ficNames } from './ficNames'

/**
 * Retorna o nome legível de uma fanfic a partir do slug
 * @param slug - slug da fanfic
*/
export function getFicName(slug: string): string {
  const key = slug.split('/')[0]
  return ficNames[key] ?? key
}
