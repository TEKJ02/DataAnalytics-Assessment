# DataAnalytics-Assessment
# Assessment_Q1
This query identifies customers who have at least one funded savings plan and one funded investment plan, making them ideal for cross-selling opportunities. I used:

- Common Table Expressions (CTEs): Extracted users with confirmed deposits in savings (is_regular_savings = 1) and investment (is_a_fund = 1) plans respectively.
- INNER JOIN Logic: Combined users from both CTEs to ensure only those with both plan types are selected.
- Utlilized the GROUP BY to aggregate data per user, sorted results with ORDER BY to show top depositors, applied COUNT and SUM to calculate the number of plans and total deposit values, used CONCAT to display full user names and applied WHERE for filtering.
- Final Output: Displayed user id and names, counts of each plan type, and the total deposit value sorted in descending order, rounded to 2 decimal places (using ROUND).

# Assessment_Q2
This query identifies and categorizes customers based on how frequently they transact monthly. I used:

- Common Table Expression (CTE): Defined a temporary result set (transaction_freq) to isolate user transactions and categorize frequency levels before final aggregation.
- EXTRACT(MONTH FROM transaction_date): Retrieved the month from each transaction date to allow monthly grouping of user activities.
- CASE Statement: Classified customers into Low, Medium, or High Frequency based on the number of monthly transactions.
- GROUP BY Logic: Aggregated transactions per user per month to determine their monthly activity level. Finally aggregated transactions per frequency levels.
- Aggregate Functions: Used COUNT(and DISTINCT) to get the number of unique users per category and AVG(and ROUND) to calculate the average number of transactions per user to 1 decimal place.
- Final Output: Displayed each frequency category with the number of users and their average monthly transactions, ordered (ORDER BY) from highest to lowest activity.

# Assessment_Q3
This query identifies customers with savings or investment plans who have been inactive for over a year. I used:

- CASE Statement: Categorized each plan as either 'Savings' or 'Investment' based on plan type flags (is_regular_savings & is_a_fund).
- MAX(DATE(...)): Retrieved the most recent transaction date per plan to track the last user activity.
- DATEDIFF(CURDATE(), MAX(...)): Calculated the number of days since the last transaction to measure inactivity duration.
- WHERE Clause: Filtered for only savings or investment plans.
- GROUP BY Logic: Grouped data by individual plan and owner to evaluate inactivity on a plan-by-plan basis.
- HAVING Clause: Selected only plans with no transactions in over 365 days.
- ORDER BY Clause: Sorted the results by inactivity days in descending order to highlight the most dormant accounts.
- Final Output: Displayed the plan_id, owner_id, plan type (Savings or Investment), last_transaction_date, and the number of inactivity_days for each dormant plan — ordered from the longest to shortest inactivity.
