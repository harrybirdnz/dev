-- Active: 1756864596779@@127.0.0.1@5430
-- Active: 1759808189054@@odoo-server@5432@rocersa-testive: 1759808189054@@odoo-server@5432@rocersa-test
SELECT
    name_metric AS name,
    code AS "internal reference",
    drawing_number AS "drawing number"
FROM products
WHERE name_metric IS NOT NULL AND name_metric <> ''
  AND drawing_number IS NOT NULL AND drawing_number <> ''
  AND code like 'Cor%';



