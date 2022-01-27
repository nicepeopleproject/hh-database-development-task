Комментарии по индексам:
Чтобы быстро получить резюме, которые относятся к пользователю.
CREATE INDEX resume_account_id_index ON resumes (account_id); 
Чтобы можно было быстрой найти резюме с одинаковыми наименованиями, хотя вряд ли будет много точных совпадений, актуально если мы будем предлагать какие-то популярные наименования, а пользователи будут их выбирать
CREATE INDEX resume_position_name_index ON resumes (position_name);
Можно будет оставить резюме из определенных регионов(быстро)
CREATE INDEX resume_area_id_index ON resumes (area_id);
Оставить резюме, которые имеют определенное гражданство(возможно нужна связь 1 ко многим, но насколько часто, тогда надо делать отдельную таблицу)
CREATE INDEX resume_citizenship_index ON resumes (citizenship);
Чтобы можно было быстро отсортировать по зарплатным ожиданиям, тип валюты важен
CREATE INDEX resume_compensation_index ON resumes (compensation_currency, compensation);
Оставить резюме с соответсвующим уровнем образования
CREATE INDEX resume_education_level_index ON resumes (education_level);
Отсавить только носителей некоторого языка, для которых он родной
CREATE INDEX resume_native_language_index ON resumes (native_language);
Отфильтровать по готовности к переезду
CREATE INDEX resume_removal_index ON resumes (removal);
Отфильтровать по имеющейся категории водительских прав
CREATE INDEX resume_driver_license_category_index ON resumes (driver_license_category);
Отфильтровать по начилию собственного авто
CREATE INDEX resume_own_car_index ON resumes (own_car);
Отфильтровать по ближайшему метро, это для меня сомнительный индекс, но я не знаю спрос на запросы
CREATE INDEX resume_subway_station_index ON resumes (subway_station);
Отфильртвоать по статусу актульности резюме
CREATE INDEX resume_is_closed_index ON resumes (is_closed);

Быстро найти резюме с важными для кого-то ключевыми навыками
CREATE INDEX resume_key_skill_id_index ON resume_key_skills (key_skill_id);

Найти людей знающих языки на ожидаемых уровнях, если конечно он говорят правду
CREATE INDEX resume_other_language_index ON resume_other_languages (language, language_level);

Отфильтровать людей имеющих разрешения работать в заданных странах
CREATE INDEX resume_available_work_permit_country_index ON resume_available_work_permits (country);

Отфильтровать людей по ожидаемому типу занятости
CREATE INDEX resume_suitable_employment_type_index ON resume_suitable_employment_types (employment_type);

Отфильтровать людей по ожидаемому графику
CREATE INDEX resume_suitable_work_schedule_index ON resume_suitable_work_schedules (work_schedule);

Отфильтровать людей по месту, где они получали образование
CREATE INDEX resume_educational_institution_name_index ON resume_educations (educational_institution_name);
По месту и полученной специализации(может запрос редкий, не знаю, думаю, что сейчас образование играет меньшую роль чем раньше)
CREATE INDEX resume_educational_institution_name_and_specialization_index ON resume_educations (educational_institution_name, specialization);

Отфильтровать резюме, которые получили опыт работы в определенных компаниях
CREATE INDEX resume_work_experience_organization_name_index ON resume_work_experiences (organisation_name);
+ на определенных позициях
CREATE INDEX resume_work_experience_organization_name_and_job_position_index ON resume_work_experiences (organisation_name, job_position);

Отфильтровать резюме, соискатели которых ожидают работу по определенной специализации
CREATE INDEX resume_suitable_specialization_index ON resume_suitable_specializations (specialization_id);

Получить вакансии организации
CREATE INDEX vacancy_organization_id_index ON vacancies (organization_id);
Получить все вакансии с одинаковыми и похожими наименованиями вакансий
CREATE INDEX vacancy_position_name_index ON vacancies (position_name);
Оставить только актульные вакансии
CREATE INDEX vacancy_is_closed_index ON vacancies (is_closed);
Группировка по специализациям, фильтрация по ним
CREATE INDEX vacancy_specialization_id_index ON vacancies (specialization_id);
Фильтрация по минимальному ожиданию полученного опыта соискателем 
CREATE INDEX vacancy_minimal_required_work_experience_index ON vacancies (minimal_required_work_experience;
Фильтрация по интервалу ожидаемой чистой прибыли
CREATE INDEX vacancy_compensation_index ON vacancies (compensation_currency, compensation_from, compensation_to,compensation_gross);
Фильтрация по требованиям к языку
CREATE INDEX vacancy_native_language_index ON vacancies (native_language);
Фильтрация по ближайшей станции метро
CREATE INDEX vacancy_subway_station_index ON vacancies (subway_station);
Фильтрация по требованиям к категории водительских прав
CREATE INDEX vacancy_driver_license_category_index ON vacancies (driver_license_category);
Фильтрация по требованиям к наличию собтсвенной машины
CREATE INDEX vacancy_own_car_index ON vacancies (own_car);
Фильтрация по требованиям о переезде
CREATE INDEX vacancy_removal_index ON vacancies (removal);
Фильтрация к минимальному уровню образования
CREATE INDEX vacancy_minimal_required_education_level_index ON vacancies (minimal_required_education_level);

Фильтраци(соискателем) по требуемым навыкам
CREATE INDEX vacancy_key_skill_id_index ON vacancy_key_skills (key_skill_id);

Фильтрация по требуемым языкам и уровню их владения
CREATE INDEX vacancy_other_language_index ON vacancy_other_languages (language, language_level);

Фильтрация по требованию к наличию разрешений на работу в разных странах
CREATE INDEX vacancy_required_work_permit_country_index ON vacancy_required_work_permits (country);

Фильтрация по требованию к графику работы
CREATE INDEX vacancy_suitable_work_schedule_index ON vacancy_suitable_work_schedules (work_schedule);

Фильтрация по приемлемому типу занятости
CREATE INDEX vacancy_suitable_employment_type_index ON vacancy_suitable_employment_types (employment_type);

Фильтрация по наличию гражданства
CREATE INDEX vacancy_required_citizenship_country_index ON vacancy_required_work_permits (country);

Поиск всех откликов к вакансии
CREATE INDEX vacancy_response_vacancy_index ON vacancy_responses (vacancy_id);
Поиск всех отправленных и полученных откликов конкретного резюме
CREATE INDEX vacancy_response_resume_index ON vacancy_responses (resume_id);

