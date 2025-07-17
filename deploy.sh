#!/bin/bash

IMAGE_NAME="flisk-docker-app"

echo "[+] Build docker image..."
docker build -t $IMAGE_NAME .

echo "[+] Stopping old container (if any)..."
docker stop flask-container 2>/dev/null && docker rm flask-container 2>/dev/null

echo "[+] Running new containeer..."
docker run -d -p 5000:5000 --name flask-container $IMAGE_NAME

echo "[+] App is running on http://localhost:5000"

