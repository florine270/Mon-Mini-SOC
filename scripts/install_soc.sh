#!/bin/bash

echo "Installation du Mini SOC"

# Mise à jour
sudo apt update && sudo apt upgrade -y

# Installation Suricata
echo "Installation de Suricata..."
sudo apt install suricata -y

# Installation Elasticsearch
echo "Installation Elasticsearch..."
sudo apt install elasticsearch -y
sudo systemctl enable elasticsearch
sudo systemctl start elasticsearch

# Installation Kibana
echo "Installation Kibana..."
sudo apt install kibana -y
sudo systemctl enable kibana
sudo systemctl start kibana

# Installation Logstash
echo "Installation Logstash..."
sudo apt install logstash -y
sudo systemctl enable logstash
sudo systemctl start logstash

echo "Installation terminée !"