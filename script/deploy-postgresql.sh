#!/bin/bash
# scripts/deploy-postgresql.sh

POSTGRES_DIR="$HOME/docker-apps/postgresql"
REPO_POSTGRES_COMPOSE_FILE="$(dirname "$0")/../postgresql/docker-compose.yml"
REPO_POSTGRES_ENV_FILE="$(dirname "$0")/../postgresql/.env"

if [ -d "$POSTGRES_DIR" ]; then
  echo "✅ PostgreSQL directory already exists. Skipping deployment."
else
  echo "🚀 Deploying PostgreSQL to $POSTGRES_DIR..."
  mkdir -p "$POSTGRES_DIR"
  cp "$REPO_POSTGRES_COMPOSE_FILE" "$POSTGRES_DIR/docker-compose.yml"
  cp "$REPO_POSTGRES_ENV_FILE" "$POSTGRES_DIR/.env"

  cd "$POSTGRES_DIR"
  docker compose up -d

  echo "✅ PostgreSQL has been deployed and started."
fi