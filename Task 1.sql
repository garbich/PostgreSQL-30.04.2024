drop table if exists doctorsExaminations;
drop table if exists doctors;
drop table if exists examinations;
drop table if exists wards;
drop table if exists departments;

create table if not exists departments (
    id serial not null primary key,
    building int not null, 
    name varchar(255) NOT NULL unique
);

create table if not exists doctors (
    id serial not null primary key,
    name varchar(255) NOT NULL,
    premium_money money not null,
    department_id int not null,
    salary money not null,
    surname varchar(255) not null,
	FOREIGN key(department_id) REFERENCES departments(id) on delete cascade
);

create table if not exists doctorsExaminations (
    id serial not null primary key,
    endTime time not null,
    startTime time not null,
    doctor_id int not null,
    examination_id int not null,
    ward_id int not null,
	FOREIGN key(doctor_id) REFERENCES doctors(id)
);

create table if not exists examinations (
    id serial primary key,
    name varchar(255) NOT NULL unique
);

create table if not exists wards (
    id serial not null primary key,
    name varchar(255) NOT NULL,
    places int not null,
    department_id int not null,
    FOREIGN KEY (department_id) REFERENCES departments(id) on DELETE CASCADE
);

INSERT INTO departments (building, name) VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Oncology');

INSERT INTO doctors (name, premium_money, department_id, salary, surname) VALUES
('John', 2000.00, 1, 7000.00, 'Doe'),
('Alice', 1500.00, 2, 7500.00, 'Smith'),
('Michael', 1800.00, 3, 7200.00, 'Johnson');

INSERT INTO doctorsExaminations (endTime, startTime, doctor_id, examination_id, ward_id) VALUES
('10:00:00', '08:00:00', 1, 1, 1),
('11:30:00', '09:30:00', 2, 2, 2),
('13:00:00', '11:00:00', 3, 3, 3);

INSERT INTO examinations (name) VALUES
('MRI Scan'),
('Echocardiogram'),
('Blood Test');

INSERT INTO wards (name, places, department_id) VALUES
('Ward A', 10, 1),
('Ward B', 12, 2),
('Ward C', 15, 3);


--Task 1
--select 
--from wards
--where places > 10;

--Task 2
--select d.building, COUNT(w.id) as count_places
--from wards as w
--join departments as d
--on w.department_id = d.id
--GROUP By d.building;

--Task 3
--select d.name, COUNT(w.id)
--from wards as w
--join departments as d
--on w.department_id = d.id
--GROUP By d.name;

--Task 4
--select dp.name, Sum(d.premium_money)
--from departments as dp
--join doctors as d
--on d.department_id = dp.id
--GROUP By dp.name;


--Task 5
--select dp.name, sum(de.examination_id) 
--from doctors as d
--join doctorsExaminations as de
--on de.doctor_id = d.id
--join departments as dp
--on d.department_id = dp.id
--GROUP By dp.name
--HAVING sum(de.examination_id)  >= 2;

--Task 6 