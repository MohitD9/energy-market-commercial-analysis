SELECT
    FORMAT(CAST([date] AS date), 'yyyy-MM') AS month,
    ROUND(AVG(CAST(market_price_usd AS float)), 2) AS avg_monthly_price
FROM market_prices_large
GROUP BY FORMAT(CAST([date] AS date), 'yyyy-MM')
ORDER BY month;
