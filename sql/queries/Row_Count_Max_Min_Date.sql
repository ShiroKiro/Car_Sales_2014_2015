SELECT
	count(*) as ROWS,
	min(sale_dt) as min_date,
	max(sale_dt) as max_date
FROM car_prices