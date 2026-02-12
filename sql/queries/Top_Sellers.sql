SELECT seller, count(*) as cars
FROM car_prices
GROUP by seller
Order by cars DESC
LIMIT 10;