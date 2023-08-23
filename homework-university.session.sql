CREATE TABLE students(
    id serial PRIMARY KEY,
    first_name varchar(15) NOT NULL CHECK(first_name != ''),
    last_name varchar(15) NOT NULL CHECK(last_name != ''),
    group_no int NOT NULL CHECK (group_no > 0)
);
INSERT INTO students(first_name, last_name, group_no) VALUES
    ('Jane', 'Doe', 1),
    ('John', 'Doe', 1),
    ('Anna', 'Joy', 2),
    ('Victor', 'Joy', 2);

-- NEXT TABLE

CREATE TABLE groups(
    id serial PRIMARY KEY,
    faculty_id int REFERENCES faculty(id) NOT NULL
)

INSERT INTO groups(faculty_id) VALUES (1), (2), (3);

-- NEXT TABLE

CREATE TABLE faculty(
    id serial PRIMARY KEY,
    faculty_name varchar(100) NOT NULL CHECK(faculty_name != '')
);

INSERT INTO faculty(faculty_name) VALUES
    ('ФАКУЛЬТЕТ 1'),
    ('ФАКУЛЬТЕТ 2'),
    ('ФАКУЛЬТЕТ 3');

-- NEXT TALBE

CREATE TABLE discipline(
    id serial PRIMARY KEY,
    discipline_name varchar(100) NOT NULL CHECK(discipline_name != ''),
    teacher varchar(30) NOT NULL CHECK(teacher != '')
);

INSERT INTO discipline(discipline_name, teacher) VALUES
    ('Chemistry', 'Teacher 1'),
    ('Mathematics', 'Teacher 2'),
    ('Physics', 'Teacher 3');

-- NEXT TABLE

CREATE TABLE exam(
    student_id int REFERENCES students(id),
    discipline_id int REFERENCES discipline(id),
    score int NOT NULL CHECK(score > 0),
    PRIMARY KEY(student_id, discipline_id)
);

INSERT INTO exam VALUES
    (1, 1, 4),
    (2, 1, 5),
    (3, 2, 2);