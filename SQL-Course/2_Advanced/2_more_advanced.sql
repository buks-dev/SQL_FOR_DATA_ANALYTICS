select *
from job_postings_fact;

SELECT 
    '2023-02-19'::DATE,
    '123'::INTEGER,
    'TRUE'::BOOLEAN,
    '3.14'::REAL;

select
    job_title_short as title,
    job_location as location,
    job_posted_date::DATE as Date
from 
    job_postings_fact
    LIMIT 5;

select
    job_title_short as title,
    job_location as location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' as Date_Time,
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month
from 
    job_postings_fact
LIMIT 5;

select
    count(job_id) as number_of_job_postings,
    --job_title_short as title,
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month
from 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY job_posted_month
ORDER BY number_of_job_postings DESC;



-- Problem 1
SELECT DISTINCT   
    job_schedule_type,
    AVG(salary_year_avg) AS Avg_Yearly_Salary,
    AVG(salary_hour_avg) AS Avg_Hourly_Salary
FROM 
    job_postings_fact
WHERE 
    job_posted_date > '2023-06-01'
    AND (salary_year_avg IS NOT NULL OR salary_hour_avg IS NOT NULL)
GROUP BY job_schedule_type
ORDER BY job_schedule_type ASC;


-- Problem 2
select
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS job_posted_month,
    COUNT(*) AS job_posted_count
from 
    job_postings_fact
WHERE
    EXTRACT(YEAR FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST') = 2023
GROUP BY 
    job_posted_month
ORDER BY 
    job_posted_month ASC;


-- Problem 3
SELECT DISTINCT
    cmp.name AS company_name,
    COUNT(*) AS num_jobs_with_health_insurance
FROM
    job_postings_fact AS jp
LEFT JOIN company_dim AS cmp ON jp.company_id = cmp.company_id 
WHERE
    jp.job_health_insurance = TRUE AND
   --job_postings_fact.job_posted_date BETWEEN '2023-04-01' AND '2023-06-30'
    EXTRACT(QUARTER FROM jp.job_posted_date) = 2 AND
    EXTRACT(YEAR FROM jp.job_posted_date) = 2023
GROUP BY cmp.name
HAVING COUNT(*) > 0
ORDER BY num_jobs_with_health_insurance DESC;



-- Advanced Practice problem 6
--January
CREATE TABLE january_jobs AS 
    SELECT *
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

--February
CREATE TABLE february_jobs AS 
    SELECT *
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

--March
CREATE TABLE march_jobs AS 
    SELECT *
    FROM job_postings_fact 
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;


SELECT *
FROM march_jobs;


