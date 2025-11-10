

WITH stock_levels AS (
    SELECT
        '[' || code || ']' || name_metric AS product,
        SUM(quantity) AS "counted quantity"
    FROM stock_movements
    GROUP BY code
)
SELECT
    stock_levels.product,
    stock_levels."counted quantity",
    product_details."internal reference",
    product_details."Unit",
    product_details.weight,
    product_details."product category",
    product_details.Cost,
    product_details."is_published",
    product_details.ecommerce_category_id,
    product_details.websites
FROM stock_levels
JOIN product_details ON stock_levels.product = product_details.name