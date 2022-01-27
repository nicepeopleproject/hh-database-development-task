CREATE TYPE sex as ENUM ('male', 'female');
CREATE TYPE education_level as ENUM ('secondary', 'secondary_special', 'incomplete_higher', 'higher', 'bachelor',
    'master', 'candidate_of_science', 'doctor_of_science');
CREATE type country AS ENUM ('Россия', 'Латвия', 'Польша', 'Беларусь');
CREATE type language_type as ENUM ('Русский', 'Латышский', 'Английский', 'Польский', 'Белорусский');
CREATE type language_level as ENUM ('A1 - Начальный', 'A2 - Элементарный', 'B1 - Средний','B2 - Средне-продвинутый','C1 - Продвинутый','C2 - В совершенстве');
CREATE TYPE employment_type AS ENUM ('Полная занятость','Частичная занятость', 'Проектная работа','Волонтерство', 'Стажировка');
CREATE TYPE work_schedule AS ENUM ('Полный день', 'Сменный график', 'Гибкий график', 'Удаленная работа', 'Вахтовый метод');
CREATE type removal_type AS ENUM ('Невозможен','Возможен','Желателен');
CREATE type driver_license_category AS ENUM ('A','B','C','D','E','BE','CE','DE','Tm','Tb');
CREATE type subway_station AS ENUM ('Бауманская');
CREATE type currency AS ENUM ('руб.', 'EUR','USD');
CREATE TYPE industry AS ENUM ('Автомобильный бизнес', 'Нефть и газ', 'ЖКХ');
CREATE TYPE work_experience AS ENUM ('Не имеет значения', 'От 1 года до 3 лет', 'От 3 до 6 лет', 'Нет опыта', 'Более 6 лет');

CREATE TABLE areas
(
    area_id   serial primary key,
    area_name text not null
);

CREATE TABLE account
(
    account_id           bigserial primary key,
    account_name         text not null,
    account_surname      text not null,
    account_patronymic   text not null,
    account_email        text not null,
    account_phone_number text
);

CREATE TABLE resumes
(
    resume_id               bigserial primary key,
    account_id              bigint          not null references account (account_id),
    position_name           text            not null,
    contact_name            text            not null,
    contact_surname         text            not null,
    is_closed               boolean,
    sex                     sex,
    date_of_birth           date,
    area_id                 integer references areas (area_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT,
    citizenship             country,
    has_work_experience     boolean,
    reasons_of_lack_we      text,
    compensation_currency   currency,
    compensation            integer,
    education_level         education_level not null,
    self_description        text,
    native_language         language_type   not null,
    removal                 removal_type,
    driver_license_category driver_license_category,
    own_car                 boolean,
    subway_station          subway_station,
    created_date            date            not null,
    latest_update_date      date            not null
);

CREATE TABLE key_skills
(
    key_skill_id   serial primary key,
    key_skill_name text NOT NULL,
    CONSTRAINT key_skills_name_key UNIQUE (key_skill_name)
);

CREATE TABLE resume_other_languages
(
    resume_id      bigint         not null references resumes (resume_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    language       language_type  not null,
    language_level language_level not null
);

CREATE TABLE resume_key_skills
(
    resume_id    bigint NOT NULL references resumes (resume_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    key_skill_id int    NOT NULL references key_skills (key_skill_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE resume_available_work_permits
(
    resume_id bigint  NOT NULL references resumes (resume_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    country   country NOT NULL
);

CREATE TABLE resume_suitable_employment_types
(
    resume_id          bigint          NOT NULL references resumes (resume_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    employment_type employment_type NOT NULL
);

CREATE TABLE resume_suitable_work_schedules
(
    resume_id     bigint        NOT NULL references resumes (resume_id) MATCH FULL on UPDATE CASCADE ON DELETE CASCADE,
    work_schedule work_schedule NOT NULL
);

CREATE TABLE resume_educations
(
    resume_id                    bigint not null references resumes (resume_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    educational_institution_name text   not null,
    faculty                      text,
    specialization               text,
    year_of_graduation           text   not null
);

CREATE TABLE resume_work_experiences
(
    resume_id               bigint not null references resumes (resume_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    organisation_name       text   not null,
    start_date              date   not null,
    end_date                date,
    job_position            text   not null,
    work_duties_description text
);
CREATE TABLE specializations
(
    specialization_id   serial primary key,
    specialization_name text     not null,
    industry            industry not null
);

CREATE TABLE resume_suitable_specializations
(
    resume_id         bigint not null references resumes (resume_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    specialization_id int    not null references specializations (specialization_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE organizations
(
    organization_id          bigserial primary key,
    organization_name        character varying not null,
    organization_description character varying not null
);

CREATE TABLE vacancies
(
    vacancy_id                       bigserial primary key,
    organization_id                  bigint references organizations (organization_id) MATCH FULL ON UPDATE CASCADE ON DELETE RESTRICT,
    position_name                    text            not null,
    is_closed                        boolean,
    area_id                          int             not null,
    specialization_id                int             not null,
    minimal_required_work_experience work_experience not null,
    compensation_currency            currency,
    compensation_from                integer,
    compensation_to                  integer,
    compensation_gross               boolean,
    native_language                  language_type   not null,
    subway_station                   subway_station,
    driver_license_category          driver_license_category,
    own_car                          bool,
    removal                          removal_type,
    minimal_required_education_level education_level,
    created_date                     date            not null,
    latest_update_date               date            not null
);



CREATE TABLE vacancy_key_skills
(
    vacancy_id   bigint  not null references vacancies (vacancy_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    key_skill_id integer not null references key_skills (key_skill_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE vacancy_other_languages
(
    vacancy_id     bigint         not null references vacancies (vacancy_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    language       language_type  not null,
    language_level language_level not null
);

CREATE TABLE vacancy_required_work_permits
(
    vacancy_id bigint  not null references vacancies (vacancy_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    country    country not null
);

CREATE TABLE vacancy_suitable_work_schedules
(
    vacancy_id    bigint        not null references vacancies (vacancy_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    work_schedule work_schedule not null
);
CREATE TABLE vacancy_suitable_employment_types
(
    vacancy_id      bigint          not null references vacancies (vacancy_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    employment_type employment_type not null
);

CREATE TABLE vacancy_required_citizenship
(
    vacancy_id  bigint  not null references vacancies (vacancy_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    citizenship country not null
);


CREATE TABLE vacancy_responses
(
    vacancy_id    bigint                      not null references vacancies (vacancy_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    resume_id     bigint                      not null references resumes (resume_id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE,
    response_time timestamp without time zone not null
);