#!/bin/bash

set -euo pipefail

if ! command -v nginx &> /dev/null; then
    
    sudo apt-get update
    sudo apt-get install nginx -y
else
    echo "nginx is already installed"
    nginx  -v
fi

if systemctl is-active --quiet nginx; then
    echo "nginx is running"
else
    sudo systemctl start nginx
    sudo systemctl enable nginx
    echo "nginx is running"
fi