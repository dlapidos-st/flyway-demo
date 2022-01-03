SELECT create_distributed_table('tenants', 'id');
SELECT create_distributed_table('routes', 'tenant_id');
SELECT create_distributed_table('route_itineraries', 'tenant_id');
SELECT create_distributed_table('route_itinerary_tasks', 'tenant_id');
