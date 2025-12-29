SELECT
    FORMAT(CAST([date] AS date), 'yyyy-MM') AS month,
    ROUND(AVG(CAST(market_price_usd AS float)), 2) AS avg_monthly_price
FROM market_prices_large
GROUP BY FORMAT(CAST([date] AS date), 'yyyy-MM')
ORDER BY month;


month	avg_monthly_price
2023-10	82.71
2023-11	78.49
2023-12	75.65
2024-01	76.72
2024-02	75.63
2024-03	76.09
