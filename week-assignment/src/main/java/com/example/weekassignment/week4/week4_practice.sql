CREATE DATABASE mydatabase;

USE mydatabase;

CREATE TABLE Users (
    id VARCHAR(10) PRIMARY KEY,
    name VARCHAR(10) NOT NULL
);

INSERT INTO Users (id, name) VALUES ('user1', 'Kim');
INSERT INTO Users (id, name) VALUES ('user2', 'Lee');
INSERT INTO Users (id, name) VALUES ('user3', 'Park');

SELECT * FROM Users WHERE id = 'user2';

UPDATE Users
SET name = 'Robert'
WHERE id = 'user2';
SELECT * FROM Users;

DELETE FROM Users
WHERE id = 'user3';
SELECT * FROM Users;

