#!/bin/bash
# Script para instalar o Laravel

read -p "Digite o nome do projeto Laravel: " project_name
read -p "Digite a porta: " project_port

# Criar diretório para o projeto
mkdir -p projetos/$project_name

# Criar arquivo de configuração do Nginx
echo "server {
    listen $project_port;
    server_name $project_name.com;

    root /var/www/html/$project_name/public;
    index index.php index.html;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php$ {
        fastcgi_pass php:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}" > docker/nigix/sites/$project_name.conf

# Baixar e instalar o Laravel
docker exec -it php composer create-project --prefer-dist laravel/laravel $project_name
