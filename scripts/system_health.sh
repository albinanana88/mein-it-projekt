#!/bin/bash

echo "=== SYSTEM HEALTH CHECK ==="
echo "Datum: $(date '+%Y-%m-%d %H:%M:%S')"
echo "Hostname: $(hostname)"
echo "---------------------------"

# 1. Festplatte
DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')
if [ "$DISK" -gt 80 ]; then
    echo "Speicher (/): ${DISK}% [ WARNUNG: Fast voll ]"
else
    echo "Speicher (/): ${DISK}% [ OK ]"
fi

# 2. RAM
RAM_TOTAL=$(free -m | awk '/Speicher:/ {print $2}')
RAM_USED=$(free -m | awk '/Speicher:/ {print $3}')
RAM_PERCENT=$(( 100 * RAM_USED / RAM_TOTAL ))
echo "RAM: ${RAM_PERCENT}% (${RAM_USED}MB von ${RAM_TOTAL}MB)"

# 3. Netzwerk
if ping -c 1 -W 2 1.1.1.1 > /dev/null 2>&1; then
    echo "Netzwerk: [ ONLINE ]"
else
    echo "Netzwerk: [ OFFLINE ]"
fi
echo "==========================="
