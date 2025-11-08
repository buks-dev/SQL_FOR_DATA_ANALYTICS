/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/;

WITH top_paying_jobs AS 
(
    SELECT
        job_id,
        job_title,
        cd.name AS company_name,
        job_schedule_type,
        salary_year_avg
    FROM
        job_postings_fact
    LEFT JOIN company_dim AS cd ON job_postings_fact.company_id = cd.company_id
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills_dim.skills
FROM  top_paying_jobs
INNER JOIN  skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;




/*
Here's the breakdown of the most demanded skills for data analysts in 2023, based on job postings:
SQL is leading with a bold count of 8.
Python follows closely with a bold count of 7.
Tableau is also highly sought after, with a bold count of 6.
Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.
*/;
[
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000",
    "skills": "sql"
  },
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000",
    "skills": "crystal"
  },
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000",
    "skills": "oracle"
  },
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000",
    "skills": "tableau"
  },
  {
    "job_id": 101959,
    "job_title": "Data Analyst (Hybrid/Remote)",
    "company_name": "Uclahealthcareers",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "217000",
    "skills": "flow"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000",
    "skills": "python"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000",
    "skills": "r"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000",
    "skills": "sql"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000",
    "skills": "git"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000",
    "skills": "bitbucket"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000",
    "skills": "atlassian"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000",
    "skills": "jira"
  },
  {
    "job_id": 47609,
    "job_title": "Principal Data Analyst, AV Performance Analysis",
    "company_name": "Motional",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "189000",
    "skills": "confluence"
  },
  {
    "job_id": 10112,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000",
    "skills": "python"
  },
  {
    "job_id": 10112,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000",
    "skills": "sql"
  },
  {
    "job_id": 10112,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000",
    "skills": "databricks"
  },
  {
    "job_id": 10112,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000",
    "skills": "azure"
  },
  {
    "job_id": 10112,
    "job_title": "Azure Data Python Consultant - contract to HIRE - Citizen or Perm...",
    "company_name": "Kelly Science, Engineering, Technology & Telecom",
    "job_schedule_type": "Contractor",
    "salary_year_avg": "170000",
    "skills": "power bi"
  },
  {
    "job_id": 12388,
    "job_title": "Principal Data Analyst",
    "company_name": "Realtime Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160000",
    "skills": "snowflake"
  },
  {
    "job_id": 12388,
    "job_title": "Principal Data Analyst",
    "company_name": "Realtime Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160000",
    "skills": "power bi"
  },
  {
    "job_id": 12388,
    "job_title": "Principal Data Analyst",
    "company_name": "Realtime Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160000",
    "skills": "looker"
  },
  {
    "job_id": 87959,
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "company_name": "Robert Half",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160000",
    "skills": "sql"
  },
  {
    "job_id": 87959,
    "job_title": "SQL DEVELOPER / DATA ANALYST (Insurance industry Experience) ...",
    "company_name": "Robert Half",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "160000",
    "skills": "java"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "python"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "sql"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "scala"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "java"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "c++"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "redshift"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "snowflake"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "spark"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "airflow"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "hadoop"
  },
  {
    "job_id": 9985,
    "job_title": "Lead Data Analyst",
    "company_name": "Motion Recruitment",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "155000",
    "skills": "tableau"
  },
  {
    "job_id": 36613,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "company_name": "Zscaler",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625",
    "skills": "sql"
  },
  {
    "job_id": 36613,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "company_name": "Zscaler",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625",
    "skills": "hadoop"
  },
  {
    "job_id": 36613,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "company_name": "Zscaler",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625",
    "skills": "excel"
  },
  {
    "job_id": 36613,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "company_name": "Zscaler",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625",
    "skills": "tableau"
  },
  {
    "job_id": 36613,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "company_name": "Zscaler",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625",
    "skills": "looker"
  },
  {
    "job_id": 77064,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "company_name": "Zscaler",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625",
    "skills": "sql"
  },
  {
    "job_id": 77064,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "company_name": "Zscaler",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625",
    "skills": "hadoop"
  },
  {
    "job_id": 77064,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "company_name": "Zscaler",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625",
    "skills": "excel"
  },
  {
    "job_id": 77064,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "company_name": "Zscaler",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625",
    "skills": "tableau"
  },
  {
    "job_id": 77064,
    "job_title": "Staff Business Data Analyst (Remote U.S. OK)",
    "company_name": "Zscaler",
    "job_schedule_type": "Full-time",
    "salary_year_avg": "152625",
    "skills": "looker"
  }
]

;