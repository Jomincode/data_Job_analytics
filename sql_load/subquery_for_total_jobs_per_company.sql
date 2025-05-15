WITH skill_to_job AS (
    SELECT
        skill_id,
        COUNT(*) as skill_count
    FROM skills_job_dim
    GROUP BY skill_id
)
SELECT 
    skills_dim.skills,
    skill_to_job.skill_count
    FROM skills_dim
LEFT JOIN skill_to_job on skill_to_job.skill_id = skills_dim.skill_id
    ORDER BY skill_count DESC
    LIMIT 5;
