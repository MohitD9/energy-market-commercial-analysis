SELECT
    CAST(t.trade_date AS date) AS trade_date,
    ROUND(
        SUM(
            CASE 
                WHEN t.buy_sell = 'Buy'
                THEN (CAST(p.market_price_usd AS float) - CAST(t.trade_price_usd AS float)) * t.volume_barrels
                ELSE (CAST(t.trade_price_usd AS float) - CAST(p.market_price_usd AS float)) * t.volume_barrels
            END
        ),
        2
    ) AS total_daily_value_impact_usd
FROM trades_large t
JOIN market_prices_large p
    ON CAST(t.trade_date AS date) = CAST(p.[date] AS date)
GROUP BY CAST(t.trade_date AS date)
ORDER BY trade_date;
