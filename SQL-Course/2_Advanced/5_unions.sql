SELECT *
FROM january_jobs

UNION

SELECT *
FROM february_jobs

UNION

SELECT *
FROM march_jobs;


select
    company_id,
    job_title_short,
    job_location
from
    january_jobs

UNION ALL

select
    company_id,
    job_title_short,
    job_location
from
    february_jobs

UNION ALL

select
    company_id,
    job_title_short,
    job_location
from
    march_jobs;



SELECT 
    skills,
    type
FROM 
    skills_dim;

WITH skills_job_q1 AS (
    SELECT 
        skill_id,
        COUNT(skills_job_dim.job_id) AS tjps
    FROM skills_job_dim
    INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 1
    GROUP BY skill_id
)

SELECT
    skills_job_q1.skill_id,
    skills,
    type,
    skills_job_q1.tjps
FROM skills_dim
LEFT JOIN skills_job_q1 ON skills_dim.skill_id = skills_job_q1.skill_id;

--UNION

WITH skills_salary_q1 AS (
    SELECT 
        skill_id,
        COUNT(skills_job_dim.job_id) AS tjps
    FROM skills_job_dim
    INNER JOIN job_postings_fact ON skills_job_dim.job_id = job_postings_fact.job_id
    WHERE 
        EXTRACT(QUARTER FROM job_postings_fact.job_posted_date) = 1 AND
        job_postings_fact.salary_year_avg > 70000
    GROUP BY skill_id
)

SELECT
    skills_salary_q1.skill_id,
    skills,
    type,
    skills_salary_q1.tjps
FROM skills_dim
LEFT JOIN skills_salary_q1 ON skills_dim.skill_id = skills_salary_q1.skill_id;




---------------
SELECT 
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.salary_year_avg,
    quarter1_job_postings.job_posted_date::DATE
FROM(
    SELECT *
    FROM january_jobs
    UNION
    SELECT *
    FROM february_jobs
    UNION
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings
WHERE 
    quarter1_job_postings.salary_year_avg > 70000 AND
    quarter1_job_postings.job_title_short = 'Data Analyst'
ORDER BY quarter1_job_postings.salary_year_avg DESC;