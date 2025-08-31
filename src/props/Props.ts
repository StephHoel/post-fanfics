export interface Props {
  chapter: number
  slug: string
  chapters: Array<{ data: { chapter: number }, slug: string }>
}
