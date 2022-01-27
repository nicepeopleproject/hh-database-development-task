with test_data(area_id, area_name) as (
    SELECT generate_series(1, 1000) as id, md5(random()::text) as area_name
)
INSERT
INTO areas(area_id, area_name)
SELECT area_id, area_name
FROM test_data;


with test_data(account_id, some_text) as (
    SELECT generate_series(1, 50000) as account_id, md5(random()::text) as some_text
)
INSERT
INTO account(account_id, account_name, account_surname, account_patronymic, account_email, account_phone_number)
SELECT account_id, some_text, some_text, some_text, some_text, some_text
FROM test_data;



with test_data(resume_id, account_id, area_id, some_text, random_data, random_bool, salary) as (
    SELECT generate_series(1, 100000)                     as resume_id,
           random() * 49999::int + 1                      as account_id,
           random() * 999::int + 1                        as area_id,
           md5(random()::text)                            as some_text,
           date(now() - random() * '1000 days'::interval) as random_date,
           random() > 0.5                                 as random_bool,
           random() * 1000000::int                        as salary
)
INSERT
INTO resumes(resume_id, account_id, position_name, contact_name, contact_surname,
             is_closed, sex, date_of_birth, area_id, citizenship, has_work_experience,
             reasons_of_lack_we, compensation_currency, compensation, education_level,
             self_description, native_language, removal, driver_license_category, own_car, subway_station,
             created_date, latest_update_date)
SELECT resume_id,
       account_id,
       some_text,
       some_text,
       some_text,
       random_bool,
       'female',
       random_data,
       area_id,
       'Россия',
       random_bool,
       some_text,
       'руб.',
       salary,
       'secondary',
       some_text,
       'Русский',
       'Невозможен',
       'D',
       random_bool,
       'Бауманская',
       random_data,
       random_data
FROM test_data;

with test_data(specialization_id, some_text) as (
    SELECT generate_series(1, 50) as account_id, md5(random()::text) as some_text
)
INSERT
INTO specializations(specialization_id, specialization_name, industry)
SELECT specialization_id, some_text, 'ЖКХ'
FROM test_data;

with test_data(organization_id, some_text) as (
    SELECT generate_series(1, 2000) as account_id, md5(random()::text) as some_text
)
INSERT
INTO organizations(organization_id, organization_name, organization_description)
SELECT organization_id, some_text, some_text
FROM test_data;


with test_data(vacancy_id, organization_id, area_id, specialization_id, some_text, random_data, random_bool,
               salary_from, salary_to_diff)
         as (
        SELECT generate_series(1, 10000)                      as vacancy_id,
               random() * 1999::int + 1                       as organization_id,
               random() * 999::int + 1                        as area_id,
               random() * 49::int + 1                         as specialization_id,
               md5(random()::text)                            as some_text,
               date(now() - random() * '1000 days'::interval) as random_date,
               random() > 0.5                                 as random_bool,
               random() * 1000000::int                        as salary_from,
               random() * 200000::int                         as salary_to_diff
    )
INSERT
INTO vacancies(vacancy_id, organization_id, position_name, is_closed, area_id,
               specialization_id, minimal_required_work_experience, compensation_currency,
               compensation_from, compensation_to, compensation_gross, native_language, subway_station,
               driver_license_category, own_car, removal, minimal_required_education_level, created_date,
               latest_update_date)
SELECT vacancy_id,
       organization_id,
       some_text,
       random_bool,
       area_id,
       specialization_id,
       'Не имеет значения',
       'руб.',
       salary_from,
       salary_from + salary_to_diff,
       random_bool,
       'Русский',
       'Бауманская',
       'B',
       random_bool,
       'Возможен',
       'secondary',
       random_data,
       random_data
FROM test_data;

with test_data(count, vacancy_id, resume_id, response_time) as (
    SELECT generate_series(1, 300000)               as count,
           random() * 9999::int + 1                 as vacancy_id,
           random() * 99999::int + 1                as resume_id,
           now() - random() * '1000 days'::interval as response_time
)
INSERT
INTO vacancy_responses(vacancy_id, resume_id, response_time)
SELECT vacancy_id, resume_id, response_time
FROM test_data;

with test_data(resume_id, specialization_id) as (
    SELECT generate_series(1, 100000) as resume_id,
           random() * 49::int + 1     as specialization_id
)
INSERT
INTO resume_suitable_specializations(resume_id, specialization_id)
SELECT resume_id, specialization_id
FROM test_data;

with test_data(resume_id, specialization_id) as (
    SELECT generate_series(1, 100000) as resume_id,
           random() * 49::int + 1     as specialization_id
)
INSERT
INTO resume_suitable_specializations(resume_id, specialization_id)
SELECT resume_id, specialization_id
FROM test_data;