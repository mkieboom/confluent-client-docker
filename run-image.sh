#!/bin/bash

# Specify the container version tag. Versions available:
CONTAINER_VERSION=latest

# Launch the container
docker run -it \
  mkieboom/confluent-client-docker \
  bash
