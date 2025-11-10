
SELECT
    '[' || pd.code || '] ' || pd.name_metric AS product,
    SUM(sm.quantity) AS "counted quantity"
FROM stock_movements sm
WHERE sm.subdivision_id = 2
JOIN products pd ON sm.product_id = pd.id
GROUP BY pd.code, pd.name_metric
