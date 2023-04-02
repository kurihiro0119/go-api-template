CREATE DATABASE example_db;
USE example_db;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

INSERT INTO users (name, email, password)
VALUES
    ('Alice', 'alice@example.com', 'password1'),
    ('Bob', 'bob@example.com', 'password2');
