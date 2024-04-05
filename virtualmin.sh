#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Update and Upgrade System
echo "Updating and upgrading your System."
apt-get update && apt-get upgrade -y

# Download Virtualmin Install Script
echo "Downloading Virtualmin install script."
wget http://software.virtualmin.com/gpl/scripts/install.sh -O /root/virtualmin-install.sh

# Make the script executable
chmod +x /root/virtualmin-install.sh

# Install Virtualmin
echo "Starting the Virtualmin installation process."
echo "You will need to manually input some information during this process."
/root/virtualmin-install.sh

# Post-installation instructions
echo "Virtualmin has been installed."
echo "Access the Virtualmin control panel by navigating to https://your_vps_ip:10000 in your web browser."
echo "Login with your root username and password, or another user with root privileges."
echo "Your browser may warn you about the site's security certificate since Virtualmin uses a self-signed SSL certificate by default. You can safely proceed by adding an exception for this certificate."
echo "If you cannot connect, ensure your VPS firewall allows incoming connections on port 10000."
echo "For further assistance, refer to the Virtualmin documentation or community forums."
