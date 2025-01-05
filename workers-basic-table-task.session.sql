CREATE TABLE workers(
  id UUID PRIMARY KEY DEFAULT gen_random_uuid() ,
  full_name VARCHAR(200) NOT NULL CONSTRAINT "full name must be" CHECK (full_name != ''),
  department VARCHAR(100),
  birthday DATE NOT NULL CHECK (birthday > '1890-01-01' AND birthday <= current_date),
  salary NUMERIC(11,2) CHECK (salary >= 0)
);

-- @block
ALTER TABLE workers
ADD COLUMN holiday_days INT DEFAULT 0 CHECK (holiday_days >= 0);

ALTER TABLE workers
ADD COLUMN email VARCHAR(256) UNIQUE;

ALTER TABLE workers
ADD CHECK (email != '');

ALTER TABLE workers
ALTER COLUMN email SET NOT NULL;

ALTER TABLE workers
ALTER COLUMN salary SET DEFAULT 500;

ALTER TABLE workers
RENAME TO employees;

-- @block
INSERT INTO employees 
(full_name, department, birthday, salary, holiday_days, email) 
VALUES
('John Doe', 'department 1', '2000-01-01', 123.3, 1, 'jd@gmail.com');

-- @block
INSERT INTO employees 
(full_name, department, birthday, salary, holiday_days, email) 
VALUES
('', 'department 1', '2000-01-01', 123.3, 1, 'jd@gmail.com');

-- @block
INSERT INTO employees 
(full_name, department, birthday, salary, holiday_days, email) 
VALUES
('Julia', 'department 1', '1234-01-01', 123.3, 1, 'jd@gmail.com');

-- @block
INSERT INTO employees 
(full_name, department, birthday, salary, holiday_days, email) 
VALUES
('Julia', 'department 1', '1982-01-01', -1, 1, 'jd@gmail.com');

-- @block
INSERT INTO employees 
(full_name, department, birthday, salary, holiday_days, email) 
VALUES
('Julia', 'department 1', '2000-01-01', 123.3, -1, 'jd@gmail.com');

-- @block
INSERT INTO employees 
(full_name, department, birthday, salary, holiday_days, email) 
VALUES
('Julia', 'department 1', '2000-01-01', 123.3, 12, 'j@gmail.com');

-- @block
INSERT INTO employees 
(full_name, department, birthday, salary, holiday_days, email) 
VALUES
('Julia', 'department 1', '2000-01-01', 123.3, 12, '');

-- @block
INSERT INTO employees 
(full_name, department, birthday, salary, holiday_days, email) 
VALUES
('Julia', 'department 1', '2000-01-01', 123.3, DEFAULT, 'NULL1');

-- @block
INSERT INTO employees 
(full_name, department, birthday, salary, holiday_days, email) 
VALUES
('Julia', 'department 1', '2000-01-01', DEFAULT, 23, 'jde@gmail.com');

-- @block
INSERT INTO employees 
(full_name, department, birthday, salary, holiday_days, email) 
VALUES
('Julia', 'department 1', '2000-01-01', 123.3, -1, 'jd@gmail.com');


-- @block
DROP TABLE employees;
-- CHECK (full_name != '' AND birthday > '1890-01-01' AND birthday <= current_date AND salary > 0.00)