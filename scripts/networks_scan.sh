#!/bin/bash

SUBNET="192.168.178"
START=1
END=30

echo "=== STARTE SCHNELLEN NETZWERK-SCAN ==="
echo "Bereich: ${SUBNET}.${START} bis ${SUBNET}.${END}"
echo "----------------------------------------"

for ip in $(seq $START $END); do
    (
        if ping -c 1 -W 1 "${SUBNET}.${ip}" > /dev/null 2>&1; then
            echo "[ ONLINE ] ${SUBNET}.${ip}"
        fi
    ) &
done

wait
echo "----------------------------------------"
echo "=== SCAN BEENDET ==="
