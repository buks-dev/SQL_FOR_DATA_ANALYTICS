SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
);

-- Other ways of creating a temporary table
--- CTE's ---
WITH january_jobs AS (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT *
FROM january_jobs;

SELECT
    company_id,
    name as company_name
FROM company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
    ORDER BY company_id ASC
);


/*
Find the companies that have the most job openings. 
- Get the total number of job postings per company id (job_posting_fact)
- Return the total number of jobs with the company name (company_dim)
*/

WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS job_postings_per_company
    FROM
        job_postings_fact
    GROUP BY company_id
)

SELECT company_dim.name AS Company_name, company_job_count.job_postings_per_company
FROM company_dim
LEFT JOIN company_job_count ON company_dim.company_id = company_job_count.company_id
ORDER BY job_postings_per_company DESC;


-- Practice problem 1
WITH Top_Skill_Count AS (
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim
    GROUP BY skill_id
)

SELECT skills,Top_Skill_Count.skill_count
FROM skills_dim
LEFT JOIN  Top_Skill_Count  on skills_dim.skill_id = Top_Skill_Count.skill_id
ORDER BY skill_count DESC
LIMIT 5;


-- Practice problem 2
WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS job_postings_per_company
    FROM
        job_postings_fact
    GROUP BY company_id
)

SELECT 
    company_dim.name AS Company_name, 
    company_job_count.job_postings_per_company,
    CASE
        WHEN company_job_count.job_postings_per_company < 10 THEN 'Small'
        WHEN company_job_count.job_postings_per_company BETWEEN 10 AND 50 THEN 'Medium'
        WHEN company_job_count.job_postings_per_company > 50 THEN 'Large'   
    END AS company_category
FROM 
    company_dim
LEFT JOIN company_job_count ON company_dim.company_id = company_job_count.company_id
ORDER BY 
    job_postings_per_company DESC
;

/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include skill ID, name, and count of postings requiring the skill
*/

WITH remote_jobs_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS job_postings_per_skill
    FROM
        skills_job_dim AS sjd
    INNER JOIN job_postings_fact ON job_postings_fact.job_id = sjd.job_id
    WHERE 
        job_postings_fact.job_work_from_home = TRUE AND 
        job_postings_fact.job_title_short = 'Data Analyst'
    GROUP BY skill_id
)

SELECT 
    sd.skill_id,
    sd.skills AS Skill_name,
    rjs.job_postings_per_skill AS jobs_per_skill
FROM 
    remote_jobs_skills  AS rjs
INNER JOIN  skills_dim as sd ON rjs.skill_id = sd.skill_id
ORDER BY jobs_per_skill DESC
LIMIT 5;


--

