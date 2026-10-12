# 🐧 Mein IT-Projekt: Linux Systemadministration & Homelab

Willkommen in meinem praktischen Dokumentationsprojekt für die Ausbildung zur **Fachinformatikerin für Systemintegration**.  
Hier dokumentiere ich meine praktischen Schritte, Systemkonfigurationen und Automatisierungsskripte unter Linux.

---

## 📌 Übersicht & Ziele

* **Praktische Systemadministration:** Vertiefung von Linux-Befehlen, Dateirechten und Prozessmanagement.
* **Versionsverwaltung:** Sicherer Umgang mit Git und GitHub über SSH direkt aus dem Terminal.
* **Netzwerkgrundlagen:** Analyse von Netzwerkverbindungen, Ports und Routing im lokalen Netzwerk.
* **Automatisierung:** Erste Shell-Skripte (Bash) zur Erleichterung von Routineaufgaben.

---

## 🛠️ Verwendete Werkzeuge & Umgebung

| Kategorie | Werkzeuge / Technologien |
| :--- | :--- |
| **Betriebssystem** | Ubuntu Desktop / Linux Terminal |
| **Versionskontrolle** | Git, GitHub (SSH-Authentifizierung) |
| **Netzwerk-Tools** | `ip`, `ping`, `ss`, `curl`, `traceroute` |
| **Editor / IDE** | Nano, Bash-Shell |

---

## 🚀 Wichtige Meilensteine

1. **Terminal-Grundlagen:** Navigation im Dateisystem, Berechtigungsverwaltung (`chmod`, `chown`).
2. **Paketverwaltung:** Saubere Installation und Aktualisierung von Paketen über `apt`.
3. **Sicherheit:** SSH-Schlüsselpaar generiert (`ed25519`) und sichere Verbindung zu GitHub eingerichtet.
4. **Skripting:** Geplante Bash-Skripte für automatisierte Backups und Statusprüfungen.

---

## 1. Homelab: Samba-Dateiserver (VirtualBox)
* **Ziel:** Plattformübergreifender Dateiaustausch im lokalen Heimnetzwerk.
* **Virtualisierung:** Ubuntu-Server in Oracle VM VirtualBox (Netzwerkbrücke / Bridged Adapter).
* **Konfiguration & Freigabe:** 
  * Samba (`smbd`) installiert und über `/etc/samba/smb.conf` konfiguriert.
  * POSIX-Rechte gesetzt (`chown`, `chmod 0775`) für `/srv/samba/share`.
  * Dienststeuerung und Autostart via `systemctl`.
* **Ergebnis:** Erfolgreicher Zugriff über das SMB-Protokoll von Windows- und Linux-Clients.

---

## 2. Automatisierte Systemüberwachung (Bash Health-Check)
Ein Bash-Skript zur schnellen Diagnose wichtiger Systemressourcen:
* **Festplattenbelegung (`df`):** Schwellenwert-Prüfung (>80% löst Warnung aus).
* **RAM-Auslastung (`free`):** Dynamische Prozentberechnung von genutztem Speicher.
* **Netzwerkkonnektivität (`ping`):** Verbindungstest mit Fallback-Prüfung (`ONLINE` / `OFFLINE`).
* **Ausführung:** `chmod +x scripts/system_health.sh && ./scripts/system_health.sh`

## 📬 Kontakt

* **GitHub:** [albinanana88](https://github.com/albinanana88)
