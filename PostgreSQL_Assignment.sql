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

-- Creating a enrollment table
CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES (student_id),
    course_id INTEGER REFERENCES (course_id)
)


-- Inserting sample student data

INSERT INTO students (
        student_id,
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )VALUES (
        6,
        'Fiona Green',
        19,
        'fiona.green@gmail.com',
        75,
        80,
        NULL
    ),
    (
        7,
        'George White',
        21,
        'george.white@yahoo.com',
        68,
        72,
        NULL
    ),
    (
        8,
        'Hannah Black',
        22,
        'hannah.black@outlook.com',
        82,
        85,
        NULL
    ),
    (
        9,
        'Ian Blue',
        20,
        'ian.blue@icloud.com',
        90,
        88,
        NULL
    ),
    (
        10,
        'Jane Red',
        23,
        'jane.red@protonmail.com',
        77,
        79,
        NULL
    );


-- start solving query

-- Query 1:-
-- Insert a new student record with the following details:

INSERT INTO students(
student_name,age,email,frontend_mark,backend_mark,status
)VALUES('Forhad',29,'forhadairdrop@gmail.com',40,50,NULL)


    SELECT * FROM students

    
    DROP TABLE students

