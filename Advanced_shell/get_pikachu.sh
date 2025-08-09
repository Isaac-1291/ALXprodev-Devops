#!/bin/bash

# Script to fetch data for Pikachu from the Pokémon API
# and save it to data.json, logging errors to errors.txt

API_URL="https://pokeapi.co/api/v2/pokemon/pikachu"
OUTPUT_FILE="data.json"
ERROR_FILE="errors.txt"

# Make the API request
curl -s -o "$OUTPUT_FILE" -w "%{http_code}" "$API_URL" > status_code.txt 2>>"$ERROR_FILE"

# Check if the request was successful
STATUS_CODE=$(cat status_code.txt)
rm status_code.txt

if [ "$STATUS_CODE" -ne 200 ]; then
    echo "Error: Failed to fetch data from Pokémon API. HTTP status code: $STATUS_CODE" >>"$ERROR_FILE"
    rm -f "$OUTPUT_FILE"
    exit 1
fi

echo "Pikachu data successfully saved to $OUTPUT_FILE"