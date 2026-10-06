# O que é o D-Disker?

D-Disker é um canivete suíço para manipulação de disco, utilizando comandos do próprio sistema Linux para executar as ações.

## Quais as funcionalidades?

### D-Disker é capaz de:

* Inserir imagens ISO diretamente em discos (Usando dd);
* Formatar filesystem de discos (Sendo os mais comuns: FAT32, NTFS ou EXT4);
* Limpar disco completamente (Apagar completamente tudo, sistema operacional, arquivos, tudo, "zerando" o disco inteiro;
* Mostrar informações de um disco;

## Qual o objetivo do D-Disker?

Facilitar a manipulação de disco, sem precisar usar comandos muito extensos ou complexos.

## **!!! Aviso urgente !!!**

**Caso você vá fazer alguma tarefa use o comando ```lsblk``` para saber qual é o disco que você gostaria de realizar tal tarefa.**

## Dependências

* ```dd``` --> Utilizado para inserir arquivos ISO nos discos diretamente e usado para "zerar" o disco.
* ```mkfs``` --> Usado para formatar arquivos de filesystem.
* ```lsblk```, ```wipefs``` e ```df``` --> Usados na coleta de informações do disco.

## Sintaxe do comando

```bash
d-disk <flag> <disco> <argumento>
```

d-disk é a ferramenta que irá ser executada, enquanto as flags são o tipo de tarefa que você quer realizar. A parte do disco é a que eu tomaria cuidado, afinal, 
o d-disker utiliza ferramentas destrutivas, caso sejam usadas de forma inadequada. Já argumento pode depender muito, pois, ele pode ser um arquivo iso (Caso você
use ```--boot``` ou ```-b``` nas flags) ou o próprio filesystem (Caso você use ```--format``` ou ```-f```).

## Flags do D-Disker

| Comando | Descrição |
| ------- | --------- |
| `d-disk --boot` ou `d-disk -b` | Inserir ISO diretamente no disco |
| `d-disk --help` ou `d-disk -h` | Ajuda |
| `d-disk --format` ou `d-disk -f` | Formatar filesystem do disco (Podendo ser EXT4, FAT32 ou NTFS) |
| `d-disk --info` ou `d-disk -i` | Informações sobre o disco | 
| `d-disk --clear` ou `d-disk -c` | "Zerar" o HD |

## Exemplos de comandos

Caso queira inserir uma ISO diretamente no disco, exemplo:

```bash
d-disk --boot /dev/sdX ubuntu.iso
```
ou
```bash
d-disk -b /dev/sdX ubuntu.iso
```

Caso queira formatar um disco, exemplo:

Se for EXT4:

```bash
d-disk --format /dev/sdX ext4
```
ou
```bash
d-disk -f /dev/sdX ext4
```

Se for NTFS:

```bash
d-disk --format /dev/sdX ntfs
```
 ou 
```bash
d-disk -f /dev/sdX ntfs
``` 

Se for FAT32:

```bash
d-disk --format /dev/sdX fat32
```
ou
```bash
d-disk -f /dev/sdX fat32
```

Caso queira apagar tudo do disco e deixá-lo vazio (No caso "Zerar" o HD), exemplo:

```bash
d-disk --clear /dev/sdX
```
ou
```bash
d-disk -c /dev/sdX
```

OBS: Pode demorar um pouco, uma vez que ele apaga o disco inteiro.

Caso queira ver informações do disco, exemplo:

```bash
d-disk --info /dev/sdX
```
ou 
```bash
d-disk -i /dev/sdX
```

