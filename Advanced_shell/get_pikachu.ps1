# PowerShell script to fetch data for Pikachu from the Pokémon API
# and save it to data.json, logging errors to errors.txt

$ApiUrl = "https://pokeapi.co/api/v2/pokemon/pikachu"
$OutputFile = "data.json"
$ErrorFile = "errors.txt"

try {
    # Send GET request
    $Response = Invoke-WebRequest -Uri $ApiUrl -ErrorAction Stop

    # Save content to file
    $Response.Content | Out-File -FilePath $OutputFile -Encoding utf8

    Write-Host "Pikachu data successfully saved to $OutputFile"
}
catch {
    # Log errors
    $_.Exception.Message | Out-File -FilePath $ErrorFile -Append
    Write-Host "Error occurred. Check $ErrorFile for details."
}