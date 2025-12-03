#!/bin/sh

apk update && apk add curl jq mysql-client

URL=https://api.chucknorris.io/jokes/random
DB_HOST=mysql1
DB_USER=root
DB_PASS=mydb6789tyui
DB_NAME=mydb

echo will run every $DELAY seconds
echo waiting for MySQL to be ready...
sleep 10

while true;
do
	date=$(date '+%Y-%m-%d_%H:%M:%S')
	echo processing at $date
	
	# Get joke from API
	joke=$(curl -sL $URL | jq -r '.value')
	
	# Escape single quotes for SQL
	joke_escaped=$(echo "$joke" | sed "s/'/''/g")
	
	# Insert to MySQL database
	mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASS" "$DB_NAME" \
		-e "INSERT INTO jokes (joke_text) VALUES ('$joke_escaped');"
	
	echo "Joke saved to database: $joke"
	sleep $DELAY
done