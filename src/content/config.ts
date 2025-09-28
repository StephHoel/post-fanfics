import { defineCollection, z } from 'astro:content'
import { Status } from '../enums/status'

const fanfics = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    chapter: z.number(),
    status: z.enum(Object.values(Status) as [string, ...string[]]),

    // são obrigatórias caso chapter seja 0
    synopsis: z.string().optional(),
    tags: z.string().optional(),

    // são obrigatórias caso status seja "publicado"
    publishDate: z.date().optional(),
    link: z.string().optional(),
  }).refine(
    (data) =>
      !['publicado'].includes(data.status) || !!data.publishDate || !!data.link,
    {
      message: "data de publicação e link são obrigatórios quando status for 'publicado'",
      path: ['publishDate', 'link'],
    }
  ).refine((data) => data.chapter === 0 || !!data.synopsis || !!data.tags, {
    message: "sinopse e tags são obrigatórias se capítulo for 0",
    path: ['synopsis', 'tags']
  }),
})

const dicas = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    date: z.date(),
  })
})

export const collections = {
  'fanfics': fanfics,
  'dicas': dicas
}
