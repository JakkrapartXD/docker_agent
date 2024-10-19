#!/bin/bash

sleep 90s

SERVER="localhost"
USER="sa"
PASSWORD="P@ssw0rd"
DATABASE="team4_web_labDB"
SQL_SCRIPT="/home/mssql_scripts/dbo.OnlineAgents.Table.sql"

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
