#!/bin/bash

# Script to install CloudPanel on Ubuntu 20.04 VPS

# Ensure the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Update and upgrade the system
echo "Updating and upgrading your system..."
apt-get update && apt-get upgrade -y

# Install and configure firewall if not already installed
echo "Setting up UFW firewall..."
apt-get install ufw -y
ufw enable
ufw allow 22    # Allow SSH
ufw allow 80    # Allow HTTP
ufw allow 443   # Allow HTTPS
ufw allow 8443/tcp # Open port 8443 for CloudPanel access

# Download CloudPanel installation script
echo "Downloading CloudPanel installation script..."
cd /root
curl -sSL https://installer.cloudpanel.io/ce/v1/install.sh -o install.sh

# Make the script executable
chmod +x install.sh

# Install CloudPanel
# The installation process will prompt for manual inputs such as domain, email, etc.
echo "Starting the installation of CloudPanel..."
./install.sh

echo "CloudPanel installation completed."

# Instructions after installation
echo "CloudPanel has been installed successfully."
echo "Please navigate to your server's IP address or domain in your web browser to finish the setup, using port 8443 (https://your_server_ip:8443 or https://your_domain.com:8443)."
echo "Follow the on-screen instructions to complete the CloudPanel setup."
