#!/bin/bash
# Script para criar sites

read -p "Digite o nome do site: " site_name
read -p "Digite a porta: " site_port

# Criar diretório para o site
mkdir -p projetos/$site_name

# Criar arquivo de configuração do Nginx
echo "server {
    listen $site_port;
    server_name $site_name.com;

    root /var/www/html/$site_name;
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
}" > docker/nigix/sites/$site_name.conf
