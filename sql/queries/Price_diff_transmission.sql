SELECT transmission,
	count(*) as cars,
	avg(price_diff_pct) as avg_diff_pct
FROM car_prices
GROUP by transmission
Order by cars DESC;