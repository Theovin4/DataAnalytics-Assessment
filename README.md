Project Overview

This project involves analyzing customer data for a financial institution to identify high-value customers, transaction frequency, account inactivity, and customer lifetime value.

Per-Question Explanations

1. High-Value Customers with Multiple Products
- *Approach*: I used a JOIN statement to combine the `users_customuser`, `plans_plan`, and `savings_savingsaccount` tables. I then used a HAVING clause to filter customers with both savings and investment plans.
- *Rationale*: This approach allows us to identify customers who have multiple products and calculate their total deposits.

2. Transaction Frequency Analysis
- *Approach*: I used a Common Table Expression (CTE) to calculate the average transaction frequency for each customer. I then categorized customers into high, medium, and low frequency based on their average transactions per month.
- *Rationale*: This approach allows us to analyze transaction frequency and identify patterns in customer behavior.

3. Account Inactivity Alert
- *Approach*: I used a JOIN statement to combine the `plans_plan` and `savings_savingsaccount` tables. I then used a HAVING clause to filter accounts with no transactions in the last year.
- *Rationale*: This approach allows us to identify inactive accounts and alert the relevant teams.

4. Customer Lifetime Value (CLV) Estimation
- *Approach*: I used a CTE to calculate the customer lifetime value based on account tenure and transaction volume. I then ordered the results by estimated CLV in descending order.
- *Rationale*: This approach allows us to estimate the lifetime value of each customer and prioritize high-value customers.

Challenges

- *Data Complexity*: The dataset included multiple tables with complex relationships. To resolve this, I used JOIN statements and CTEs to simplify the queries and ensure accurate results.
- *Transaction Frequency Calculation*: Calculating the average transaction frequency required careful consideration of the date range and transaction volume. To resolve this, I used a CTE to calculate the average transactions per month and categorized customers accordingly.
- *CLV Estimation*: Estimating customer lifetime value required assumptions about profit per transaction and tenure. To resolve this, I used a simplified model that assumes a fixed profit per transaction and calculates CLV based on account tenure and transaction volume.

Conclusion

This project demonstrates the use of SQL to analyze customer data and identify high-value customers, transaction frequency, account inactivity, and customer lifetime value. By using JOIN statements, CTEs, and aggregate functions, we can gain insights into customer behavior and prioritize high-value customers.
