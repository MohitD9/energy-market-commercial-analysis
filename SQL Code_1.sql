SELECT
    CAST([date] AS date) AS price_date,
    ROUND(CAST(market_price_usd AS float), 2) AS market_price_usd,
    ROUND(
        AVG(CAST(market_price_usd AS float)) OVER (
            ORDER BY CAST([date] AS date)
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ), 
        2
    ) AS avg_price_7d
FROM market_prices_large
ORDER BY price_date;
