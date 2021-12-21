CREATE DATABASE sample;
CREATE TABLE info (
	id SERIAL PRIMARY KEY,
	Age INT,
	Email TEXT UNIQUE NOT NULL,
	Firstname TEXT,
	Lastname TEXT
);
INSERT INTO info (Age, Email, Firstname, Lastname) VALUES
(20,'test1@example.com','Mario','Bross'),
(23,'test2@example.com','Angela','Haski'),
(40,'test3@example.com','Andrew','Soul'),
(21,'test4@example.com','Mico','Hikik'),
(51,'test5@example.com','Angel','Sadin'),
(70,'test6@example.com','Mark','Austin'),
(32,'test7@example.com','Sophie','Deny'),
(45,'test8@example.com','Sarah','Fiderst');

