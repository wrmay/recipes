DROP TABLE IF EXISTS public.employee;

CREATE TABLE public.employee (
	id int2 NOT NULL,
	last_name varchar NOT NULL,
	first_name varchar NOT NULL,
	date_of_birth date NOT NULL,
	cell_phone varchar NULL,
	CONSTRAINT employee_pk PRIMARY KEY (id)
);

INSERT INTO public.employee (id,last_name,first_name,date_of_birth,cell_phone) VALUES
	 (1,'Arnold','Abe','1967-04-02','999-888-7777'),
	 (2,'Benson','Beatrice','1999-10-08','444-555-6666'),
	 (3,'Charles','Chris','1990-11-11','111-222-3333');

