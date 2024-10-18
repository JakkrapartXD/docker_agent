#!/bin/bash

SERVER="localhost"
USER="username"
PASSWORD="password"
DATABASE="database_name"
SQL_SCRIPT="/path/to/SQL_SCRIPT"

/opt/mssql-tools/bin/sqlcmd -S $SERVER -U $USER -P $PASSWORD -Q "CREATE DATABASE $DATABASE;"

if [ $? -eq 0 ]; then
    echo "Database $DATABASE created successfully."
else
    echo "Failed to create database $DATABASE."
    exit 1
fi

/opt/mssql-tools/bin/sqlcmd -S $SERVER -U $USER -P $PASSWORD -d $DATABASE -i $SQL_SCRIPT

if [ $? -eq 0 ]; then
    echo "Table imported successfully from $SQL_SCRIPT."
else
    echo "Failed to import table from $SQL_SCRIPT."
    exit 1
fi
