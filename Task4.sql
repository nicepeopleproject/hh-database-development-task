SELECT to_char(month,'YYYY-MM') as "month_with_max_vacancies_published"
from (SELECT DATE_TRUNC('month', created_date) as month,
             COUNT(vacancy_id)                 AS count
      FROM vacancies
      GROUP BY DATE_TRUNC('month', created_date)
      order by count DESC) as month_stat
LIMIT 1;

SELECT to_char(month,'YYYY-MM') as "month_with_max_resumes_published"
from (SELECT DATE_TRUNC('month', created_date) as month,
             COUNT(resume_id)                  AS count
      FROM resumes
      GROUP BY DATE_TRUNC('month', created_date)
      order by count DESC) as month_stat
LIMIT 1;