create DATABASE networking;

create table users (
    id SERIAL PRIMARY KEY,
    email VARCHAR(500),
    password_digest VARCHAR(500)
);

CREATE TABLE profiles (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(500),
    surname VARCHAR(500),
    email VARCHAR(500),
    phone INTEGER,
    position VARCHAR(500),
    industry VARCHAR(500),
    company_address VARCHAR(500),
    bio text,
    organisation VARCHAR(500),
    organisation_bio text,
    profile_picture text,
    logo TEXT,
    password_digest VARCHAR(500),
    permission VARCHAR(500)
);

create table jobs (
    id SERIAL PRIMARY KEY,
    logo text,
    organisation VARCHAR(500),
    job_title VARCHAR(500),
    job_description text,
    salary INTEGER,
    your_name VARCHAR(500),
    email VARCHAR(500),
    phone INTEGER,
    profile_id INTEGER
);

create table job_applications (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(500),
    surname VARCHAR(500),
    email VARCHAR(500),
    phone INTEGER,
    linkedin_link text,
    resume text,
    profile_id INTEGER,
    job_id INTEGER
);

create table member_offers (
    id SERIAL PRIMARY KEY,
    image TEXT,
    offer_title VARCHAR(500),
    offer text,
    your_name VARCHAR(500),
    email VARCHAR(500),
    phone INTEGER,
    profile_id INTEGER
);

create table tenders (
    id SERIAL PRIMARY KEY,
    logo text,
    organisation VARCHAR(500),
    tender_title VARCHAR(500),
    tender_description text,
    budget INTEGER,
    time_frame VARCHAR(500),
    your_name VARCHAR(500),
    email VARCHAR(500),
    phone INTEGER,
    profile_id INTEGER
);

create table tender_applications (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(500),
    surname VARCHAR(500),
    organisation VARCHAR(500),
    tender_application TEXT,
    quote INTEGER,
    time_frame VARCHAR(500),
    email VARCHAR(500),
    phone INTEGER,
    profile_id INTEGER,
    tender_id INTEGER
);