/* Question: What are the top skills based on salary?
-Look at the average salary associated with each skill for data Analyst position
-Focus on roles with specified salaries, regardless of location
-why? It reveals how different skills impact salary levels for Data Analyst and
helps identifying the most rewarding skills to acquire or improve
*/

SELECT 
    skills,
  ROUND(AVG(salary_year_avg),0 )AS average_salary

FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND
        job_postings_fact.job_work_from_home = TRUE
GROUP BY skills
ORDER BY average_salary DESC
LIMIT 26
/* Top Insights from the Highest-Paying Data Analyst Skills
Big Data & ML Tools Pay Best: Skills like PySpark, Databricks, Datarobot, and scikit-learn top the salary list, showing high demand for machine learning and big data expertise.

DevOps & Cloud Skills Are Highly Valued: Tools such as GitLab, Bitbucket, Kubernetes, and GCP suggest that analysts who understand deployment and cloud environments earn more.

Programming & Specialized Tech Boost Salaries: Knowledge of languages like Scala, Go, Swift, and niche tools like Watson or Couchbase correlate with the highest salaries, likely due to lower supply and high specialization.

*/