CREATE INDEX resume_account_id_index ON resumes (account_id);
CREATE INDEX resume_position_name_index ON resumes (position_name);
CREATE INDEX resume_area_id_index ON resumes (area_id);
CREATE INDEX resume_citizenship_index ON resumes (citizenship);
CREATE INDEX resume_compensation_index ON resumes (compensation_currency, compensation);
CREATE INDEX resume_education_level_index ON resumes (education_level);
CREATE INDEX resume_native_language_index ON resumes (native_language);
CREATE INDEX resume_removal_index ON resumes (removal);
CREATE INDEX resume_driver_license_category_index ON resumes (driver_license_category);
CREATE INDEX resume_own_car_index ON resumes (own_car);
CREATE INDEX resume_subway_station_index ON resumes (subway_station);
CREATE INDEX resume_is_closed_index ON resumes (is_closed);

CREATE INDEX resume_key_skill_id_index ON resume_key_skills (key_skill_id);

CREATE INDEX resume_other_language_index ON resume_other_languages (language, language_level);

CREATE INDEX resume_available_work_permit_country_index ON resume_available_work_permits (country);

CREATE INDEX resume_suitable_employment_type_index ON resume_suitable_employment_types (employment_type);

CREATE INDEX resume_suitable_work_schedule_index ON resume_suitable_work_schedules (work_schedule);

CREATE INDEX resume_educational_institution_name_index ON resume_educations (educational_institution_name);
CREATE INDEX resume_educational_institution_name_and_specialization_index ON resume_educations (educational_institution_name, specialization);

CREATE INDEX resume_work_experience_organization_name_index ON resume_work_experiences (organisation_name);
CREATE INDEX resume_work_experience_organization_name_and_job_position_index ON resume_work_experiences (organisation_name, job_position);

CREATE INDEX resume_suitable_specialization_index ON resume_suitable_specializations (specialization_id);

CREATE INDEX vacancy_organization_id_index ON vacancies (organization_id);
CREATE INDEX vacancy_position_name_index ON vacancies (position_name);
CREATE INDEX vacancy_is_closed_index ON vacancies (is_closed);
CREATE INDEX vacancy_specialization_id_index ON vacancies (specialization_id);
CREATE INDEX vacancy_minimal_required_work_experience_index ON vacancies (minimal_required_work_experience);
CREATE INDEX vacancy_compensation_index ON vacancies (compensation_currency, compensation_from, compensation_to,
                                                      compensation_gross);
CREATE INDEX vacancy_native_language_index ON vacancies (native_language);
CREATE INDEX vacancy_subway_station_index ON vacancies (subway_station);
CREATE INDEX vacancy_driver_license_category_index ON vacancies (driver_license_category);
CREATE INDEX vacancy_own_car_index ON vacancies (own_car);
CREATE INDEX vacancy_removal_index ON vacancies (removal);
CREATE INDEX vacancy_minimal_required_education_level_index ON vacancies (minimal_required_education_level);

CREATE INDEX vacancy_key_skill_id_index ON vacancy_key_skills (key_skill_id);

CREATE INDEX vacancy_other_language_index ON vacancy_other_languages (language, language_level);

CREATE INDEX vacancy_required_work_permit_country_index ON vacancy_required_work_permits (country);

CREATE INDEX vacancy_suitable_work_schedule_index ON vacancy_suitable_work_schedules (work_schedule);

CREATE INDEX vacancy_suitable_employment_type_index ON vacancy_suitable_employment_types (employment_type);

CREATE INDEX vacancy_required_citizenship_country_index ON vacancy_required_work_permits (country);

CREATE INDEX vacancy_response_vacancy_index ON vacancy_responses (vacancy_id);
CREATE INDEX vacancy_response_resume_index ON vacancy_responses (resume_id);