/* 
Label new column as follows based on job_location:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as  'Local'
- Otherwise 'Onsite'
*/;

SELECT
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
GROUP BY location_category;

-- Practice problem
SELECT
    --COUNT(job_id) as number_of_job_postings,
    salary_year_avg,
    CASE
        WHEN salary_year_avg < 50000 THEN 'Low'
        WHEN salary_year_avg < 100000 THEN 'Standard'
        WHEN salary_year_avg > 100000 THEN 'High'
    END AS Salary_Bukets
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND (salary_year_avg IS NOT NULL)
GROUP BY salary_year_avg
ORDER BY salary_year_avg DESC;


