SELECT freq_stat.vacancy_id, position_name, frequency
FROM (SELECT COUNT(*) as frequency, vacancy_id
      FROM (SELECT vacancies.vacancy_id
            FROM vacancies
                     INNER JOIN vacancy_responses vr on vacancies.vacancy_id = vr.vacancy_id
            WHERE to_char(response_time - created_date, 'DD')::int < 7
              and to_char(response_time - created_date, 'DD'):: int >= 0) as tmp
      group by vacancy_id) as freq_stat
         INNER JOIN vacancies vs on freq_stat.vacancy_id = vs.vacancy_id
WHERE frequency >= 5;