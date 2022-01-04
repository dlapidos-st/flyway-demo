# Flyway/Postgres/Citus example

## Purpose
This project demonstrates the use of [Flyway](https://flywaydb.org/) to safely execute database schema migrations against a distributed Postgres cluster, using the [Citus](https://www.citusdata.com/) extension. 

The docker-compose file creates a distributed Postgres cluster (a primary node and 2 workers). Every time the cluster starts, Flyway executes a migration using the files in the `/flyway/sql` directory. Migrations can also be executed on-demand using the `migration.sh` bash script.

## Port mappings
- Postgres database: 5432
- PGAdmin: 5555

## Trying it out:
- Start the cluster:
    ```
    docker-compose up --build -d
    ```
- Create a new migration by adding a `.sql` file to the `/flyway/sql` directory, containing the SQL that performs the migration. Note that Flyway requires a particular naming convention, as defined in the [documentation](https://flywaydb.org/documentation/concepts/migrations#naming). This example adds the column `update_date` to the `routes` table:
    ```
    ALTER TABLE routes
        ADD COLUMN IF NOT EXISTS update_date timestamp DEFAULT (now() at time zone 'utc') NOT NULL;
    ```
- Execute the migration using the following command:
    ```
    bash migrate.sh
    ```
- Using your Postgres client of choice, examine the schema and note the changes made by the migration (PGAdmin is available at http://localhost:5555, with credentials stored in `postgres.env`)
- Without adding any new files execute the migration again, and note it completed successfully without executing any scripts
- To stop the cluster and remove all database files, execute `docker-compose down -v`, or to stop the cluster without destroying databases, execute `docker-compose stop`