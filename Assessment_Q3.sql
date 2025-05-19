SELECT 
    s.plan_id, 
    s.owner_id,
    CASE 
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
    END AS type,
    MAX(DATE(s.transaction_date)) AS last_transaction_date,
    DATEDIFF(CURDATE(), MAX(DATE(s.transaction_date))) AS inactivity_days
FROM adashi_staging.plans_plan AS p
INNER JOIN adashi_staging.savings_savingsaccount AS s
    ON s.plan_id = p.id 
WHERE 
    (p.is_regular_savings = 1 OR p.is_a_fund = 1)
GROUP BY s.plan_id, s.owner_id
HAVING DATEDIFF(CURDATE(), MAX(DATE(s.transaction_date))) > 365
ORDER BY inactivity_days DESC;