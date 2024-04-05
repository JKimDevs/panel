#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Update and upgrade your system
echo "Updating system..."
apt-get update && apt-get upgrade -y

# Install essential packages
echo "Installing necessary packages..."
apt-get install -y wget unzip

# Navigate to the /opt directory, which is a standard location for installing third-party software
cd /opt

# Download the ehcp installation script
echo "Downloading ehcp installation script..."
wget http://ehcp.net/ehcp_latest.tgz

# Extract the downloaded file
echo "Extracting ehcp files..."
tar -zxvf ehcp_latest.tgz

# Navigate to the ehcp directory
cd ehcp

# Run the installation script
echo "Starting ehcp installation..."
# The script will prompt for input during installation
./install.sh

# Post-installation instructions
echo "ehcp installation completed."
echo "You can now access the ehcp control panel through your web browser."
echo "Visit http://your-server-ip/ or http://your-domain.com/ to start configuring your hosting service."
