CREATE DATABASE pdiddyvotes;

\c pdiddyvotes

CREATE TABLE votes (id SERIAL PRIMARY KEY, name VARCHAR(255), pparty VARCHAR(255), getNews VARCHAR(255), firstTime BOOLEAN);
