SELECT make, COUNT(*) as cars 
FROM car_prices
GROUP BY make
ORDER BY cars DESC
LIMIT 10;