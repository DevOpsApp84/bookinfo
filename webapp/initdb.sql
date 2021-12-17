CREATE DATABASE sample;
CREATE TABLE userinfo (
	id SERIAL PRIMARY KEY,
	Age INT,
	Email TEXT UNIQUE NOT NULL,
	Firstname TEXT,
	Lastname TEXT
);
INSERT INTO userinfo (Age, Email, Firstname, Lastname) VALUES
(20,'test1@example.com','Mario','Bross'),
(23,'test2@example.com','Lugi','Fider');
