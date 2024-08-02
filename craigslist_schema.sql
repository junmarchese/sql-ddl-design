DROP DATABASE IF EXISTS craigslist_schema;

CREATE DATABASE craigslist_schema;

\c craigslist_schema

CREATE TABLE Regions (
    region_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);


CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    encrypted_password VARCHAR(255) NOT NULL,
    preferred_region_id INT
);

ALTER TABLE Users
    ADD CONSTRAINT fk_users_regions
    FOREIGN KEY (preferred_region_id)
    REFERENCES Regions(region_id);

CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    text TEXT NOT NULL,
    location VARCHAR(255),
    user_id INT REFERENCES Users(user_id),
    region_id INT REFERENCES Regions(region_id),
    category_id INT REFERENCES Categories(category_id)
);

