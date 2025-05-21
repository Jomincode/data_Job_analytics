/*Find the count of trhe number of remote job postings per skill
-Display the top 5 skills by their demand in remote jobs
- Include skill ID name and count of the job posting oer skill
*/
WITH remote_job_skills AS (
SELECT 
skill_id,
COUNT(*) AS skill_count

--job_postings_fact.job_location

FROM skills_job_dim
--INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
INNER JOIN job_postings_fact ON job_postings_fact.job_id = skills_job_dim.job_id
WHERE job_postings_fact.job_work_from_home = TRUE AND
      job_postings_fact.job_title_short = 'Data Analyst'
GROUP BY skill_id
)
SELECT
skills_dim.skill_id,
skills AS skill_name,
skill_count
FROM remote_job_skills
INNER JOIN skills_dim ON skills_dim.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5