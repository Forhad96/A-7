-- Active: 1729141881761@@127.0.0.1@5432@university_db

-- Create database
create DATABASE university_db
-- end
---------------------------------------Table creation---------------------------------------
-- Creating a student table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    age INTEGER,
    email VARCHAR(50),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(25)
);

-- Creating a course table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255),
    credits INTEGER
);

-- Creating a enrollment table

CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students (student_id),
    course_id INTEGER REFERENCES courses (course_id)
);

----------------------------------- Insert sample data----------------------------------------
-- Inserting student data
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
    ),
    (
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

-- Inserting  course data
INSERT INTO
    courses (
        course_id,
        course_name,
        credits
    )
VALUES (1, 'Next.js', 3),
    (2, 'React.js', 4),
    (3, 'Databases', 3),
    (4, 'Prisma', 3);

-- inserting enrolled data
INSERT INTO
    enrollment (course_id, student_id)
VALUES (1, 1),
    (1, 2),
    (2, 1),
    (3, 2);

--------------------------------------------------- Start solving Database Query---------------------------------------------------

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
    );

-- Query 2:
-- Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT student_name
FROM
    enrollment
    JOIN students on students.student_id = enrollment.student_id
    JOIN courses on courses.course_id = enrollment.course_id
WHERE
    courses.course_name = 'Next.js';

-- Query 3:
-- Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.

UPDATE students
SET status = 'Awarded'
WHERE
    (frontend_mark + backend_mark) =
(SELECT max(frontend_mark + backend_mark)
FROM students);


-- Query 4:
-- Delete all courses that have no students enrolled. 

DELETE FROM courses
    WHERE course_id not in (SELECT course_id from enrollment)



-- Query 5:
-- Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name FROM students OFFSET 2 LIMIT 2








SELECT status, max(frontend_mark + backend_mark) as highest_total
FROM students
GROUP BY
    student_name,status

SELECT * FROM students

SELECT * FROM courses

SELECT * FROM enrollment

DROP TABLE enrollment