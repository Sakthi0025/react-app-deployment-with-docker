#!/bin/bash

# login into DockerHub
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# stop & remove existing container if running
docker stop react || true
docker rm react || true

# build the image with a valid name
docker build -t react-ci-cd .

# run the container
docker run -d -t --name react -p 80:80 react-ci-cd

# tag & push to Docker Hub
docker tag react-ci-cd sakthi0025/react-app:ci-cd
docker push sakthi0025/react-app:ci-cd
