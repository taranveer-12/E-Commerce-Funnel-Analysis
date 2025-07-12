WITH
step1_visitors AS (
  SELECT COUNT(DISTINCT customer_id) AS total_visitors
  FROM retail_data
  WHERE customer_id IS NOT NULL
),

step2_browsed AS (
  SELECT COUNT(DISTINCT customer_id) AS browsed
  FROM retail_data
  WHERE customer_id IS NOT NULL AND quantity = 0
),

step3_cart AS (
  SELECT COUNT(DISTINCT customer_id) AS added_to_cart
  FROM retail_data
  WHERE customer_id IS NOT NULL AND quantity > 0
),

step4_checkout AS (
  SELECT COUNT(DISTINCT customer_id) AS initiated_checkout
  FROM retail_data
  WHERE customer_id IS NOT NULL AND quantity > 0 AND invoice NOT LIKE 'C%'
),

step5_purchase AS (
  SELECT COUNT(DISTINCT invoice) AS purchases
  FROM retail_data
  WHERE customer_id IS NOT NULL AND quantity > 0 AND invoice NOT LIKE 'C%'
),

step6_repeat_buyers AS (
  SELECT COUNT(*) AS repeat_buyers
  FROM (
    SELECT customer_id
    FROM retail_data
    WHERE customer_id IS NOT NULL AND quantity > 0 AND invoice NOT LIKE 'C%'
    GROUP BY customer_id
    HAVING COUNT(DISTINCT invoice) > 1
  ) AS repeated
)

SELECT
  s1.total_visitors,
  s2.browsed,
  s3.added_to_cart,
  s4.initiated_checkout,
  s5.purchases,
  s6.repeat_buyers,
  
  ROUND(100.0 * s2.browsed / NULLIF(s1.total_visitors, 0)::numeric, 2) AS visitor_to_browse_pct,
  ROUND(100.0 * s3.added_to_cart / NULLIF(s2.browsed, 0)::numeric, 2) AS browse_to_cart_pct,
  ROUND(100.0 * s4.initiated_checkout / NULLIF(s3.added_to_cart, 0)::numeric, 2) AS cart_to_checkout_pct,
  ROUND(100.0 * s5.purchases / NULLIF(s4.initiated_checkout, 0)::numeric, 2) AS checkout_to_purchase_pct,
  ROUND(100.0 * s6.repeat_buyers / NULLIF(s5.purchases, 0)::numeric, 2) AS purchase_to_repeat_pct

FROM
  step1_visitors s1,
  step2_browsed s2,
  step3_cart s3,
  step4_checkout s4,
  step5_purchase s5,
  step6_repeat_buyers s6;
