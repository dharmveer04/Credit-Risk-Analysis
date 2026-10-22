# Credit Risk Analysis \| Python, SQL & Power BI

## Project Overview

This project analyses borrower and loan information to understand
patterns associated with loan defaults. It follows an end-to-end data
analysis workflow: Python for data cleaning and EDA, SQL for business
queries, Power BI for dashboard reporting, and evidence-based
recommendations.

## Business Problem

Loan defaults can create financial risk for lenders. This project
explores: - What is the overall loan default rate? - How does default
rate vary by loan grade and loan purpose? - How do default patterns
differ by homeownership and borrower characteristics? - How do interest
rates vary across risk tiers? - Which segments need further
investigation?

The analysis identifies patterns in the dataset; it does not prove that
any factor causes a borrower to default.

## Tools

-   Python and Pandas
-   Jupyter Notebook
-   SQL / MySQL
-   Power BI

## Workflow

### 1. Python --- Data Cleaning and EDA

-   Loaded and inspected the dataset.
-   Checked data types, missing values, and duplicate records.
-   Reviewed unusual values in selected fields.
-   Handled missing values in selected columns.
-   Explored borrower and loan variables.
-   Exported the cleaned data for SQL and Power BI.

Output: `credit_risk_cleaned.csv`

### 2. SQL --- Business Analysis

SQL queries were used to investigate: - Loan counts and default rates by
loan grade - Default rates by loan purpose - Default patterns across
borrower groups - Loan and interest-rate comparisons across risk
segments - Differences between defaulted and non-defaulted loans

### 3. Power BI --- Dashboard

The report contains two analysis areas.

**Executive Summary** - Total loans - Total loan amount - Defaulted
loans - Overall default rate - Average interest rate - Default-rate
comparisons by loan grade and loan purpose - Defaulted versus
non-defaulted loan distribution

**Borrower and Risk Analysis** - Default rate by income group - Default
rate by homeownership - Default rate by previous default history -
Average interest rate by risk tier - Borrower/risk-segment comparisons

Use these descriptions only where they match the final published
dashboard.

## Selected Findings

The current analysis produced these observations: - Overall default
rate: approximately **21.87%** in the analysed records. - Grade D showed
a default rate of **59.06%**, compared with **9.96%** for Grade A. -
Grade G showed an observed default rate of **98.44%** across **64
loans**. This small segment should be interpreted cautiously. - Debt
consolidation showed a higher observed default rate than education loans
in the dashboard analysis. - Renters showed a higher observed default
rate than homeowners in the dashboard analysis.

These are descriptive findings from this dataset, not guarantees about
future borrowers. Differences between groups do not establish causation,
and small segments may produce less stable rates.

## Recommendations to Investigate

1.  Review higher-default loan grades and validate the patterns with
    additional data.
2.  Examine income, existing debt, repayment history, interest rates,
    and loan purpose together rather than relying on one variable.
3.  Check segment sizes before acting on very high or low default rates.
4.  Use the findings to guide further analysis, not as the sole basis
    for automatically approving or rejecting applicants.

## Repository Structure

Update this section to match the actual files in your GitHub repository.

``` text
Credit-Risk-Analysis/
├── README.md
├── Credit_Risk_Analysis_Pandas_Style.ipynb
├── Credit_Risk_Analysis_SQL.sql
└── credit_risk_cleaned.csv
```

If the dataset or cleaned output is not included, remove those entries
and explain how to obtain or generate the files. Do not commit files
that the dataset licence does not allow you to share.

## How to Reproduce the Analysis

1.  Obtain the dataset from its authorised source.
2.  Open the Python notebook in Jupyter Notebook or JupyterLab.
3.  Run the notebook cells in order and export the cleaned dataset.
4.  Import the cleaned CSV into MySQL and run the SQL script, adapting
    table or column names if required.
5.  Connect Power BI to the cleaned dataset.
6.  Refresh the data and confirm that KPI totals and default rates
    reconcile across Python, SQL, and Power BI.

## Limitations

-   Findings depend on the available dataset and recorded fields.
-   Observed relationships do not prove causation.
-   Results may be affected by missing values, data quality, and segment
    size.
-   This is descriptive analysis, not a validated predictive
    credit-scoring model.
-   Real lending decisions require additional evidence, fairness checks,
    and appropriate validation.

## Skills Demonstrated

-   Data cleaning and quality checks
-   Exploratory data analysis
-   SQL querying for business questions
-   KPI design and dashboard development
-   Segment comparison and interpretation
-   Communicating findings and evidence-based recommendations

## Author

**Dharmveer Patel**

-   GitHub: https://github.com/dharmveer04
-   LinkedIn: https://www.linkedin.com/in/dharmveer-patel-b3188b348/

------------------------------------------------------------------------

*Portfolio project for learning and demonstration. Validate all metrics
against the final dataset and published dashboard before using them in a
resume or interview.*
