#!/bin/bash

# Exports all tables that matches with prefix parameter.
# Usage:
# dump-tables [database] [user] [password] [prefix]
# dump-tables db_foo root root.pass tb_%
#
# @author carlosjrcabello

MYSQL_DB=$1
MYSQL_USER=$2
MYSQL_PASS=$3
PREFIX=$4

echo "db $MYSQL_DB";
echo "user $MYSQL_USER";
echo "pass $MYSQL_PASS";
echo "prefix $PREFIX";

SQL_PREFIX="'SHOW TABLES LIKE \"$PREFIX\" '";

CMD="mysql $MYSQL_DB -u$MYSQL_USER -p$MYSQL_PASS -N -e $SQL_PREFIX | xargs mysqldump -d $MYSQL_DB -u$MYSQL_USER -p$MYSQL_PASS > dump-tables.sql"

echo "dumping...";
eval $CMD
echo "dump done!";