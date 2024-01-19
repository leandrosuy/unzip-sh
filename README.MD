# Gerenciador de Arquivos - Script Shell

Este script em Shell fornece um gerenciador de arquivos simples com a capacidade de compactar em ZIP, compactar em RAR e descompactar arquivos. Ele utiliza a interface gráfica do Zenity para facilitar a interação com o usuário.

## Pré-requisitos

Certifique-se de que o seguinte software está instalado no seu sistema antes de executar o script:

- **Zenity**: O Zenity é uma ferramenta que fornece caixas de diálogo gráficas para scripts shell. Certifique-se de que está instalado executando o comando:

  ```bash
  sudo apt-get install zenity
  ```

- **Unzip e Rar**: Os comandos `unzip` e `rar` são usados para descompactar arquivos. Certifique-se de que estão instalados em seu sistema:
  ```bash
  sudo apt-get install unzip rar
  ```

## Como Executar

1. Abra um terminal.
2. Navegue até o diretório onde o script está localizado.
3. Dê permissão de execução ao script:
   ```bash
   chmod +x nome_do_script.sh
   ```
4. Execute o script:
   ```bash
   ./nome_do_script.sh
   ```

## Funcionalidades

O script oferece as seguintes opções:

1. **Compactar em ZIP**: Seleciona um arquivo para compactar em formato ZIP. O usuário fornece um nome para o arquivo ZIP resultante.

2. **Compactar em RAR**: Seleciona um arquivo para compactar em formato RAR. O usuário fornece um nome para o arquivo RAR resultante.

3. **Descompactar**: Seleciona um arquivo ZIP ou RAR para descompactar em um diretório específico.

4. **Sair**: Encerra o script.

## Observações

- Certifique-se de fornecer nomes válidos para os arquivos ZIP e RAR.
- A descompactação suporta tanto arquivos ZIP quanto RAR.

**Nota**: Este script foi projetado para sistemas Linux com suporte ao Zenity, Unzip e Rar. Certifique-se de ter as permissões necessárias para executar o script e de instalar as dependências mencionadas.
