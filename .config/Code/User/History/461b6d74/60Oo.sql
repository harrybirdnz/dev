

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
FROM stock_levels
JOIN product_details ON stock_levels.product = product_details.name