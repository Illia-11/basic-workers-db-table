CREATE TABLE workers(
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(200) NOT NULL CONSTRAINT "full name must be" CHECK (full_name != ''),
  department VARCHAR(100),
  birthday DATE NOT NULL CHECK (birthday > '1890-01-01' AND birthday <= current_date),
  salary NUMERIC(11,2) CHECK (salary >= 0)
);

DROP TABLE employees;

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
