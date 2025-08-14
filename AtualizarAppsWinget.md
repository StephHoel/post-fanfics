# AtualizarAppsWinget-Interativo.ps1

## Descrição

O **AtualizarAppsWinget-Interativo.ps1** é um script PowerShell que permite atualizar aplicativos instalados via **winget** de forma **interativa**.

* Lista todos os aplicativos que possuem atualização disponível.
* Permite que o usuário **escolha quais apps atualizar** digitando os números correspondentes.
* Resposta vazia significa que **todos os apps serão atualizados**.
* Mantém o processo **silencioso**, aceitando automaticamente os acordos de licença.

Este script é ideal para manter aplicativos atualizados sem precisar verificar manualmente cada um ou abrir várias telas de atualização.

---

## Funcionalidades

* Verifica se o `winget` está instalado e encerra o script caso não esteja.
* Lista aplicativos que possuem atualização disponível.
* Permite seleção **interativa** de quais apps atualizar.
* Atualização automática de apps selecionados com `--silent` e aceitação de acordos de licença.
* Feedback em tela sobre sucesso ou falha na atualização.

---

## Requisitos

* **Sistema:** Windows 10 ou superior.
* **Permissões:** Deve ser executado como **Administrador** para atualizar apps do sistema.
* **Internet:** Conexão ativa para baixar atualizações.
* **PowerShell:** Versão 5.1 ou superior.

---

## Como usar

1. **Executar o script**

  * Abra o PowerShell como Administrador e navegue até a pasta onde seu arquivo foi baixado.
  * Execute o comando abaixo para desbloquear seu arquivo e em seguida executá-lo:
  
  ```powershell
    $scriptPath = $MyInvocation.MyCommand.Path
    Unblock-File -Path '$scriptPath'
    .\AtualizarAppsWinget.ps1
  ```

2. **Selecionar aplicativos para atualizar**

   * O script mostrará uma lista numerada com todos os aplicativos que possuem atualização.
   * Digite os números correspondentes separados por vírgula (`1,3,5`) para atualizar apenas alguns apps.
   * Deixe a entrada **vazia** para atualizar **todos os aplicativos listados**.

---

## Saída esperada

Exemplo de saída:

```
Aplicativos com atualizacao disponivel:
1: Google.Chrome - Versao atual: 115.0 - Versao nova: 116.0
2: VisualStudioCode - Versao atual: 1.78 - Versao nova: 1.79
3: Spotify - Versao atual: 1.2.3 - Versao nova: 1.2.5

Digite os numeros dos aplicativos que deseja atualizar separados por virgula (vazio = todos)
```

Após a seleção, o script exibirá:

```
Atualizando Google.Chrome...
Google.Chrome atualizado com sucesso.

Atualizando VisualStudioCode...
Falha ao atualizar VisualStudioCode.

Atualizando Spotify...
Spotify atualizado com sucesso.

=== Processo de atualizacao de aplicativos concluido ===
```

---

## Observações importantes

* Alguns aplicativos podem não suportar instalação silenciosa ou exigir interação adicional — nesses casos, a atualização pode falhar.
* Apps do sistema exigem **permissão de administrador**.
* O script **não altera permanentemente políticas de execução** e funciona somente na sessão atual.

---

## Licença

Uso livre para fins pessoais ou comerciais.
Modificações são permitidas, desde que mantidas as devidas referencias.
