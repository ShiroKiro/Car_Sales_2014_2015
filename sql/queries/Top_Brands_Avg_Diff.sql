SELECT make,
	count(*) as cars,
	avg(price_diff_pct) as avg_price_pct
FROM car_prices
group by make
HAVING cars >= 1000
order by avg_price_pct DESC
LIMIT 10;