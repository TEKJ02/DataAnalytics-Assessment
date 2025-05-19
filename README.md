# DataAnalytics-Assessment

## Assessment_Q1: High-Value Customers with Multiple Products  
This query identifies customers with **both a funded savings and investment plan**, making them ideal for cross-selling.

### Approach:
- **CTEs** to extract users with confirmed deposits in savings and investment plans.
- **INNER JOIN** to find users who have both.
- **COUNT & SUM** to get number of plans and total deposit amounts.
- **GROUP BY** for per-user aggregation; **ORDER BY** to rank by total deposits.
- **CONCAT** for full names; **ROUND** to format totals.

**Final Output:**  
User ID, name, plan counts, and total deposits — sorted in descending order.

---

## Assessment_Q2: Transaction Frequency Analysis 
This query categorizes customers based on their **monthly transaction frequency**.

### Approach:
- **CTE** to track transactions per user per month.
- **EXTRACT(MONTH)** to group by calendar month.
- **CASE** to classify frequency levels (Low, Medium, High).
- **GROUP BY** to aggregate by user and frequency category.
- **COUNT, AVG & ROUND** to compute unique users and average transactions.

**Final Output:**  
Frequency category, number of users, and average monthly transactions — ordered by activity level.

---

## Assessment_Q3: Account Inactivity Alert  
This query highlights **accounts inactive for over a year**.

### Approach:
- **CASE** to label plan types as 'Savings' or 'Investment'.
- **MAX(transaction_date)** to get the last activity date.
- **DATEDIFF** to measure days since last transaction.
- **GROUP BY** to evaluate inactivity per plan.
- **HAVING** to filter plans with over 365 days of inactivity.
- **ORDER BY** to prioritize the most dormant accounts.

**Final Output:**  
Plan ID, owner ID, type, last transaction date, and inactivity duration.

---

## Assessment_Q4: Customer Lifetime Value (CLV) Estimation  
This query estimates **CLV per customer** based on transaction behavior and tenure.

### Approach:
- **JOIN** users with their savings transactions.
- **TIMESTAMPDIFF** to calculate customer tenure in months.
- **COUNT** for total transactions; **AVG & ROUND** for average transaction value.
- **CLV Formula:** (total_transactions / tenure) * 12 * avg_profit_per_transaction)
- **GROUP BY & ORDER BY** to aggregate and rank customers.

**Final Output:**  
Customer ID, name, tenure, total transactions, and estimated CLV — ordered by highest CLV.
