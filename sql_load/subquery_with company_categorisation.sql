WITH job_posting_count AS (
    SELECT
        company_id,
        COUNT(*) as number_of_job_posting
    FROM job_postings_fact
    GROUP BY company_id
)
SELECT
    company_dim.name AS company_name,
    company_dim.company_id,
    job_posting_count.number_of_job_posting,
CASE
    WHEN number_of_job_posting > 50 THEN 'large'
    WHEN number_of_job_posting <=50 AND number_of_job_posting >= 10 THEN 'medium'
    WHEN number_of_job_posting < 10 THEN 'small'
    ELSE 'not relevent'
    END as compnay_size

    FROM company_dim

LEFT JOIN job_posting_count on job_posting_count.company_id = company_dim.company_id

