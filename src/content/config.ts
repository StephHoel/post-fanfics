import { defineCollection, z } from 'astro:content'
import { Status } from '../enums/status'

const fanfics = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    chapter: z.number(),
    status: z.enum(Object.values(Status) as [string, ...string[]]),

    // Obrigatórias se chapter for 0
    synopsis: z.string().optional(),
    tags: z.string().optional(),

    // Obrigatórias se status for "publicado"
    publishDate: z.date().optional().nullable(),
    link: z.string().optional().nullable(),
  })
  .refine(
    (data) => {
      if (data.status === 'publicado') {
        return !!data.publishDate && !!data.link
      }
      return true
    },
    {
      message: "data de publicação e link são obrigatórios quando status for 'publicado'",
      path: ['publishDate', 'link'],
    }
  )
  .refine(
    (data) => {
      if (data.chapter === 0) {
        return !!data.synopsis && !!data.tags
      }
      return true
    },
    {
      message: "sinopse e tags são obrigatórias se capítulo for 0",
      path: ['synopsis', 'tags'],
    }
  ),
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
