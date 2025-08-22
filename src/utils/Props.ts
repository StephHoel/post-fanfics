export interface Props {
  chapter: number;
  slug: string;
  chapters: Array<{ data: { chapter: number }, slug: string }>;
}

export interface Button {
  chapter: number
  slug: string
  direction: 'next' | 'prev'
}