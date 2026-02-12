SELECT state,
	count(*) as cars,
	avg(price_diff_pct) as avg_diff_pct
FROM car_prices
GROUP by state
having cars >= 500
order by avg_diff_pct desc;