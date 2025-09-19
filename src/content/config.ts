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

export const collections = {
  'fanfics': fanfics,
};
