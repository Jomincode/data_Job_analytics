/* What are the most in-demand skills for the data analysts?
-join job postings ti inner join table similar to query 2
-Identify the top 5 in-demand skills for a data analyst
-focus on all job postings
-Why? retrive the top 5 skills with the highest demand in the job market,
 providing insights into the most valuable skills for a job seeker
*/
SELECT 
skills,
COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5