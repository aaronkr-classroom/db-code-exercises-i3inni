-- 1. Student
CREATE TABLE student (
    student_id BIGINT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    major VARCHAR(100)
);

-- 2. Professor
CREATE TABLE professor (
    employee_id BIGINT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100)
);

-- 3. Course
CREATE TABLE course (
    course_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 4. Section
CREATE TABLE section (
    course_id VARCHAR(20),
    section_id INT,
    professor_id BIGINT NOT NULL,

    PRIMARY KEY (course_id, section_id),

    FOREIGN KEY (course_id)
        REFERENCES course(course_id),

    FOREIGN KEY (professor_id)
        REFERENCES professor(employee_id)
);

-- 5. Enrollment
CREATE TABLE enrollment (
    student_id BIGINT,
    course_id VARCHAR(20),
    section_id INT,

    grade VARCHAR(2),
    points NUMERIC(5,2),
    enrolled_at DATE,

    PRIMARY KEY (student_id, course_id, section_id),

    FOREIGN KEY (student_id)
        REFERENCES student(student_id),

    FOREIGN KEY (course_id, section_id)
        REFERENCES section(course_id, section_id)
);