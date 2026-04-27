# 🛡️ Mini SOC – Construction d’un Security Operations Center

## Contexte

Les cyberattaques sont en constante augmentation. Les entreprises doivent surveiller leurs systèmes d'information afin de détecter les comportements suspects et réagir rapidement.

Ce projet consiste à mettre en place un mini SOC (Security Operations Center) permettant de surveiller, détecter et analyser des attaques réseau.

---

## Objectifs

- Détecter les attaques réseau en temps réel
- Collecter et centraliser les logs
- Analyser les activités suspectes
- Proposer des mesures de sécurité

---

## Architecture

Le projet repose sur 3 machines virtuelles :

- **Kali Linux** → Machine attaquante
- **Ubuntu Server** → Machine cible
- **Serveur SOC** → Suricata + ELK Stack

Communication via un réseau interne (VirtualBox)

---

## Technologies utilisées

- Suricata (IDS)
- ELK Stack (Elasticsearch, Logstash, Kibana)
- Nmap
- Hydra
- VirtualBox
- Linux (Ubuntu / Kali)

---

## Attaques simulées

### Scan réseau

- Scan SYN : `nmap -sS`
- Scan complet : `nmap -A`

### Bruteforce SSH

- Attaque par dictionnaire avec Hydra

---

## Fonctionnement du SOC

1. Suricata analyse le trafic réseau en temps réel
2. Les logs sont envoyés vers Elasticsearch
3. Kibana permet de visualiser les attaques

### Commandes utilisées

```bash
sudo systemctl start suricata
nmap -sS 192.168.10.2
curl localhost:9200
```
