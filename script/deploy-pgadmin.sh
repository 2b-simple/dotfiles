#!/bin/bash
# scripts/deploy-pgadmin.sh

PGADMIN_DIR="$HOME/docker-apps/pgadmin"
REPO_PGADMIN_COMPOSE_FILE="$(dirname "$0")/../pg-admin/docker-compose.yml"

if [ -d "$PGADMIN_DIR" ]; then
  echo "✅ pgAdmin directory already exists. Skipping deployment."
else
  echo "🚀 Deploying pgAdmin to $PGADMIN_DIR..."
  mkdir -p "$PGADMIN_DIR"
  cp "$REPO_PGADMIN_COMPOSE_FILE" "$PGADMIN_DIR/"

  cd "$PGADMIN_DIR"
  docker compose up -d

  echo "✅ pgAdmin has been deployed and started."
fi