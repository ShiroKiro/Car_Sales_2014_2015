SELECT make,
	count(*) as cars,
	avg(price_diff_pct) as avg_diff_pct
from car_prices
GROUP by make
having cars >= 1000
order by avg_diff_pct ASC
LIMIT 10;