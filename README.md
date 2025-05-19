# DataAnalytics-Assessment
# Assessment_Q1
This query identifies customers who have at least one funded savings plan and one funded investment plan, making them ideal for cross-selling opportunities. I used:

- Common Table Expressions (CTEs): Extracted users with confirmed deposits in savings (is_regular_savings = 1) and investment (is_a_fund = 1) plans respectively.
- INNER JOIN Logic: Combined users from both CTEs to ensure only those with both plan types are selected.
- Utlilized the GROUP BY to aggregate data per user, sorted results with ORDER BY to show top depositors, applied COUNT and SUM to calculate the number of plans and total deposit values, used CONCAT to display full user names and applied WHERE for filtering.
- Final Output: Displayed user id and names, counts of each plan type, and the total deposit value sorted in descending order, rounded to 2 decimal places (using ROUND).

# Assessment_Q2
This query identifies and categorizes customers based on how frequently they transact monthly, helping to segment customers for targeted engagement strategies. I used:

- Common Table Expression (CTE): Defined a temporary result set (transaction_freq) to isolate user transactions and categorize frequency levels before final aggregation.
- EXTRACT(MONTH FROM transaction_date): Retrieved the month from each transaction date to allow monthly grouping of user activities.
- CASE Statement: Classified customers into Low, Medium, or High Frequency based on the number of monthly transactions.
- GROUP BY Logic: Aggregated transactions per user per month to determine their monthly activity level. Finally aggregated transactions per frequency levels.
- Aggregate Functions: Used COUNT(and DISTINCT) to get the number of unique users per category and AVG(and ROUND) to calculate the average number of transactions per user to 1 decimal place.
- Final Output: Displayed each frequency category with the number of users and their average monthly transactions, ordered (ORDER BY) from highest to lowest activity.
