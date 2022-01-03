CREATE VIEW vw_routes AS
SELECT  tenants.name AS tenant_name,
        routes.id,
        routes.tenant_id,
        routes.name
FROM tenants
INNER JOIN routes
ON tenants.id = routes.tenant_id;