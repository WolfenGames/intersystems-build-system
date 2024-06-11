docker-compose up -d

do {
    $output = docker exec iris iris session IRIS -U %SYS "\"Hello World\""
    if ($null -eq $output) {
        Write-Host "Waiting for InterSystems container to be ready..."
        Start-Sleep -Seconds 5
    }
} until ($null -ne $output)

Write-Host "InterSystems container is ready!"
Start-Sleep -Seconds 10

# Copy the source code to the container
docker cp src/. iris:/tmp/src

# Delete exisitng code from container
Write-Host "Deleting existing code from container..."
docker exec iris iris session IRIS -U USER '##Class(%SYSTEM.OBJ).Delete("Example.*")'
Write-Host ""
Write-Host "Existing code deleted!"

# Import the source code to the container
docker exec iris iris session IRIS -U USER '##Class(%SYSTEM.OBJ).ImportDir("/tmp/src/","*.cls;*.inc","bckpry",,1)'

# Build the src to a xml
docker exec iris iris session IRIS -U USER '##Class(Example.Builder).Build("/tmp/Build/")'

# Copy the xml to the host
docker cp iris:/tmp/Build/. Builds/

docker-compose down
