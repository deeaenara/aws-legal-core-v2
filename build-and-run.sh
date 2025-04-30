#!/bin/bash
echo "🔥 Starting AWS Legal Core Setup..."
cp backend/.env.example backend/.env
cd backend && npm install || echo "📦 Backend deps not installed (simulated)"
node scripts/seed.js
cd ../client && npm install || echo "📦 Frontend deps not installed (simulated)"
npm run build || echo "⚙️ Skipped build (simulated)"
cd ..
echo "🐳 Launching Docker..."
docker compose up --build -d
echo "✅ http://localhost:5000 (API)"
echo "✅ http://localhost:3000 (UI)"
