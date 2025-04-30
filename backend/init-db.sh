#!/bin/bash

# ✅ Settings – update if needed
DB_NAME="awslegal"
DB_USER="postgres"
DB_HOST="localhost"
DB_PORT="5432"

echo "🔍 Checking if database '$DB_NAME' exists..."

if psql -U $DB_USER -h $DB_HOST -p $DB_PORT -lqt | cut -d \| -f 1 | grep -qw $DB_NAME; then
  echo "✅ Database '$DB_NAME' already exists."
else
  echo "❗Database not found. Creating '$DB_NAME'..."
  createdb -U $DB_USER -h $DB_HOST -p $DB_PORT $DB_NAME
  if [ $? -eq 0 ]; then
    echo "✅ Database '$DB_NAME' created successfully."
  else
    echo "❌ Failed to create database. Check credentials or permissions."
    exit 1
  fi
fi

echo "🔧 Running Sequelize migrations..."
npx sequelize db:migrate

echo "🌱 Running seed script..."
node scripts/seed.js

echo "🎉 Database setup complete!"
