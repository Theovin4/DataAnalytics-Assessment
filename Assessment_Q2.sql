WITH transaction_frequency AS (
    SELECT 
        u.id AS customer_id,
        YEAR(s.transaction_date) AS transaction_year,
        MONTH(s.transaction_date) AS transaction_month,
        COUNT(s.id) AS transaction_count
    FROM 
        users_customuser u
    JOIN 
        savings_savingsaccount s ON u.id = s.owner_id
    GROUP BY 
        u.id, YEAR(s.transaction_date), MONTH(s.transaction_date)
),
avg_transactions AS (
    SELECT 
        customer_id,
        AVG(transaction_count) AS avg_transactions_per_month
    FROM 
        transaction_frequency
    GROUP BY 
        customer_id
)
SELECT 
    CASE 
        WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
        WHEN avg_transactions_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(customer_id) AS customer_count,
    ROUND(AVG(avg_transactions_per_month), 2) AS avg_transactions_per_month
FROM 
    avg_transactions
GROUP BY 
    CASE 
        WHEN avg_transactions_per_month >= 10 THEN 'High Frequency'
        WHEN avg_transactions_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END;