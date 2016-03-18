#!/bin/bash -x
set -e

#env >&2

if [[ "$1" == apache2* ]]; then

	if [ -z "$MYSQL_HOST" ]; then
		MYSQL_HOST='mysql'
	fi

	if [ -z "$MYSQL_USER" ]; then
		MYSQL_USER='moodle'
	fi

	if [ -z "$MYSQL_PASSWORD" ]; then
		MYSQL_PASSWORD='Pearson'
	fi

	if [ -z "$MYSQL_DATABASE" ]; then
		MYSQL_DATABASE='moodle'
	fi

	set_config() {
		src="$1"
		dst="$2"
		echo >&2 "setting $src to $dst"
		sed -i "s/$src/$dst/" /var/www/html/moodle/config.php
	}

	#env >&2

	set_config 'DBHOST' $MYSQL_HOST
	set_config 'DBNAME' $MYSQL_DATABASE
	set_config 'DBUSER' $MYSQL_USER
	set_config 'DBPASS' $MYSQL_PASSWORD

#	TERM=dumb php -- "$MOODLE_DB_HOST" "$MOODLE_DB_USER" "$MOODLE_DB_PASS" "$MOODLE_DB_NAME" <<'EOPHP'
#<?php
#// database might not exist, so let's try creating it (just to be safe)
#
#$stderr = fopen('php://stderr', 'w');
#
#list($host, $port) = explode(':', $argv[1], 2);
#
#$maxTries = 10;
#do {
#	$mysql = new mysqli($host, $argv[2], $argv[3], '', (int)$port);
#	if ($mysql->connect_error) {
#		fwrite($stderr, "\n" . 'MySQL Connection Error: (' . $mysql->connect_errno . ') ' . $mysql->connect_error . "\n");
#		--$maxTries;
#		if ($maxTries <= 0) {
#			exit(1);
#		}
#		sleep(3);
#	}
#} while ($mysql->connect_error);
#
#if (!$mysql->query('CREATE DATABASE IF NOT EXISTS `' . $mysql->real_escape_string($argv[4]) . '`')) {
#	fwrite($stderr, "\n" . 'MySQL "CREATE DATABASE" Error: ' . $mysql->error . "\n");
#	$mysql->close();
#	exit(1);
#}
#
#$mysql->close();
#EOPHP
fi

exec "$@"
