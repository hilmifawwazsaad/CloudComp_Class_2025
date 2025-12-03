#!/bin/bash

echo "========================================="
echo "Starting Case 4 - Jokes to Database"
echo "========================================="
echo ""

# 1. Start MySQL
echo "[1/3] Starting MySQL database..."
cd database
./run_mysql.sh
echo "Waiting for MySQL to initialize (15 seconds)..."
sleep 15
echo "✓ MySQL started"
echo ""

# 2. Start phpMyAdmin
echo "[2/3] Starting phpMyAdmin..."
./run_myadmin.sh
cd ..
echo "Waiting for phpMyAdmin to start (3 seconds)..."
sleep 3
echo "✓ phpMyAdmin started"
echo ""

# 3. Start the download script
echo "[3/3] Starting jokes download script..."
cd script
./run_process.sh
cd ..
echo "Waiting for script to initialize (5 seconds)..."
sleep 5
echo "✓ Download script started"
echo ""

# 4. Show status
echo "Checking containers status..."
echo ""
docker ps --filter "name=mysql1" --filter "name=myprocess1" --filter "name=phpmyadmin1" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo ""
echo "========================================="
echo "✓ All services started successfully!"
echo "========================================="