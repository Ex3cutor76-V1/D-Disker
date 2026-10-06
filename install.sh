#!/usr/bin/env bash

# Cores
VERDE=$'\033[32m'
VERMELHO=$'\033[31m'
AMARELO=$'\033[33m'
RESET=$'\033[0m'

# Variáveis importantes

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
D_DISKER="$SCRIPT_DIR/d-disk"
DEPENDENCIAS=(bash
    coreutils
    util-linux
    mawk
    e2fsprogs
    dosfstools
    ntfs-3g
    sudo
)
PASTE="/usr/local/bin/"

# Verificando root
printf "${AMARELO}Identificando root...${RESET}\n"
sleep 1
if [[ "$EUID" -ne 0 ]]; then
printf "${VERMELHO}Permissão negada, use: sudo ./install.sh${RESET}\n"
exit 1
else
printf "${VERDE}Análise confirmada!${RESET}\n"
fi

# Verificação do arquivo d-disk
printf "${AMARELO}Verificando se o arquivo existe...${RESET}\n"
sleep 1
if [ -f "$D_DISKER" ]; then
printf "${VERDE}O Arquivo existe!${RESET}\n"
else
printf "${VERMELHO}O arquivo não existe, por favor instale no github${RESET}\n"
fi

# Verificando dependências
printf "${AMARELO}Verificando dependências...${RESET}\n"

FALTANDO=()

for pacote in "${DEPENDENCIAS[@]}"; do
if dpkg -s "$pacote" >/dev/null 2>&1; then
printf "${VERDE}[OK]${RESET} %s\n" "$pacote"
else
printf "${VERMELHO}[FALTA]${RESET} %s\n" "$pacote"
FALTANDO+=("$pacote")
fi
done
if [[ ${#FALTANDO[@]} -gt 0 ]]; then
printf "${AMARELO}Instalando dependências...${RESET}\n"
apt update
apt install -y "${FALTANDO[@]}"
fi

# Organizando...
printf "${AMARELO}Organizando script...${RESET}\n"
sleep 1
cp "$D_DISKER" "$PASTE"
printf "${VERDE}Organizado com sucesso!${RESET}\n"
rm -- "$SCRIPT_DIR/$(basename "$0")"
