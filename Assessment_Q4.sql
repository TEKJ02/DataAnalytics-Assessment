SELECT
	u.id AS customer_id,
    
    -- Join both first and last name of customers
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    
    -- Calculate tenure of each customer in months
    TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()) AS tenure_months,
    COUNT(s.transaction_date) AS total_transactions,
	
    -- Calculate estimated CLV (rounded to 2 decimal places) 
    ROUND(
        (COUNT(s.transaction_date) / (TIMESTAMPDIFF(MONTH, u.date_joined, CURDATE()))) 
        * 12 * AVG(0.001 * s.confirmed_amount), 2
    ) AS estimated_clv
FROM adashi_staging.users_customuser AS u

-- Join savings table to the users table
INNER JOIN adashi_staging.savings_savingsaccount AS s
	ON u.id = s.owner_id
GROUP BY u.id

-- Sort result by estimated CLV from highest to lowest
ORDER BY estimated_clv DESC;