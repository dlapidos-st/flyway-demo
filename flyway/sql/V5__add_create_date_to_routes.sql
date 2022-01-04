ALTER TABLE routes
    ADD COLUMN IF NOT EXISTS create_date timestamp DEFAULT (now() at time zone 'utc') NOT NULL;