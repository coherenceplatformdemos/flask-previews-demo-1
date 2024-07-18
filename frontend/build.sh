#!/bin/bash

# Read the API_URL from an environment variable
API_URL=${CNC_ENVIRONMENT_DOMAIN:-http://localhost}

# Use sed to replace the template variable in the HTML file
mkdir assets
sed "s|\${API_URL}|$API_URL|g" index.html.tpl > assets/index.html