#!/bin/bash

# URL stranice
URL="https://support.microsoft.com/hr-hr/topic/opis-teksta-lorem-ipsum-dolor-sit-amet-koji-se-prikazuje-u-sustavu-pomo%C4%87i-programa-word-bf3b0a9e-8f6b-c2ab-edd9-41c1f9aa2ea0"

# Dohvaćanje sadržaja stranice
content=$(curl -s "$URL")

# Prebrojavanje pojavljivanja riječi "lorem" (bez obzira na velika/mala slova)
count=$(echo "$content" | grep -oi "lorem" | wc -l)

# Ispis rezultata
echo "Riječ 'lorem' pojavljuje se $count puta na stranici."
