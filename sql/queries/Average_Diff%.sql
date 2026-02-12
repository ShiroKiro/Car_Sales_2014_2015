SELECT sale_year,
	avg(price_diff_pct) as avg_diff_pct
FROM car_prices
Group by sale_year
Order by sale_year;