#!/bin/bash

echo "Démarrage du SOC..."

sudo systemctl start suricata
sudo systemctl start elasticsearch
sudo systemctl start kibana
sudo systemctl start logstash

echo "SOC opérationnel !"