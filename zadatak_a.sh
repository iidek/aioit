#!/bin/bash

# Kreiranje ili čišćenje datoteke 1.txt
> 1.txt

# Petlja za sve brojeve od 1 do 100
for ((i=1; i<=100; i+=2)); do
    echo $i >> 1.txt
done

echo "Neparni brojevi do 100 su zapisani u datoteku 1.txt"
