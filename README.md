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

---

## Visualisation & Résultats (Kibana)

Voici les preuves de détection obtenues lors de nos tests d'intrusion :

### Vue d'ensemble du Dashboard

![Dashboard Global](/screenshots/dashboard.png)
_Aperçu général de la santé du réseau et volume des alertes détectées par Suricata._

### Analyse des Alertes par Signature

![Détail des Alertes](/screenshots/alerts.png)
_Identification précise des types d'attaques (Nmap Scan, SSH Brute Force)._

### Analyse Granulaire des Logs

![Analyse des Logs](/screenshots/logs.png)
_Traçabilité complète : IPs sources des attaquants et ports cibles identifiés._

---

## Mesures de remédiation préconisées

Suite aux détections, nous recommandons :

1. **Hardening SSH** : Désactiver l'authentification par mot de passe au profit de clés SSH.
2. **Filtrage IP** : Mise en place d'un firewall (UFW/Iptables) pour restreindre les flux.
3. **Automatisation** : Installation de `Fail2ban` pour bannir les IPs après 3 échecs de connexion.
