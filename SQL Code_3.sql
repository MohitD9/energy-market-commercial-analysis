SELECT
    t.trade_id,
    CAST(t.trade_date AS date) AS trade_date,
    t.buy_sell,
    t.volume_barrels,
    ROUND(CAST(t.trade_price_usd AS float), 2) AS trade_price_usd,
    ROUND(CAST(p.market_price_usd AS float), 2) AS market_price_usd,
    ROUND(
        CASE 
            WHEN t.buy_sell = 'Buy'
            THEN (CAST(p.market_price_usd AS float) - CAST(t.trade_price_usd AS float)) * t.volume_barrels
            ELSE (CAST(t.trade_price_usd AS float) - CAST(p.market_price_usd AS float)) * t.volume_barrels
        END,
        2
    ) AS estimated_value_impact_usd
FROM trades_large t
JOIN market_prices_large p
    ON CAST(t.trade_date AS date) = CAST(p.[date] AS date)
ORDER BY trade_date, trade_id;
