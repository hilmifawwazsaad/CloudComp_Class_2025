#!/bin/bash

echo "========================================="
echo "Stopping Case 4 Services"
echo "========================================="
echo ""

echo "Stopping containers..."
docker rm -f myprocess1 mysql1 phpmyadmin1 2>/dev/null

echo ""
echo "✓ All containers stopped and removed"
echo ""
docker ps -a --filter "name=mysql1" --filter "name=myprocess1" --filter "name=phpmyadmin1"
echo ""
