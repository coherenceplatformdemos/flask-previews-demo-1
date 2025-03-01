#!/bin/bash

# Read the API_URL from an environment variable
API_URL=${CNC_ENVIRONMENT_DOMAIN:-http://localhost}

# Use sed to replace both template variables in the HTML file
sed -e "s|{{API_URL}}|$API_URL|g" \
    -e "s|{{ENVIRONMENT_NAME}}|$CNC_ENVIRONMENT_NAME|g" \
    index.html.tpl > assets/index.html