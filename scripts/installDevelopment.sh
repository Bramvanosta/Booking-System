#!/usr/bin/env bash

# Install Front-end dependencies
echo "### Installing Front-end depenencies ###"
docker run --rm -v "$(pwd)"/client:/app -w /app node yarn
