---
title: Reordenar Commit
chapter: 1
publishDate: 
link: 
---

Para reordenar commits usando o Vim durante um rebase interativo:

1. Execute no terminal:
  
    ```bash
    git rebase -i HEAD~N
    ```
  
    (Substitua `N` pelo número de commits que deseja reordenar.)

2. O Vim abrirá uma lista de commits. Cada linha começa com `pick`.

3. Para reordenar, mova as linhas dos commits para a ordem desejada (use comandos de movimentação do Vim, como `dd` para cortar e `p` para colar).

4. Salve e saia do Vim (`:wq`).

O Git aplicará os commits na nova ordem. Resolva conflitos se aparecerem.
