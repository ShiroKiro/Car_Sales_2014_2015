SELECT
	avg(Case when price_diff_pct > 0 then 1.0 else 0.0 end) as share_above_mmr
FROM car_prices