-- Active: 1756864596779@@127.0.0.1@5430
-- Active: 1759808189054@@odoo-server@5432@rocersa-testive: 1759808189054@@odoo-server@5432@rocersa-test
SELECT
    name_metric AS name,
    code AS "internal reference",
    'Units' AS Unit,
    weight,
    categories.name AS "product category",
    au_wholesale_cost AS Cost,
    au_web AS "is_published",
    array_to_string(ecommerce_category_id, ',') AS ecommerce_category_id,
    concat_ws(',',
        CASE WHEN au_web THEN 'cor-ten-steel.com.au' END,
        CASE WHEN nz_web THEN 'cor-ten-steel.co.nz' END,
        CASE WHEN uk_web THEN 'cor-ten-steel.co.uk' END,
        CASE WHEN us_web THEN 'cor-ten-steel.com' END
    ) AS websites
FROM products
JOIN categories ON categories.id = products.category_id
WHERE name_metric in (
    'Corten Panel 900 x 450 x 2mm - 2-folds - AC',
    'Corten Panel 1500 x 600 x 2mm - 2-folds - AC',
    'Qtr Ext Cur 600mm rad 747mm A=942mm 2mm'
)
and categories.group in ('Corten', 'Corten Kitsets')
GROUP BY products.id, categories.name
ORDER BY category_id;



