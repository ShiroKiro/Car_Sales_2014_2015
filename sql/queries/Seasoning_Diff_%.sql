SELECT sale_month,
	avg(price_diff_pct) as avg_diff_pct
FROM car_prices
GROUP by sale_month
order by sale_month;