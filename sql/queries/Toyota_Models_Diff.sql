SELECT model,
	count(*) as cars,
	avg(price_diff_pct) as avg_diff_pct
FROM car_prices
where make = 'Toyota'
GROUP by model
HAVING cars >= 1000
order by avg_diff_pct DESC
LIMIT 10;