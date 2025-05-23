WITH last_transactions AS (
    SELECT 
        p.id AS plan_id,
        p.owner_id,
        CASE 
            WHEN p.is_regular_savings = 1 THEN 'Savings'
            WHEN p.is_a_fund = 1 THEN 'Investment'
        END AS type,
        MAX(s.transaction_date) AS last_transaction_date
    FROM 
        plans_plan p
    JOIN 
        savings_savingsaccount s ON p.id = s.plan_id
    GROUP BY 
        p.id, p.owner_id, p.is_regular_savings, p.is_a_fund
)
SELECT 
    plan_id,
    owner_id,
    type,
    last_transaction_date,
    DATEDIFF(CURDATE(), last_transaction_date) AS inactivity_days
FROM 
    last_transactions
WHERE 
    DATEDIFF(CURDATE(), last_transaction_date) > 365;
