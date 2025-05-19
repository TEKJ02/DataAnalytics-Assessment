-- CTE to extract number of transactions of users per month and frequency levels
WITH transaction_freq AS (
	SELECT 
		owner_id,
		-- Extract month from transaction date
		EXTRACT(MONTH FROM transaction_date) AS month,
		COUNT(transaction_date) AS total_transactions,
		-- Classify customers into low, medium and high frequency level based on transaction count
		CASE 
			WHEN COUNT(transaction_date) <= 2 THEN 'Low Frequency' 
			WHEN COUNT(transaction_date) BETWEEN 3 AND 9 THEN 'Medium Frequency'
			ELSE 'High Frequency'
		END AS frequency_category
	FROM adashi_staging.savings_savingsaccount 
	GROUP BY month, owner_id
)

SELECT 
	frequency_category,
	-- Number of unique customers
	COUNT(DISTINCT owner_id) AS customer_count,
	ROUND(AVG(total_transactions), 1) AS avg_transactions_per_month
FROM transaction_freq
GROUP BY frequency_category
ORDER BY avg_transactions_per_month DESC;
