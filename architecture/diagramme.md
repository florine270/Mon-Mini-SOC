# 🏗️ Architecture du Mini SOC

L'infrastructure est isolée dans un réseau virtuel (Host-Only) pour simuler un environnement réel en toute sécurité.

## 1. Schéma du Réseau

- **Attaquant (Kali Linux)** : `192.168.10.1`
- **Cible (Ubuntu Server)** : `192.168.10.2`
- **SOC (Suricata + ELK)** : `192.168.10.3`

## 2. Flux de Données (Dataflow)

Le pipeline de détection suit les étapes suivantes :

1. **Capture** : Suricata écoute le trafic sur l'interface réseau et génère des alertes dans `eve.json`.
2. **Collecte** : Logstash lit le fichier `eve.json` en temps réel.
3. **Indexation** : Logstash envoie les données formatées vers Elasticsearch.
4. **Visualisation** : Kibana interroge Elasticsearch pour afficher les dashboards.

## 3. Matrice de Flux

| Source        | Destination   | Port | Protocole | Description                        |
| :------------ | :------------ | :--- | :-------- | :--------------------------------- |
| Kali Linux    | Ubuntu Server | 22   | TCP       | Tentatives de Brute Force          |
| Kali Linux    | Ubuntu Server | 80   | TCP       | Scan de vulnérabilités Web         |
| Ubuntu Server | SOC Server    | 5044 | TCP       | Envoi des logs (Filebeat/Logstash) |
