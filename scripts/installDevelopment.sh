#!/usr/bin/env bash

# Setup Rails database
echo "### Setting up Rails database ###"
docker exec -it bs_api rails db:create
docker exec -it bs_api rails db:migrate

# Populate Rails database
echo "### Populating this Rails database ###"
docker exec -it bs_api rails db:populate
