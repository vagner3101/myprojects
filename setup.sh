#!/bin/bash
# Script de instalação e configuração

# Verificar se o Docker está instalado
if ! command -v docker &> /dev/null; then
    echo "Docker não está instalado. Instalando..."
    # Comando para instalar o Docker (dependendo do sistema operacional)
    # Exemplo para Ubuntu:
    sudo apt-get update
    sudo apt-get install -y docker.io
fi

# Verificar se o Docker Compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose não está instalado. Instalando..."
    # Comando para instalar o Docker Compose (dependendo do sistema operacional)
    # Exemplo para Ubuntu:
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

# Verificar se o Node.js e o npm estão instalados
if ! command -v node &> /dev/null || ! command -v npm &> /dev/null; then
    echo "Node.js e/ou npm não estão instalados. Instalando..."
    # Comando para instalar o Node.js e o npm (dependendo do sistema operacional)
    # Exemplo para Ubuntu:
    sudo apt-get install -y nodejs npm
fi

# Clonar o repositório (substitua com o seu comando git clone)
# git clone ...

# Criar diretórios para volumes
mkdir -p mysql_data
mkdir -p projetos

# Iniciar os contêineres
docker-compose up -d
