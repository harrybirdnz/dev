select code
from products
join categories c on c.id = products.category_id
where c.group in ('Corten', 'Corten Kitsets')