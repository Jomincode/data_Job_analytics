SELECT

  CASE
    WHEN salary_year_avg > 500000 THEN 'very_high salary'
    WHEN salary_year_avg< 500000 AND salary_year_avg >=200000 THEN 'high_salary'
    WHEN salary_year_avg < 200000 AND salary_year_avg >= 10000 THEN 'low salary'
    ELSE 'not relevat'
END AS salary_bucket,
COUNT(job_id) AS number_of_jobs
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY salary_bucket, job_title_short
ORDER BY number_of_jobs;
