--delete later
SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    job_title,
    name AS company_name,
    job_location,
    job_schedule_type,
    job_posted_date 
FROM job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst' AND 
        job_location = 'Anywhere' AND 
        salary_year_avg IS NOT NULL 
ORDER BY salary_year_avg DESC

LIMIT 10