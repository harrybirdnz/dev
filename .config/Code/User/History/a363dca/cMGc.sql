select code, name_metric, name_imperial, ecommerce_category_id, category_id
from products
join categories c on products.category_id = c.id
where c."group" in ('Corten Kitsets', 'Corten')
and array_length(ecommerce_category_id, 1) > 0;