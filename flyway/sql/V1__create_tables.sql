CREATE TABLE tenants (
    id bigint NOT NULL,
    name text NOT NULL
);

ALTER TABLE tenants ADD PRIMARY KEY (id);

CREATE TABLE routes (
    id UUID NOT NULL,
    tenant_id bigint NOT NULL REFERENCES tenants(id),
    name text NOT NULL
);

ALTER TABLE routes ADD PRIMARY KEY(id, tenant_id);

CREATE TABLE route_itineraries (
	id UUID NOT NULL,
    tenant_id bigint NOT NULL REFERENCES tenants(id),
	route_id UUID NOT NULL,
	start_date date NOT NULL
);

ALTER TABLE route_itineraries ADD PRIMARY KEY(id, tenant_id);

CREATE TABLE route_itinerary_tasks (
	id UUID NOT NULL,
    tenant_id bigint NOT NULL REFERENCES tenants(id),
    route_itinerary_id UUID NOT NULL,
	sequence smallint NOT NULL,
	time_to_next_task timestamp without time zone NOT NULL,
	task_json jsonb NOT NULL
);

ALTER TABLE route_itinerary_tasks ADD PRIMARY KEY(id, tenant_id);