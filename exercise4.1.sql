CREATE TABLE students (
    student_id VARCHAR(10),
    admission_year INTEGER,
    major VARCHAR(3),
    individual_id VARCHAR(3),
    name VARCHAR(10),
    phone_number VARCHAR(13),
    address VARCHAR(255),
    total_credits INTEGER DEFAULT 0,
    gpa DECIMAL(3, 1) DEFAULT 0.0,
    enrollment_status BOOLEAN DEFAULT true,
    PRIMARY KEY (student_id)
);

ALTER TABLE students
ADD CONSTRAINT student_id_format
CHECK (student_id = CONCAT(CAST(admission_year AS VARCHAR(4)), major, individual_id));
