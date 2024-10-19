## Setup Instructions

### 1. Clone the repository

First, clone the repository to your local machine.

```bash
git clone <your-repository-url>
cd your-project
```

### 2. Start Services

Run the following command to start the services:

```bash
docker-compose up -d
```

This will start two containers:

- `mssql_agent` for the MSSQL service
- `mongodb_wallboard` for the MongoDB service

### 3. Execute Initialization Scripts

After starting the containers, you need to manually run the initialization scripts inside the respective containers.

#### MongoDB Script

Run the following command to execute the MongoDB initialization script:

```bash
docker exec -it mongodb_wallboard bash /home/mongo_scripts/run_mongo_setup.sh
```

This script will:

- Create the `wallboarddb` database
- Create a capped collection called `log`
- Create a MongoDB user `wallboarduser` with read/write permissions on `wallboarddb`

#### MSSQL Script

Run the following command to execute the MSSQL initialization script:

```bash
docker exec -it mssql_agent bash /home/mssql_scripts/import_table.sh
```

This script will:

- Wait for the MSSQL server to fully start
- Create a database called `TestDB`
- You can modify the script to import additional tables or data as needed.

### 4. Verify Services

- MSSQL will be accessible on port `1433`.
- MongoDB will be accessible on port `27017`.

You can connect to these services using any MSSQL or MongoDB client.

## Volume Mounts

The following local directories are mounted into the containers:

- `./mssql_scripts` → `/home/mssql_scripts` (for MSSQL scripts)
- `./mongo_scripts` → `/home/mongo_scripts` (for MongoDB scripts)
- `./mssql_data` → `/var/opt/mssql` (for MSSQL data)
- `./mongo-data` → `/data/db` (for MongoDB data)

## Stopping the Services

To stop the services, run:

```bash
docker-compose down
```

This will stop and remove the containers but keep the data in your local directories.

## Troubleshooting

- If the services don't start properly, make sure Docker is running and the required ports are not in use.
- Ensure the scripts `run_mongo_setup.sh` and `import_table.sh` have the correct permissions (`chmod +x <script-name>.sh`).
```