SELECT 
    s.plan_id, 
    s.owner_id,
    
    -- Determine account type based on plan attributes
    CASE 
        WHEN p.is_regular_savings = 1 THEN 'Savings'
        WHEN p.is_a_fund = 1 THEN 'Investment'
    END AS type,
    
    -- Retrieves most recent transaction date
    MAX(DATE(s.transaction_date)) AS last_transaction_date,
    
    -- Retrieves difference between current date and most recent transaction date
    DATEDIFF(CURDATE(), MAX(DATE(s.transaction_date))) AS inactivity_days
FROM adashi_staging.plans_plan AS p
    
-- Merge savings and plans table
INNER JOIN adashi_staging.savings_savingsaccount AS s
    ON s.plan_id = p.id 
    
-- Filter for savings or investment accounts only
WHERE 
    (p.is_regular_savings = 1 OR p.is_a_fund = 1)
GROUP BY s.plan_id, s.owner_id
    
-- Retrieves accounts with inactive days more than 365 days
HAVING inactivity_days > 365

-- Sorts inactive days from highest to lowest
ORDER BY inactivity_days DESC;
