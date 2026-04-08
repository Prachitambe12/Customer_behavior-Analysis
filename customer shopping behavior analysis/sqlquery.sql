SELECT column_name
FROM information_schema.columns
WHERE table_name = 'customer';

SELECT "Gender", SUM("Purchase Amount (USD)") AS revenue
FROM customer
GROUP BY "Gender";

SELECT "Customer ID", "Purchase Amount (USD)", "Discount Applied"
FROM customer
WHERE "Discount Applied" = 'Yes'
AND "Purchase Amount (USD)" > (
    SELECT AVG("Purchase Amount (USD)")
    FROM customer
);

SELECT "Item Purchased",
       AVG("Review Rating") AS "Average Product Rating"
FROM customer
GROUP BY "Item Purchased"
ORDER BY AVG("Review Rating") DESC
LIMIT 5;

SELECT "Subscription Status",
       COUNT("Customer ID") AS total_customers,
       ROUND(AVG("Purchase Amount (USD)"), 2) AS avg_spend,
       ROUND(SUM("Purchase Amount (USD)"), 2) AS total_revenue
FROM customer
GROUP BY "Subscription Status"
ORDER BY total_revenue DESC, avg_spend DESC;

