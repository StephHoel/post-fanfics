import { defineCollection, z } from 'astro:content'

const fanfics = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string(),
    chapter: z.number(),
    publishDate: z.date().nullable(),
    link: z.string().nullable(),
    isReviewed: z.boolean().optional(),
    isApproved: z.boolean().optional(),
    isPublished: z.boolean().optional(),
    obs: z.string().nullable().optional(),
    synopsis: z.string().optional(),
    tags: z.string().optional(),
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
