select code, 
name_metric, 
name_imperial, 
array_to_string(products.ecommerce_category_id, ',') AS ecommerce_category_id, 
category_id
from products
join categories c on products.category_id = c.id
where c."group" in ('Corten Kitsets', 'Corten')
and array_length(ecommerce_category_id, 1) > 0;