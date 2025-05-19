WITH transaction_freq AS (
	SELECT 
		owner_id,
		EXTRACT(MONTH FROM transaction_date) AS month,
		COUNT(transaction_date) AS total_transactions,
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
	COUNT(DISTINCT owner_id) AS customer_count,
	ROUND(AVG(total_transactions), 1) AS avg_transactions_per_month
FROM transaction_freq
GROUP BY frequency_category
ORDER BY avg_transactions_per_month DESC;