SELECT
	CASE
		When car_age BETWEEN 0 and 2 THEN '0-2'
		When car_age BETWEEN 3 and 5 THEN '3-5'
		WHEN car_age BETWEEN 6 and 10 THEN '6-10'
		else '11+'
	end as age_bucket,
	count(*) as cars,
	avg(price_diff_pct) as avg_price_pct
FROM car_prices
GROUP by age_bucket
Order by age_bucket;