#!/bin/bash

# -------------------------------------------------------------
# implementation.sh - Apply firewall (IPTables) and Snort IDS rules
# -------------------------------------------------------------

# Exit immediately if a command exits with a non-zero status
set -e

echo "Starting firewall and intrusion detection configuration..."

# ----------------------------
# IPTables Firewall Rules
# ----------------------------

echo "Applying IPTables firewall rules..."

# Flush existing rules
iptables -F

# Default policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Allow loopback traffic
iptables -A INPUT -i lo -j ACCEPT

# Allow established and related connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Allow SSH (port 22)
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

# Allow HTTP (port 80)
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
