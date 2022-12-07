CREATE TABLE department (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE campus (
    name varchar(255) NOT NULL,
    location varchar(255) NOT NULL,
    PRIMARY KEY(name)
);

CREATE TABLE major (
    name varchar(255),
    department_id int NOT NULL,
    PRIMARY KEY(name)
);

CREATE TABLE student (
    nuid int NOT NULL,
    name varchar(255) NOT NULL,
    entry_year int NOT NULL,
    role varchar(255),
    min_credit int,
    department_id int, 
    campus_name varchar(255),
    major varchar(255),
    PRIMARY KEY(nuid),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (campus_name) REFERENCES campus(name),
    FOREIGN KEY (major) REFERENCES major(name)
);

CREATE TABLE course (
    number varchar(255) NOT NULL,
    seats_available int NOT NULL,
    total_seats int NOT NULL,
    wl_available int NOT NULL,
    total_wl int NOT NULL,
    pre_requisite varchar(255),
    crn int,
    name varchar(255),
    type varchar(255),
    semester varchar(255),
    level varchar(255),
    time_from time,
    time_to time,
    days varchar(255),
    date varchar(255),
    campus_name varchar(255), 
    credit int NOT NULL,
    major varchar(255),
    PRIMARY KEY(crn),
    FOREIGN KEY (campus_name) REFERENCES campus(name),
    FOREIGN KEY (major) REFERENCES major(name)
);

CREATE TABLE offline_course (
    crn int,
    number varchar(255) NOT NULL,
    location varchar(255),
    FOREIGN KEY(crn) REFERENCES course(crn)
);

CREATE TABLE online_course (
    crn int,
    number varchar(255) NOT NULL,
    type varchar(255),
    link varchar(255),
    FOREIGN KEY(crn) REFERENCES course(crn)
);

CREATE TABLE advisor (
    id int NOT NULL,
    name varchar(255),
    campus_name varchar(255),
    PRIMARY KEY (id),
    FOREIGN KEY(campus_name) REFERENCES campus (name)
);

CREATE TABLE ta (
    crn int,
    id int NOT NULL,
    name varchar(255),
    course_number varchar(255),
    PRIMARY KEY (id),
    FOREIGN KEY(CRN) REFERENCES course (CRN)
);

CREATE TABLE professor (
    id int NOT NULL,
    name varchar(255) NOT NULL,
    department_id int,
    title varchar(255),
    PRIMARY KEY(id)
);

CREATE TABLE teaching (
    professor_id int NOT NULL,
    crn int,
    course_number varchar(255),
    FOREIGN KEY(professor_id) REFERENCES professor(id),
    FOREIGN KEY(crn) REFERENCES course(CRN)
);

CREATE TABLE works_on (
    professor_id int NOT NULL,
    department_id int NOT NULL,
    introduction varchar(255),
    FOREIGN KEY(professor_id) REFERENCES professor(id),
    FOREIGN KEY(department_id) REFERENCES department(id)
);

CREATE TABLE concentration (
    field  varchar(255) NOT NULL,
    introduction varchar(255),
    professor_id int NOT NULL,
    PRIMARY KEY(field),
    FOREIGN KEY(professor_id) REFERENCES professor(id)
);

CREATE TABLE registration (
    crn int,
    nuid int NOT NULL,
    course_number varchar(255) NOT NULL,
    permission varchar(255),
    registration_time DATETIME, 
    FOREIGN KEY(crn) REFERENCES course(crn)
);
CREATE TABLE users (
    id int,
    password varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    role varchar(255) NOT NULL,
    PRIMARY KEY(id) 
);

DELIMITER $$
CREATE TRIGGER update_seats
AFTER insert ON registration 
FOR EACH ROW
BEGIN  
    IF new.permission = "Approve" AND (SELECT seats_available FROM course WHERE CRN = NEW.CRN) <> 0 THEN 
        UPDATE course 
        SET seats_available = seats_available - 1
        WHERE CRN = new.CRN;
    END IF;
END; $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER update_waitlist
AFTER insert ON registration 
FOR EACH ROW
BEGIN  
    IF new.permission = "approve" AND (SELECT seats_available FROM course WHERE CRN = NEW.CRN) = 0 
    AND (SELECT wl_available FROM course WHERE CRN = NEW.CRN) <> 0 THEN 
        UPDATE course 
        SET wl_available = wl_available - 1
        WHERE CRN = new.CRN;
    END IF;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getCourseByType(IN c_type varchar(50))
BEGIN
    SELECT * FROM course
    WHERE type = c_type;
END; $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE getCourseWithCertainPrereq(IN pre varchar(50))
BEGIN
    SELECT * FROM course
    WHERE pre_requisite = pre;
END; $$
DELIMITER ;

CREATE VIEW CS_Course AS 
SELECT number, type, semester, time, campus_name
FROM course
WHERE major = "Computer Systems";

CREATE VIEW SVSF_Advisor AS 
SELECT name, campus_name
FROM advisor
WHERE campus_name = "Silicon Valley" OR campus_name = "San Francisco";

CREATE VIEW BOS_Advisor AS 
SELECT name
FROM advisor
WHERE campus_name = "Boston";

CREATE VIEW SEA_Advisor AS 
SELECT name
FROM advisor
WHERE campus_name = "Seattle";

CREATE VIEW TOR_Advisor AS 
SELECT name
FROM advisor
WHERE campus_name = "Toronto";
