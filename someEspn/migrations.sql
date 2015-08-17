CREATE DATABASE sportstats;

\c sportstats

CREATE TABLE stats (id SERIAL PRIMARY KEY, league VARCHAR(255), team VARCHAR(255), score INTEGER);
