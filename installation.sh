#!/bin/bash

# -------------------------------------------------------------
# installation.sh - Script to install and configure LAMP, SSH,
# Snort, and IPTables on Ubuntu.
# -------------------------------------------------------------

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting installation of LAMP stack, SSH, and security tools..."

# Update and upgrade system packages
echo "Updating system packages..."
apt update && apt upgrade -y

# ----------------------------
# Install Apache
# ----------------------------
echo "Installing Apache..."
apt install apache2 -y
systemctl enable apache2
systemctl start apache2

# ----------------------------
# Install MySQL
# ----------------------------
echo "Installing MySQL..."
apt install mysql-server -y
systemctl enable mysql
systemctl start mysql

# Secure MySQL Installation (manual interaction may be needed)
# Recommend running: sudo mysql_secure_installation
echo "Please run 'sudo mysql_secure_installation' manually to secure MySQL."

# ----------------------------
# Install PHP
# ----------------------------
echo "Installing PHP and required modules..."
apt install php libapache2-mod-php php-mysql -y
systemctl restart apache2

# ----------------------------
# Install OpenSSH Server
# ----------------------------
echo "Installing OpenSSH server..."
apt install openssh-server -y
systemctl enable ssh
systemctl start ssh

# ----------------------------
# Install IPTables
# ----------------------------
echo "Installing IPTables..."
apt install iptables -y

# ----------------------------
# Install Snort
# ----------------------------
echo "Installing Snort (Intrusion Detection System)..."
DEBIAN_FRONTEND=noninteractive apt install snort -y

# ----------------------------
# Enable UFW (optional)
# ----------------------------
# Uncomment the following lines to use UFW instead of IPTables directly
# echo "Enabling UFW..."
# apt install ufw -y
# ufw allow OpenSSH
# ufw enable

echo "Installation complete. Please proceed with implementation.sh for policy setup."
