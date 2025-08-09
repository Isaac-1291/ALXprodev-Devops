#!/bin/bash

# Fetch Pikachu data from the Pokémon API
# Save to data.json, log errors to errors.txt

API_URL="https://pokeapi.co/api/v2/pokemon/pikachu"
OUTPUT_FILE="data.json"
ERROR_FILE="errors.txt"

# Make API request
HTTP_STATUS=$(curl -s -o "$OUTPUT_FILE" -w "%{http_code}" "$API_URL" 2>>"$ERROR_FILE")

# Check HTTP status code
if [ "$HTTP_STATUS" -ne 200 ]; then
    echo "Error: Failed to fetch data from Pokémon API. Status code: $HTTP_STATUS" >>"$ERROR_FILE"
    rm -f "$OUTPUT_FILE"
    exit 1
fi

echo "Pikachu data successfully saved to $OUTPUT_FILE"