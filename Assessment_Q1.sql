-- CTEs for selecting funded savings and investment plans
WITH savings AS (
    SELECT p.owner_id, 
           COUNT(s.confirmed_amount) AS savings_count,
           SUM(s.confirmed_amount) AS savings_amount
    FROM adashi_staging.plans_plan AS p

    -- Join savings and plans table
    INNER JOIN adashi_staging.savings_savingsaccount AS s 
    	ON p.id = s.plan_id

    -- Filters for savings accounts with deposits only	
    WHERE p.is_regular_savings = 1 AND s.confirmed_amount > 0
    GROUP BY p.owner_id
),

investments AS (
    SELECT p.owner_id, 
           COUNT(s.confirmed_amount) AS investment_count,
           SUM(s.confirmed_amount) AS investment_amount
    FROM adashi_staging.plans_plan AS p
    INNER JOIN adashi_staging.savings_savingsaccount AS s 
    	ON p.id = s.plan_id

    -- Filters for investment accounts with deposits only	
    WHERE p.is_a_fund = 1 AND s.confirmed_amount > 0
    GROUP BY p.owner_id
)

SELECT 
	u.id AS owner_id,
	
    	-- Join both first and last name of users
    	CONCAT(u.first_name, ' ', u.last_name) AS name,
    	s.savings_count,
    	i.investment_count,

	-- Rounds total deposits to 2 decimal places
    	ROUND(s.savings_amount + i.investment_amount, 2) AS total_deposits
FROM savings AS s

-- Join both CTEs
INNER JOIN investments AS i 
    ON s.owner_id = i.owner_id
INNER JOIN adashi_staging.users_customuser AS u 
    ON s.owner_id = u.id

-- Sort total deposits from highest to lowest
ORDER BY total_deposits DESC;
