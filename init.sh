#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "--- Starting Docker Installation Script ---"

# 1. Remove old/conflicting Docker packages
echo "STEP 1: Removing old Docker packages (if any)..."
packages_to_remove=(
    docker.io
    docker-doc
    docker-compose
    docker-compose-v2
    podman-docker
    containerd
    runc
)
for pkg in "${packages_to_remove[@]}"; do
    if dpkg -s "$pkg" &> /dev/null; then
        echo "Removing $pkg..."
        sudo apt-get remove -y "$pkg"
    else
        echo "$pkg not installed, skipping."
    fi
done
echo "Old package removal complete."
echo ""

# 2. Set up Docker's Apt repository
echo "STEP 2: Setting up Docker's official repository..."

# Update package index and install prerequisites
echo "Updating apt package index and installing prerequisites..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl

# Add Docker's official GPG key
echo "Adding Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
# Download key to a temporary file first, then move with sudo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /tmp/docker.asc
sudo mv /tmp/docker.asc /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo "Adding Docker repository to Apt sources..."
ARCH=$(dpkg --print-architecture)
CODENAME=$(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
echo \
  "deb [arch=$ARCH signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $CODENAME stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package index again with the new repository
echo "Updating apt package index again..."
sudo apt-get update
echo "Repository setup complete."
echo ""

# 3. Install Docker Engine
echo "STEP 3: Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "Docker Engine installation complete."
echo ""

# 4. Add current user to the docker group
echo "STEP 4: Adding current user (moayad) to the 'docker' group..."
sudo usermod -aG docker "moayad"
echo "User moayad added to the docker group."
echo ""
su - moayad
newgrp docker

echo "--- Docker Installation Script Finished ---"
echo ""
echo "IMPORTANT:"
echo "To run Docker commands without sudo, you need to apply the group changes."
echo "Please do one of the following:"
echo "1. Log out of your current session and log back in."
echo "2. Run the command 'newgrp docker' in your terminal."
echo "   (This starts a new sub-shell with the correct group membership)."

