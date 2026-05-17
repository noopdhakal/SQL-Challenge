select * from orders;

select * from sellers;

select * from users;

select * from orders;

with rnk_orders as 
(select ord.*, rank() over (PARTITION by seller_id order by order_date asc) as rn 
from orders ord)
select u.user_id as seller_id 
-- ,ro.*, i.ITEM_BRAND, u.favorite_brand
, case when i.ITEM_BRAND = u.FAVORITE_BRAND then 'Yes' else 'No' end as second_item_fav_brand
 from users u 
 left join rnk_orders ro on ro.seller_id = u.user_id and rn =2
left join items i on i.item_id = ro.item_id
-- inner join users u on ro.seller_id = u.user_id
-- where rn=2
order by 1
;