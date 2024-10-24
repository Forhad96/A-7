# University Database Management

This project demonstrates a simple PostgreSQL-based university database with tables for storing student details, courses, and enrollments. The SQL script includes the creation of tables, insertion of sample data, and several SQL queries to perform various operations.

## Database Schema

The database contains three main tables: `students`, `courses`, and `enrollment`.

### 1. Students Table
| Column       | Data Type    | Description                             |
|--------------|---------------|-----------------------------------------|
| student_id   | SERIAL        | Primary key                             |
| student_name | VARCHAR(50)   | Name of the student                     |
| age          | INTEGER       | Age of the student                      |
| email        | VARCHAR(50)   | Email address of the student            |
| frontend_mark| INTEGER       | Marks obtained in the Frontend course   |
| backend_mark | INTEGER       | Marks obtained in the Backend course    |
| status       | VARCHAR(25)   | Current status of the student           |

### 2. Courses Table
| Column       | Data Type     | Description                             |
|--------------|---------------|-----------------------------------------|
| course_id    | SERIAL        | Primary key                             |
| course_name  | VARCHAR(255)  | Name of the course                      |
| credits      | INTEGER       | Number of credits for the course        |

### 3. Enrollment Table
| Column          | Data Type     | Description                           |
|-----------------|---------------|---------------------------------------|
| enrollment_id   | SERIAL        | Primary key                           |
| student_id      | INTEGER       | Foreign key referencing `students`    |
| course_id       | INTEGER       | Foreign key referencing `courses`     |

## Database Setup

### Create the Database
```sql
CREATE DATABASE university_db;
```

### Create Tables
```sql
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    age INTEGER,
    email VARCHAR(50),
    frontend_mark INTEGER,
    backend_mark INTEGER,
    status VARCHAR(25)
);

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255),
    credits INTEGER
);

CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INTEGER REFERENCES students (student_id),
    course_id INTEGER REFERENCES courses (course_id)
);
```

### Insert Sample Data
**Students:**
```sql
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
VALUES 
    ('Sammer', 21, 'sammer@example.com', 48, 60, NULL),
    ('Zoya', 23, 'zoya@example.com', 52, 58, NULL),
    ('Nabil', 22, 'nabil@example.com', 37, 46, NULL),
    ('Rafi', 24, 'rafi@example.com', 41, 40, NULL),
    ('Shophia', 22, 'sophia@example.com', 50, 52, NULL),
    ('Hasan', 23, 'hasan@gamil.com', 43, 39, NULL);
```

**Courses:**
```sql
INSERT INTO courses (course_id, course_name, credits)
VALUES 
    (1, 'Next.js', 3),
    (2, 'React.js', 4),
    (3, 'Databases', 3),
    (4, 'Prisma', 3);
```

**Enrollments:**
```sql
INSERT INTO enrollment (course_id, student_id)
VALUES 
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 2);
```

## Queries

- **Query 1:** Insert a new student record.
  ```sql
  INSERT INTO students (student_name, age, email, frontend_mark, backend_mark, status)
  VALUES ('Forhad', 29, 'forhadairdrop@gmail.com', 40, 50, NULL);
  ```

- **Query 2:** Retrieve names of students enrolled in the 'Next.js' course.
  ```sql
  SELECT student_name
  FROM enrollment
  JOIN students ON students.student_id = enrollment.student_id
  JOIN courses ON courses.course_id = enrollment.course_id
  WHERE courses.course_name = 'Next.js';
  ```

- **Query 3:** Update the status of the student with the highest total marks.
  ```sql
  UPDATE students
  SET status = 'Awarded'
  WHERE (frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark) FROM students
  );
  ```

- **Query 4:** Delete all courses that have no students enrolled.
  ```sql
  DELETE FROM courses
  WHERE course_id NOT IN (SELECT course_id FROM enrollment);
  ```

- **Query 5:** Retrieve student names with a limit of 2, starting from the 3rd student.
  ```sql
  SELECT student_name FROM students OFFSET 2 LIMIT 2;
  ```

- **Query 6:** Retrieve course names with the number of students enrolled in each.
  ```sql
  SELECT course_name, COUNT(*) AS students_enrolled
  FROM enrollment
  JOIN courses ON courses.course_id = enrollment.course_id
  GROUP BY course_name;
  ```

- **Query 7:** Calculate and display the average age of all students.
  ```sql
  SELECT ROUND(AVG(age), 2) FROM students;
  ```

- **Query 8:** Retrieve names of students with emails containing 'example.com'.
  ```sql
  SELECT student_name FROM students WHERE email LIKE '%example.com%';
  ```

## View Table Data
```sql
SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM enrollment;
```

## Drop Tables
```sql
DROP TABLE students;
DROP TABLE courses;
DROP TABLE enrollment;
```

