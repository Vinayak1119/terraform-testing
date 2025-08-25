#!/bin/bash
set -euxo pipefail

# --- Update and Upgrade ---
sudo apt-get update -y
sudo apt-get upgrade -y

# --- Install Prerequisites ---
sudo apt-get install -y gnupg curl ca-certificates apt-transport-https software-properties-common lsb-release

# --- MongoDB Installation (v6.0) ---
MONGO_KEYRING="/usr/share/keyrings/mongodb-archive-keyring.gpg"
if [ ! -f "$MONGO_KEYRING" ]; then
    curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | sudo gpg --dearmor -o "$MONGO_KEYRING"
else
    echo "MongoDB keyring already exists: $MONGO_KEYRING (skipping)"
fi

# Create repo file
echo "deb [ arch=amd64,arm64 signed-by=$MONGO_KEYRING ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/6.0 multiverse" | \
  sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list > /dev/null

sudo apt-get update -y
sudo apt-get install -y mongodb-org

sudo systemctl enable --now mongod

# --- Docker Installation ---
DOCKER_KEYRING="/etc/apt/keyrings/docker.gpg"
if [ ! -f "$DOCKER_KEYRING" ]; then
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o "$DOCKER_KEYRING"
else
    echo "Docker keyring already exists: $DOCKER_KEYRING (skipping)"
fi

# Add Docker repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=$DOCKER_KEYRING] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

sudo systemctl enable --now docker

# Optional: Allow current user to run Docker commands without sudo
sudo usermod -aG docker "$USER"

# --- Show Installed Versions ---
echo "MongoDB version:"
mongod --version || true

echo "Docker version:"
docker --version || true

echo "Docker Compose version (plugin):"
docker compose version || true

# --- Reboot if required (after e.g. kernel upgrade) ---
if [ -f /var/run/reboot-required ]; then
    echo "A reboot is required to activate the latest kernel and updates. Rebooting now..."
    sudo reboot
fi
