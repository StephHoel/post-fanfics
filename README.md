# 📚 Fanfics Astro Project

Projeto para publicação e organização de fanfics usando Astro, TypeScript e TailwindCSS.

## ✨ Funcionalidades

- Listagem de fanfics agrupadas por nome
- Visualização de capítulos, com destaque para capítulo 0 (sinopse)
- Contador de palavras por capítulo
- Estrutura flexível para metadados e schemas aninhados

## 🗂️ Estrutura do Projeto

```text
/fanfics
├── public/                # Assets estáticos (imagens, favicon, etc)
├── src/
│   ├── content/           # Conteúdo das fanfics em Markdown
│   │   └── fanfics/       # Pastas e arquivos de cada fanfic
│   ├── layouts/           # Layouts Astro
│   ├── pages/             # Páginas Astro (rotas)
│   ├── styles/            # Estilos globais (Tailwind)
│   └── utils/             # Funções utilitárias (agrupamento, ordenação, etc)
├── package.json           # Dependências e scripts
└── README.md              # Este arquivo
```

## 🚀 Como rodar

1. Instale as dependências:

```sh
  npm install
```

2. Inicie o servidor de desenvolvimento:

```sh
npm run dev
```

3. Acesse em [localhost:4321](http://localhost:4321)

## 🛠️ Tecnologias

- [Astro](https://astro.build/) - Framework principal
- [TypeScript](https://www.typescriptlang.org/) - Tipagem estática
- [TailwindCSS](https://tailwindcss.com/) - Estilização

## 📄 Estrutura dos capítulos

Cada capítulo é um arquivo Markdown em `src/content/fanfics/<fanfic>/<chapter>.md` com cabeçalho YAML:

```yaml
---
title: "Título do Capítulo"
chapter: 1
publishDate: 2025-08-20
link: "https://..."
chapterDetails:
  synopsis: "Sinopse"
  tags: "tag1, tag2, tag3"
---
```

## 📢 Dicas

- Para adicionar uma nova fanfic, crie uma pasta em `src/content/fanfics/` e adicione os capítulos em Markdown.
- O capítulo 0 pode ser usado para sinopse ou introdução especial.
- Personalize layouts e estilos conforme desejar!

---
Projeto mantido por Steph Hoel.
