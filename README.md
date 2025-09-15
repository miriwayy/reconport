# ReconPort

Un outil de reconnaissance réseau simple et efficace pour la découverte d'hôtes et l'analyse de ports.

## Description

ReconPort automatise la phase de reconnaissance réseau en combinant la découverte d'hôtes actifs et le scan de ports avec détection de services. L'outil génère automatiquement un rapport détaillé de l'analyse.

## Fonctionnalités

- Découverte d'hôtes actifs sur un réseau/sous-réseau
- Scan de ports (20-1024) avec détection de services
- Génération automatique de rapports horodatés
- Interface colorée style BlackArch
- Sortie en temps réel avec sauvegarde

## Prérequis

- Bash
- Nmap
- Permissions appropriées pour les scans réseau

## Installation

```bash
chmod +x reconport.sh
```

## Utilisation

```bash
./reconport.sh <network/subnet>
```

### Exemples

```bash
./reconport.sh 192.168.1.0/24
./reconport.sh 10.0.0.0/16
./reconport.sh 172.16.0.0/12
```

## Sortie

L'outil génère un fichier de rapport au format :
```
reconport_report_YYYYMMDD_HHMMSS.txt
```

Le rapport contient :
- Liste des hôtes actifs découverts
- Ports ouverts et services identifiés pour chaque hôte
- Informations de version des services

## Avertissement

Cet outil est destiné aux tests de pénétration autorisés et à l'audit de sécurité. Utilisez-le uniquement sur des réseaux que vous possédez ou pour lesquels vous avez une autorisation explicite.

## Licence

Usage éducatif et professionnel uniquement.
