CREATE DATABASE restfulcats;

\c restfulscats

CREATE TABLE cats (id SERIAL PRIMARY KEY, name VARCHAR(255), breed VARCHAR(255));
