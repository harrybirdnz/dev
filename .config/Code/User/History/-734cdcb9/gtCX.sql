SELECT
    kp.name_metric AS name,
    'Kit' AS "BoM Type",
    pp.name_metric AS "BoM Lines/Component",
    kc.quantity AS "BoM Lines/Quantity",
    'Units' AS "BoM Lines/Unit"
FROM kitset_components kc
join products pp on kc.product_id = pp.id
join products kp on kc.kitset_id = kp.id
join categories c on c.id = kp.category_id
WHERE c.group IN ('Corten Kitsets', 'Corten')
AND kp.name_metric IS NOT NULL AND kp.name_metric <> '';
