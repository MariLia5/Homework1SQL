CREATE DATABASE Academy;

USE Academy;

CREATE TABLE groups (
id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[name] NVARCHAR (10) NOT NULL UNIQUE,
rating INT NOT NULL,
[year] INT NOT NULL,

CONSTRAINT CHK_groups_name CHECK ([name] NOT LIKE '/\n\n/g'),
CONSTRAINT CHK_groups_rating CHECK (rating >= 0 AND rating <= 5),
CONSTRAINT CHK_groups_year CHECK ([year] >= 1 AND [year] <= 5)
);
GO

CREATE TABLE departments (
id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
financing MONEY NOT NULL DEFAULT (0),
[name] NVARCHAR (100) NOT NULL UNIQUE,

CONSTRAINT CHK_departments_financing CHECK (financing >= 0),
CONSTRAINT CHK_departments_name CHECK ([name] NOT LIKE '/\n\n/g')
);
GO

CREATE TABLE faculties (
id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
[name] NVARCHAR (100) NOT NULL UNIQUE,

CONSTRAINT CHK_faculties_name CHECK ([name] NOT LIKE '/\n\n/g')
);
GO

CREATE TABLE teachers (
id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
employmentdate DATE NOT NULL,
[name] NVARCHAR (MAX) NOT NULL,
premium MONEY NOT NULL DEFAULT(0),
salary MONEY NOT NULL,
surname NVARCHAR (MAX) NOT NULL,

CONSTRAINT CHK_teachers_employmentdate CHECK (employmentdate > '01.01.1990.'),
CONSTRAINT CHK_teachers_premium CHECK (premium >= 0),
CONSTRAINT CHK_teachers_salary CHECK (salary > 0),
CONSTRAINT CHK_teachers_surname CHECK (surname NOT LIKE '/\n\n/g')
);