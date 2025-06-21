#!/bin/bash
# scripts/deploy-npm.sh

echo -e "\n----- 3. Deploying Nginx Proxy Manager... -----"

# ตำแหน่งที่จะติดตั้ง NPM
NPM_DIR="$HOME/docker-apps/nginx-proxy-manager"
REPO_NPM_COMPOSE_FILE="$(dirname "$0")/../nginx-proxy-manager/docker-compose.yml"

# ตรวจสอบว่าติดตั้งไปแล้วหรือยัง
if [ -d "$NPM_DIR" ]; then
  echo "✅ Nginx Proxy Manager directory already exists. Skipping deployment."
else
  echo "🚀 Deploying Nginx Proxy Manager to $NPM_DIR..."
  mkdir -p "$NPM_DIR"
  cp "$REPO_NPM_COMPOSE_FILE" "$NPM_DIR/"

  # เข้าไปรัน docker compose
  cd "$NPM_DIR"
  docker compose up -d

  echo "✅ Nginx Proxy Manager has been deployed and started."
fi
