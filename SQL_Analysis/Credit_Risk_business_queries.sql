SELECT * FROM credit_risk_analysis.credit;
create database credit_risk_analysis;
use credit_risk_analysis;
-- Overall portfolio KPIs
SELECT
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaulted_loans,
    SUM(loan_status = 0) AS non_defaulted_loans,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct,
    ROUND(SUM(loan_amnt), 2) AS total_loan_amount,
    ROUND(AVG(loan_amnt), 2) AS average_loan_amount,
    ROUND(AVG(loan_int_rate), 2) AS average_interest_rate_pct
FROM credit;

--  Loan grade risk comparison
SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaulted_loans,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct,
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate_pct,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount
FROM credit
GROUP BY loan_grade
ORDER BY default_rate_pct DESC;

-- Loan purpose performance
SELECT
    loan_intent,
    COUNT(*) AS total_loans,
    ROUND(SUM(loan_amnt), 2) AS total_loan_amount,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount
FROM credit
GROUP BY loan_intent
ORDER BY total_loans DESC;

-- Loan purpose ranked by default rate
SELECT
    loan_intent,
    COUNT(*) AS total_loans,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct
FROM credit
GROUP BY loan_intent
HAVING COUNT(*) >= 100
ORDER BY default_rate_pct DESC;

--  Home ownership and observed default rate
SELECT
    person_home_ownership,
    COUNT(*) AS total_loans,
    ROUND(AVG(person_income), 2) AS avg_annual_income,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct
FROM credit
GROUP BY person_home_ownership
ORDER BY default_rate_pct DESC;

--  Prior default history
SELECT
    cb_person_default_on_file AS prior_default_flag,
    COUNT(*) AS total_loans,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct
FROM credit
GROUP BY cb_person_default_on_file
ORDER BY default_rate_pct DESC;

-- Income bands
SELECT
    CASE
        WHEN person_income < 25000 THEN 'Under 25K'
        WHEN person_income < 50000 THEN '25K-49,999'
        WHEN person_income < 75000 THEN '50K-74,999'
        WHEN person_income < 100000 THEN '75K-99,999'
        ELSE '100K+'
    END AS income_band,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct
FROM credit
GROUP BY income_band
ORDER BY MIN(person_income);

-- Loan-to-income ratio bands
SELECT
    CASE
        WHEN loan_percent_income < 0.10 THEN 'Below 10%'
        WHEN loan_percent_income < 0.20 THEN '10%-19.99%'
        WHEN loan_percent_income < 0.30 THEN '20%-29.99%'
        ELSE '30%+'
    END AS loan_income_band,
    COUNT(*) AS total_loans,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct,
    ROUND(AVG(loan_percent_income) * 100, 2) AS avg_loan_to_income_pct
FROM credit
GROUP BY loan_income_band
ORDER BY MIN(loan_percent_income);

-- Employment length
SELECT
    CASE
        WHEN person_emp_length < 2 THEN 'Under 2 years'
        WHEN person_emp_length < 5 THEN '2-4 years'
        WHEN person_emp_length < 10 THEN '5-9 years'
        ELSE '10+ years'
    END AS employment_band,
    COUNT(*) AS total_loans,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct
FROM credit
GROUP BY employment_band
ORDER BY MIN(person_emp_length);

--  Age bands
SELECT
    CASE
        WHEN person_age < 25 THEN 'Under 25'
        WHEN person_age < 35 THEN '25-34'
        WHEN person_age < 45 THEN '35-44'
        WHEN person_age < 55 THEN '45-54'
        ELSE '55+'
    END AS age_band,
    COUNT(*) AS total_loans,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct
FROM credit
GROUP BY age_band
ORDER BY MIN(person_age);

--  Credit history length
SELECT
    CASE
        WHEN cb_person_cred_hist_length < 5 THEN 'Under 5 years'
        WHEN cb_person_cred_hist_length < 10 THEN '5-9 years'
        WHEN cb_person_cred_hist_length < 15 THEN '10-14 years'
        ELSE '15+ years'
    END AS credit_history_band,
    COUNT(*) AS total_loans,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct
FROM credit
GROUP BY credit_history_band
ORDER BY MIN(cb_person_cred_hist_length);

-- Interest-rate bands
SELECT
    CASE
        WHEN loan_int_rate < 8 THEN 'Below 8%'
        WHEN loan_int_rate < 12 THEN '8%-11.99%'
        WHEN loan_int_rate < 16 THEN '12%-15.99%'
        ELSE '16%+'
    END AS interest_rate_band,
    COUNT(*) AS total_loans,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount
FROM credit
GROUP BY interest_rate_band
ORDER BY MIN(loan_int_rate);

--  Loan amount bands
SELECT
    CASE
        WHEN loan_amnt < 5000 THEN 'Under 5K'
        WHEN loan_amnt < 10000 THEN '5K-9,999'
        WHEN loan_amnt < 20000 THEN '10K-19,999'
        ELSE '20K+'
    END AS loan_amount_band,
    COUNT(*) AS total_loans,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct,
    ROUND(SUM(loan_amnt), 2) AS total_loan_amount
FROM credit
GROUP BY loan_amount_band
ORDER BY MIN(loan_amnt);

--  Risk exposure by loan grade and purpose
SELECT
    loan_grade,
    loan_intent,
    COUNT(*) AS total_loans,
    SUM(loan_status = 1) AS defaulted_loans,
    ROUND(SUM(loan_amnt), 2) AS total_loan_amount,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct
FROM credit
GROUP BY loan_grade, loan_intent
HAVING COUNT(*) >= 50
ORDER BY default_rate_pct DESC, total_loan_amount DESC;

--  Compare loan volume vs default rate by grade
SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM credit), 2) AS portfolio_share_pct,
    ROUND(SUM(loan_amnt), 2) AS total_loan_amount,
    ROUND(100.0 * AVG(loan_status), 2) AS default_rate_pct
FROM credit
GROUP BY loan_grade
ORDER BY total_loan_amount DESC;

SELECT COUNT(*) AS total_rows FROM credit;
SELECT
    SUM(person_age IS NULL) AS missing_age,
    SUM(person_income IS NULL) AS missing_income,
    SUM(person_emp_length IS NULL) AS missing_employment_length,
    SUM(loan_int_rate IS NULL) AS missing_interest_rate,
    SUM(loan_status IS NULL) AS missing_loan_status
FROM credit;

