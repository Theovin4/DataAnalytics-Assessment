SELECT 
    u.id AS owner_id,
    u.name,
    COUNT(DISTINCT CASE WHEN p.is_regular_savings = 1 THEN s.id END) AS savings_count,
    COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 THEN s.id END) AS investment_count,
    SUM(s.confirmed_amount) / 100 AS total_deposits
FROM 
    users_customuser u
JOIN 
    plans_plan p ON u.id = p.owner_id
JOIN 
    savings_savingsaccount s ON p.id = s.plan_id
WHERE 
    p.is_regular_savings = 1 OR p.is_a_fund = 1
GROUP BY 
    u.id, u.name
HAVING 
    COUNT(DISTINCT CASE WHEN p.is_regular_savings = 1 THEN s.id END) > 0
    AND COUNT(DISTINCT CASE WHEN p.is_a_fund = 1 THEN s.id END) > 0
ORDER BY 
    total_deposits DESC;
