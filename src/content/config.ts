import { defineCollection, z } from 'astro:content'

const chapterDetailsSchema = z.object({
  synopsis: z.string(),
  tags: z.string(),
})

const fanfics = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    chapter: z.number(),
    publishDate: z.date().nullable(),
    link: z.string().nullable(),
    chapterDetails: chapterDetailsSchema.optional()
  }),
});

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
};
