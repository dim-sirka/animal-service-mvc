--create table
CREATE TABLE public.admins
(
    id INTEGER NOT NULL,
    bank_account VARCHAR(32) NOT NULL,
    created_date TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    email VARCHAR(32),
    first_name VARCHAR(32),
    last_name VARCHAR(32),
    password VARCHAR(64),
    updated_date TIMESTAMP WITHOUT TIME ZONE,
    CONSTRAINT "adminsPK" PRIMARY KEY (id)
);

--insert data
INSERT INTO public.admins VALUES(
 1,
 '2345678934567143',
 '2020-6-04'::timestamp without time zone,
 'test@gmail.com',
 'TestName',
 'TestSurname',
 '$2a$10$AI1rhvWWi4iPK.8xTJVp9upxCaSsKkEpEH4f5a42hYsMZtsw2O85u',
 '2020-6-04'::timestamp without time zone
);
