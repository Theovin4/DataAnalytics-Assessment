WITH customer_data AS (
    SELECT 
        u.id AS customer_id,
        u.name,
        TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
        COUNT(s.id) AS total_transactions,
        AVG(s.confirmed_amount) * 0.001 AS avg_profit_per_transaction
    FROM 
        users_customuser u
    JOIN 
        savings_savingsaccount s ON u.id = s.owner_id
    GROUP BY 
        u.id, u.name, u.date_joined
)
SELECT 
    customer_id,
    name,
    tenure_months,
    total_transactions,
    ROUND((total_transactions / tenure_months) * 12 * avg_profit_per_transaction, 2) AS estimated_clv
FROM 
    customer_data
WHERE 
    tenure_months > 0
ORDER BY 
    estimated_clv DESC;
