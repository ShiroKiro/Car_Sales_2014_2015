SELECT sale_year,
	avg(sellingprice) AS avg_selling_price,
	avg(mmr) AS avg_mmr
FROM car_prices
GROUP BY sale_year
ORDER BY sale_year;