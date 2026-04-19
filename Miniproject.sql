CREATE DATABASE mini_project1;
USE mini_project1;

CREATE TABLE STUDENT (
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL,
    student_dob DATE NOT NULL,
    student_email VARCHAR(50) UNIQUE
);

CREATE TABLE COURSE (
	course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50) NOT NULL,
    course_description VARCHAR(50),
    teacher_id INT,
    course_lesson INT,
    FOREIGN KEY (teacher_id) REFERENCES TEACHER (teacher_id)
);

CREATE TABLE TEACHER (
	teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(50) NOT NULL,
    teacher_email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE ENROLLMENT (
	student_id INT UNIQUE,
    course_id INT UNIQUE,
    PRIMARY KEY (student_id, course_id),
    enrollment_day DATE DEFAULT (CURRENT_DATE),
    FOREIGN KEY (course_id) REFERENCES COURSE (course_id),
    FOREIGN KEY (student_id) REFERENCES STUDENT (student_id)
);

CREATE TABLE SCORE (
	student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
	mid_term_score FLOAT(1,1) CHECK(mid_term_score >= 0 AND mid_term_score <= 10),
    end_term_score FLOAT(1,1) CHECK(end_term_score >= 0 AND end_term_score <= 10),
    FOREIGN KEY (student_id, course_id) REFERENCES ENROLLMENT (student_id, course_id)
);

INSERT INTO STUDENT (student_name, student_dob, student_email)
VALUES
('Nguyễn Văn A', '2025-05-20', 'anv@gmail.com'),
('Trần Thị B', '2026-02-10', 'btt@gmail.com'),
('Phạm Văn C', '2025-01-15', 'cpv@gmail.com'),
('Lê Thị D', '2024-12-01', 'dlt@gmail.com'),
('Hoàng Văn E', '2025-03-01', 'ehv@gmail.com');

INSERT INTO COURSE (course_name, course_description, course_lesson)
VALUES
('Lập trình C++', 'Cơ bản đến nâng cao', 30),
('Cơ sở dữ liệu SQL', 'Truy vấn và thiết kế', 25),
('Lập trình Python', 'Phân tích dữ liệu', 40),
('Phát triển Web', 'HTML, CSS, JS và PHP', 35),
('Trí tuệ nhân tạo', 'Machine Learning cơ bản', 45);

INSERT INTO TEACHER (teacher_name, teacher_email, course_id) 
VALUES
('Thầy Hoàng', 'hoangteacher@gmail.com', 1),
('Cô Phương', 'phuongteacher@gmail.com', 2),
('Thầy Qúy', 'quyteacher@gmail.com', 3),
('Cô Hà', 'hateacher@gmail.com', 4),
('Thầy Thắng', 'thangteacher@gmail.com', 5);

INSERT INTO ENROLLMENT (student_id, course_id, enrollment_day) 
VALUES
(1, 1, '2026-01-05'),
(1, 2, '2026-01-05'),
(2, 2, '2026-01-06'),
(2, 3, '2026-01-06'),
(3, 3, '2026-01-07'),
(3, 4, '2026-01-07'),
(4, 4, '2026-01-08'),
(4, 5, '2026-01-08'),
(5, 5, '2026-01-09'),
(5, 1, '2026-01-09');

INSERT INTO SCORE (student_id, course_id, mid_term_score, end_term_score) 
VALUES
(1, 1, 8.5, 7.0),
(1, 2, 7.0, 8.0),
(2, 2, 7.5, 6.0),
(2, 3, 5.0, 6.5),
(3, 3, 9.0, 8.5),
(3, 4, 4.0, 5.5),
(4, 4, 8.0, 7.5),
(4, 5, 7.0, 8.5),
(5, 5, 6.5, 8.0),
(5, 1, 9.5, 9.0);

UPDATE STUDENT
SET student_email = "anve@gmail.com"
WHERE student_id = 1;

UPDATE COURSE
SET course_description = "Khóa học này rất bổ ích, mời các bạn trải nghiệm"
WHERE course_id = 2;

UPDATE SCORE 
SET end_term_score = 3.0
WHERE student_id = 3 AND course_id = 3;

DELETE FROM ENROLLMENT
WHERE student_id = 2 AND course_id = 1;

DELETE FROM SCORE
WHERE student_id = 2 AND course_id = 1;

SELECT * FROM STUDENT;
SELECT * FROM COURSE;
SELECT * FROM TEACHER;
SELECT * FROM ENROLLMENT;
SELECT * FROM SCORE;