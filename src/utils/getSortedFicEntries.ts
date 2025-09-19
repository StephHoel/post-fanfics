import { ficNames } from './ficNames'

export function getSortedFicEntries() {
  return Object.entries(ficNames).sort((a, b) => a[0].localeCompare(b[0]))
}