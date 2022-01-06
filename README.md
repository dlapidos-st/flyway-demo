# Flyway/Postgres/Citus example

## Purpose
This project demonstrates the use of [Flyway](https://flywaydb.org/) to safely execute database schema migrations against a distributed Postgres cluster, using the [Citus](https://www.citusdata.com/) extension. 

The docker-compose file creates a distributed Postgres cluster (a primary node and 2 workers). 

## Port mappings
- Postgres database: 5432
- PGAdmin: 5555

## Trying it out:
You'll need a Postgres management tool of your choosing. PGAdmin is included in this cluster, and is available at http://localhost:5555 (the primary node is named `citus_master`, and credentials are stored in `postgres.sql`).

- Start the cluster:
    ```
    docker-compose up -d
    ```
- Note that the `routing-api` database doesn't have any tables related to the routing API
- Execute the initial migration, which will execute the `.sql` files in the `flyway/sql` directory:
    ```
    bash migrate.sh
    ```
- Note that the `routing-api` database now has new tables
- Execute the migration again, and note it completed successfully without executing any scripts (the scripts were designed to fail if executed more than once)
- Create a new migration by adding a `.sql` file to the `/flyway/sql` directory, containing the SQL that performs the migration. Note that Flyway requires a particular naming convention, as defined in the [documentation](https://flywaydb.org/documentation/concepts/migrations#naming). This example adds the column `update_date` to the `routes` table:
    ```
    ALTER TABLE routes
        ADD COLUMN IF NOT EXISTS update_date timestamp DEFAULT (now() at time zone 'utc') NOT NULL;
    ```
- Execute the migration
- Examine the schema and note the changes made by the migration 
- Without adding any new files execute the migration again, and note it completed successfully without executing any scripts
- To stop the cluster and remove all database files, execute `docker-compose down -v`, or to stop the cluster without destroying databases, execute `docker-compose stop`