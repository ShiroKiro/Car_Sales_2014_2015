SELECT
  SUM(CASE WHEN transmission = 'Unknown' THEN 1 ELSE 0 END) AS unknown_transmission,
  SUM(CASE WHEN body = 'Unknown' THEN 1 ELSE 0 END) AS unknown_body,
  SUM(CASE WHEN color = 'Unknown' THEN 1 ELSE 0 END) AS unknown_color
FROM car_prices;
