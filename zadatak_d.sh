#!/bin/bash

# Provjera jeste li root ili koristite sudo
if [[ $EUID -ne 0 ]]; then
    echo "Molimo pokrenite ovu skriptu s root privilegijama (sudo)."
    exit 1
fi

# Instalacija httpd-a (ako nije instaliran) ili njegova nadogradnja
echo "Provjeravam instalaciju httpd..."
if ! command -v httpd &> /dev/null; then
    echo "httpd nije instaliran. Instaliram ga..."
    dnf install -y httpd
else
    echo "httpd je već instaliran. Nadograđujem ga na zadnju verziju..."
    dnf upgrade -y httpd
fi

# Promjena porta na kojem httpd sluša
HTTPD_CONF="/etc/httpd/conf/httpd.conf"
if grep -q "^Listen 80" "$HTTPD_CONF"; then
    echo "Mijenjam port iz 80 u 81..."
    sed -i 's/^Listen 80/Listen 81/' "$HTTPD_CONF"
    PORT_CHANGED=true
else
    echo "Port je već promijenjen ili nije na 80. Provjera nepotrebna."
    PORT_CHANGED=false
fi

# Restartanje httpd servisa ako je port promijenjen
if [ "$PORT_CHANGED" = true ]; then
    echo "Restartiram httpd servis zbog promjene porta..."
    systemctl restart httpd
fi

# Omogućavanje automatskog pokretanja httpd servisa prilikom pokretanja sustava
systemctl enable httpd
echo "Skripta je završila. httpd je instaliran, nadograđen, a port konfiguriran."
