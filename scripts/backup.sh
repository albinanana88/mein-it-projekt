#!/bin/bash

# --- KONFIGURATION ---
QUELLE="$HOME/mein-it-projekt"
ZIEL="$HOME/backup_ziel"
DATUM=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_NAME="backup_${DATUM}.tar.gz"

echo "=== START BACKUP ==="
echo "Datum: $(date '+%Y-%m-%d %H:%M:%S')"

# Sicherstellen, dass der Zielordner existiert
mkdir -p "$ZIEL"

# Archiv erstellen
tar -czf "${ZIEL}/${BACKUP_NAME}" -C "$HOME" mein-it-projekt

if [ $? -eq 0 ]; then
    echo "[ OK ] Backup erfolgreich erstellt: ${ZIEL}/${BACKUP_NAME}"
else
    echo "[ FEHLER ] Backup konnte nicht erstellt werden!"
    exit 1
fi

# Rotation: Archive löschen, die älter als 7 Tage sind
find "$ZIEL" -name "backup_*.tar.gz" -mtime +7 -delete
echo "[ OK ] Alte Backups bereinigt (Aufbewahrung: 7 Tage)."
echo "=== BACKUP BEENDET ==="
