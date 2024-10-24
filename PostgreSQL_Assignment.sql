-- Active: 1729141881761@@127.0.0.1@5432@university_db

-- Create database
create DATABASE university_db
-- Creating a student table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    age INTEGER,
    email VARCHAR(50),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(25)
)
-- Creating a course table
CREATE TABLE course (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255),
    credits INTEGER
)


-- creating sample course
INSERT INTO course (
    course_id,
    course_name,
    credits
)
VALUES(1, 'Next.js', 3),
(2, 'React.js', 4),
(3, 'Databases', 3),
(4, 'Prisma', 3);

-- Creating a enrollment table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES (student_id),
    course_id INTEGER REFERENCES (course_id)
)
-- Inserting sample student data

INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'Sammer',
        21,
        'sammer@example.com',
        48,
        60,
        NULL
    ),
    (
        'Zoya',
        23,
        'zoya@example.com',
        52,
        58,
        NULL
    ),
    (
        'Nabil',
        22,
        'nabil@example.com',
        37,
        46,
        NULL
    ) (
        'Rafi',
        24,
        'rafi@example.com',
        41,
        40,
        NULL
    ),
    (
        'Shophia',
        22,
        'sophia@example.com',
        50,
        52,
        NULL
    ),
    (
        'Hasan',
        23,
        'hasan@gamil.com',
        43,
        39,
        NULL
    );

-- start solving query

-- Query 1:-
-- Insert a new student record with the following details:

INSERT INTO
    students (
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        'Forhad',
        29,
        'forhadairdrop@gmail.com',
        40,
        50,
        NULL
    )
    -- Query 2:
    -- Retrieve the names of all students who are enrolled in the course titled 'Next.js'.

SELECT * FROM students

SELECT * FROM course

DROP TABLE students