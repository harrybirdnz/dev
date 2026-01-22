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
    'Corten Panel 1800 x 600 x 3mm Top',
    'Corten Panel 2100 x 450 x 3mm Top',
    'Corten Panel 2400 x 450 x 3mm Top',
    'Qtr Ext Cur 750mm rad 747mm A=1178mm',
    'Qtr Ext Cur 1200mm rad 597mm A=1884mm',
    'Corten Panel 2100 x 600 x 3mm Top',
    'Corten Panel 2700 x 450 x 3mm Top',
    'Corten Cap Rnd 1497 x 215 x 63 x 3mm',
    'Capping Rnd End 1570 x 215 x 63 x 3mm',
    'Corten Panel 2400 x 750 x 3mm Top',
    'Corten Cap Rnd 1797 x 215 x 63 x 3mm',
    'Capping Rnd End 1870 x 215 x 63 x 3mm',
    'Corten Squ End Cap V 747 x 200mm',
    'Corten Cap Rnd 1197 x 215 x 63 x 3mm',
    'Capping Rnd End 1270 x 215 x 63 x 3mm',
    'Corten Squ End Cap V 372 x 200mm',
    'Corten Squ End Cap V 897 x 200mm',
    'Capping Rnd End 970 x 215 x 63 x 3mm',
    'Corten Cap Rnd 897 x 215 x 63 x 3mm',
    'Riser Top-35 x 1000 x 150 x 3mm',
    'Riser Top-35 x 1300 x 150 x 3mm',
    'Riser Top-35 x 1600 x 200 x 3mm',
    'Riser Top-35 x 1200 x 175 x 3mm',
    'Corten Squ End Cap V 1047 x 200mm',
    'Corten Squ End Cap V 522 x 200mm',
    'Riser Top-35 x 1300 x 200 x 3mm',
    'Corten Squ End Cap V 522 x 300mm',
    'Corten Panel 1500 x 900 x 3mm Top',
    'Corten Squ End Cap Vert 378 x 302mm',
    'Corten Panel 900 x 1050 x 3mm Top',
    'Riser Top-35 x 845 x 150 x 3mm',
    'Corten Squ End Cap V 372 x 300mm',
    'Corten Panel 900 x 450 x 2mm - 2-folds',
    'Corten Panel 1500 x 600 x 2mm - 2-folds'
)
and categories.group in ('Corten', 'Corten Kitsets')
GROUP BY products.id, categories.name
ORDER BY category_id;



