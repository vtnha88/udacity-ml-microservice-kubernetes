#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=vtnha88/ml-api:v1.0.0

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

docker login -u vtnha88
docker tag ml-api $dockerpath:latest
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath:latest