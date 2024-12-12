#!/bin/bash

# Provjera postoji li datoteka 1.txt
if [[ ! -f "1.txt" ]]; then
    echo "Datoteka 1.txt ne postoji. Pokrenite skriptu iz prvog zadatka."
    exit 1
fi

# Inicijalizacija varijable za zbroj
suma=0

# Petlja za čitanje brojeva iz datoteke
while read -r broj; do
    # Provjera je li broj djeljiv s 3
    if (( broj % 3 == 0 )); then
        suma=$((suma + broj))
    fi
done < 1.txt

# Ispis rezultata
echo "Zbroj brojeva iz datoteke 1.txt koji su djeljivi s 3 je: $suma"
