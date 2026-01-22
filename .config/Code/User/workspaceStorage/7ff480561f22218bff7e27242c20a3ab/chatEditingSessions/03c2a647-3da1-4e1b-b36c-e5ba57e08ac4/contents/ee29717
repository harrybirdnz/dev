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
    'Rectangular planter 3100L x 1150W x 750T',
    'Rectangular planter 3100L x 1150W x 600T',
    'Rectangular planter 3100L x 1150W x 900T',
    'Rectangular planter 3100L x 625W x 375T',
    'Rectangular planter 625L x 625W x 375T',
    'Rectangular planter 5050L x 1300W x 450T',
    'Rectangular planter 4450L x 475W x 450T',
    'Rectangular planter 4450L x 475W x 375T',
    'Rectangular planter 1300L x 1300W x 450T',
    'Rectangular planter 2500L x 2500W x 450T-a',
    'Rectangular planter 850L x 700W x 375T',
    'Rectangular planter 2050L x 850W x 375T',
    'Rectangular planter 1000L x 400W x 375T',
    'Rectangular planter 2500L x 400W x 375T',
    'Rectangular planter 850L x 700W x 300T',
    'Rectangular planter 850L x 700W x 450T',
    'Rectangular planter 2050L x 850W x 450T',
    'Rectangular planter 2050L x 850W x 300T'
)
and categories.group in ('Corten', 'Corten Kitsets')
GROUP BY products.id, categories.name
ORDER BY category_id;



