# DataAnalytics-Assessment
# Assessment_Q1
This query identifies users who have at least one funded savings plan and one funded investment plan, making them ideal for cross-selling opportunities. I used:

- Common Table Expressions (CTEs): Extracts users with confirmed deposits in savings (is_regular_savings = 1) and investment (is_a_fund = 1) plans respectively.
- INNER JOIN Logic: Combines users from both CTEs to ensure only those with both plan types are selected. Also utlilized the GROUP BY, ORDER BY, SUM, CONCAT, COUNT and ROUND clauses.
- Final Output: Displays user id and names, counts of each plan type, and the total deposit value sorted in descending order, rounded to 2 decimal places.
