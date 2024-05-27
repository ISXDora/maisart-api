#!/bin/sh

# Esperar 5 segundos para garantir que o PostgreSQL esteja pronto
sleep 5

# Verificar se o banco de dados existe
if ! psql -h $host -U $username -lqt | cut -d \| -f 1 | grep -qw $database; then
  echo "Creating database $database"
  # Adicionar a senha ao comando de criação do banco de dados
  PGPASSWORD=$password rails db:create
else
  echo "Database $database already exists"
fi

# Executar as migrações
# Adicionar as credenciais ao comando de migração
PGPASSWORD=$password rails db:migrate

# Executar o servidor Rails (ou outro comando necessário)
rails server -b 0.0.0.0
