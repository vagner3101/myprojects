#!/bin/bash
# Script para instalar o Laravel com Filament e criar o primeiro usuário

read -p "Digite o nome do projeto Laravel: " project_name
read -p "Digite a porta: " project_port
read -p "Digite o nome do banco de dados: " db_name
read -p "Digite o nome do usuário do Filament: " filament_user
read -p "Digite o email do usuário do Filament: " filament_email
read -p "Digite a senha do usuário do Filament: " filament_password

# Criar diretório para o projeto
mkdir -p projetos/$project_name

# Criar arquivo de configuração do Nginx
# (mesmo código do script anterior)

# Baixar e instalar o Laravel
# (mesmo código do script anterior)

# Editar o arquivo .env
docker exec -it php sed -i "s/DB_DATABASE=.*/DB_DATABASE=$db_name/" .env

# Instalar o Filament
# (mesmo código do script anterior)

# Executar as migrações
# (mesmo código do script anterior)

# Criar o primeiro usuário do Filament
docker exec -it php php artisan make:filament-user --name="$filament_user" --email="$filament_email" --password="$filament_password"
