# AtualizarDrivers.ps1

## Descrição

O **AtualizarDrivers.ps1** é um script PowerShell que:

* Verifica e instala automaticamente drivers disponíveis pelo **Windows Update**.
* Exibe o link para o download das últimas versões conhecidas dos drivers da **NVIDIA**, **Intel** e **AMD**.
* Inclui um sistema de **auto-desbloqueio** que remove a marcação de “arquivo baixado da internet” e ajusta a **política de execução** para permitir a execução do script sem exigir configurações manuais permanentes.

Este script é ideal para manter drivers atualizados em computadores Windows de forma prática e sem precisar buscar manualmente em sites de fabricantes.

---

## Funcionalidades

* **Auto-desbloqueio** de arquivos baixados da internet (`Unblock-File`).
* Ajuste automático da política de execução para **Bypass** apenas na sessão atual.
* Instalação automática do módulo **PSWindowsUpdate** se não estiver presente.
* Busca e instalação de drivers através do **Windows Update**.
* Exibe versões mais recentes de drivers para **NVIDIA**, **Intel** e **AMD**.
* Não abre páginas de fabricantes automaticamente (o usuário decide).

---

## Requisitos

* **Sistema:** Windows 10 ou superior.
* **Permissões:** Executar como **Administrador**.
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
    .\AtualizarDrivers.ps1  
  ```

> **Observação:** Não é necessário alterar manualmente a política de execução — o script faz isso sozinho.

---

## Saída esperada

O script exibirá:

* Lista de drivers encontrados no Windows Update.
* Status de instalação.
* Últimas versões conhecidas de:

  * NVIDIA (link para download).
  * Intel (link para assistente oficial).
  * AMD (link para download).

Exemplo de saída quando drivers são encontrados:

```plaintext
Procurando drivers no Windows Update...
Foram encontrados os seguintes drivers:
<lista de drivers>

Instalando drivers...
<progresso da instalação>

Ultimas versoes conhecidas dos fabricantes:
NVIDIA - Verifique via site oficial: https://www.nvidia.com/Download/index.aspx
Intel - Verifique via Assistente de Drivers: https://downloadcenter.intel.com/DriverUpdate
AMD - Verifique via site oficial: https://www.amd.com/en/support

=== Processo concluido ===
OBS: Drivers instalados via Windows Update ja foram aplicados. Reinicializacao pode ser necessaria.
```

---

## Observações importantes

* O Windows Update só oferece drivers que foram enviados pelos fabricantes à Microsoft — pode haver versões mais novas nos sites oficiais.
* Se não houver drivers disponíveis, será exibida a mensagem:

  ```
  Nenhum driver encontrado no Windows Update.
  ```

* Drivers críticos podem exigir reinicialização automática, que será executada se necessário.

---

## Licença

Uso livre para fins pessoais ou comerciais.
Modificações são permitidas, desde que mantidas as devidas referências.
