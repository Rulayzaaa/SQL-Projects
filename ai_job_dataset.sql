Create database Global_AI_Job_2025;
select * from ai_job_dataset;
/* 1.	Top Job Titles Analysis
What are the top 10 most frequently posted AI job titles in the dataset?*/
SELECT job_title, count(*) as count
FROM ai_job_dataset
WHERE job_title LIKE '%AI%'
GROUP BY job_title
ORDER BY count Desc
LIMIT 10;

/*2.	Salary Comparison by Education
What is the average salary in USD for each education level (Bachelor, Master, PhD, etc.)?*/
Select education_required, avg(salary_usd) as Avg_salary
from ai_job_dataset group by education_required
order by Avg_salary desc;

/* 3.	Remote Work Insights
What percentage of jobs are fully remote (i.e., remote_ratio = 100) across different industries?*/
SELECT 
  industry,
  COUNT(CASE WHEN remote_ratio = 100 THEN 1 END) * 100.0 / COUNT(*) AS remote_percentage
FROM ai_job_dataset
GROUP BY industry
ORDER BY remote_percentage DESC;

/* Skill Demand Check
Identify the most common 10 required skills across all job postings. Which skills appear most frequently?*/
SELECT required_skills, COUNT(*) AS frequency
FROM ai_job_dataset
GROUP BY required_skills
ORDER BY frequency DESC
LIMIT 10;

/* 5.	Company Size vs. Salary
Compare the average salaries offered by companies of different sizes (S, M, L). Which size category offers the highest average salary?*/
SELECT company_size, Avg(salary_usd) AS average_salary
FROM ai_job_dataset
GROUP BY company_size
ORDER BY average_salary desc;



