-- DML script

insert into department values (
    111, "Mechanical and Industrial Engineering"
);

insert into department values (
    222, "Chemical Engineering"
);

insert into department values (
    333, "Khoury"
);

insert into department values (
    444, "Economics"
);

insert into department values (
    555, "Electrical and Computer Engineering"
);

insert into department values (
    666, "Business"
);

insert into department values (
    777, "Civil Engineering"
);

insert into department values (
    888, "Computer & Information Science"
);

select * from department;

insert into campus values (
   "Silicon Valley", "4 N 2nd St Suite 150, San Jose, CA 95113"
);

insert into campus values (
   "San Francisco", "600 California St, San Francisco, CA 94108"
);

insert into campus values (
   "Boston", "360 Huntington Ave, Boston, MA 02115"
);

insert into campus values (
    "London", "Devon House, 58 St Katharine's Way, London E1W 1LP, UK"
);

insert into campus values (
    "Charlotte", "101 N Tryon St #1100, Charlotte, NC 28246"
);

insert into campus values (
    "Seattle", "401 Terry Ave N, Suite 103, Seattle, WA 98109"
);

insert into campus values (
    "Toronto", "First Canadian Place, 100 King St W #4620, Toronto, ON M5X 1E2, Canada"
);

insert into campus values (
    "Vancouver", "410 W Georgia St #1400, Vancouver, BC V6B 1Z3, Canada"
);

insert into campus values (
    "Portland", "100 Fore St, Portland, ME 04101"
);


select * from campus;


insert into major values (
    "Machine Learning", 333
);

insert into major values (
    "Software Engineering", 333
);

insert into major values (
    "Security", 333
);


insert into major values (
    "Data Science", 333
);


insert into major values (
    "Computational Theory", 333
);


insert into major values (
    "Computer Systems", 333
);

insert into major values (
    "Automation and Roboticss", 111
);

insert into major values (
    "Biomolecular", 222
);

insert into major values (
    "Macroeconomics", 444
);

insert into major values (
    "Marketing", 666
);

insert into major values (
    "Electricity", 555
);


insert into major values (
    "Construction Management", 777
);


insert into major values (
    "CIS", 888
);


select * from major;


insert into student (nuid, name, entry_year, role, min_credit, department_id, campus_name, major)
VALUES
  (479614611,"Darrel Kinney", 2019, "grad", 5, 111, "Boston", "Automation and Roboticss"),
  (988764751,"Fiona Burnett", 2019,  "grad",4, 222, "Charlotte", "Biomolecular"),
  (726060989,"Noelle Fischer", 2020,  "grad",5, 333, "Silicon Valley", "Computer Systems"),
  (915644291,"Dana Wiggins", 2021, "grad", 8, 333, "Portland", "Machine Learning"),
  (117781357,"Brock Mcfadden", 2019, "grad", 9, 333, "Silicon Valley", "Computational Theory"),
  (858297156,"Aspen Rhodes", 2018, "grad", 9, 333, "Boston", "Security"),
  (268246649,"Thor Pickett", 2021, "grad", 8, 333, "Seattle", "Security"),
  (613463657,"Carter Fulton", 2022, "grad", 4, 333, "Silicon Valley", "Computer Systems"),
  (507179876,"Henry Cobb", 2022,"grad",5, 333, "Boston", "Computer Systems"),
  (375339156,"Alana Clark", 2021, "grad", 8, 444, "Boston", "Macroeconomics"),
  (480345278,"Aphrodite Jennings", 2021, "grad", 5, 555, "Seattle", "Electricity"),
  (437134272,"Quintessa Goodman", 2021, "grad", 5, 333, "San Francisco", "Software Engineering"),
  (338961544,"Kamal Rodriguez", 2021, "grad", 8, 333, "San Francisco", "Software Engineering"),
  (171041918,"Sylvia Hoffman", 2021, "undergrad", 8, 333,"Boston", "Software Engineering"),
  (938372796,"Destiny Holmes", 2019,"undergrad", 9, 333, "San Francisco", "Computational Theory"),
  (683556064,"Clementine Hinton", 2021,"undergrad", 4, 444, "Charlotte", "Computational Theory"),
  (946262966,"Timothy Guthrie", 2019,"undergrad", 5, 555, "Vancouver", "Electricity"),
  (189601184,"May Bell", 2021,"undergrad", 8, 666,"Silicon Valley", "Marketing"),
  (329858869,"Ryder Ferrell", 2020,"undergrad", 5, 777, "Toronto", "Construction Management"),
  (847878772,"Adara Frank", 20221,"undergrad", 8, 888, "Toronto", "CIS");


select * from student;


insert into course (number, name, seats_available, total_seats, wl_available, total_wl, pre_requisite, CRN, type, semester, time_from, time_to, days, date, campus_name, credit, major,level) 
VALUES
  ("CS3650", 'Computer Systems', 25, 25, 3, 3, "CS2510",12022, "online", "Spring 2023", "11:45", "13:25", "TUE/THU", "09/07/2022 - 12/07/2022", "Boston", "4", "Computer Systems","undergraduate"),
  ("CS3700", 'Networks and Distributed Systems', 20, 25, 0, 0, "CS2510",12023, "online", "Spring 2023", "09:50","11:30", "TUE/THU", "09/07/2022 - 12/07/2022", "Boston", "4", "Computer Systems","undergraduate"),
  ("CS2510", 'Fundamentals of Computer Science 2', 60, 60, 15, 15, NULL, 12000, "online", "Spring 2023", "8:45", "10:25", "MON/WED/FRI", "09/07/2022 - 12/07/2022", "Boston", "4", "Computational Theory","undergraduate"),
  ("CS5010", 'Programming Design Paradigm', 45, 45, 10, 10, NULL, 20073, "offline", "Spring 2023", "17:00", "19:00", "TUE", "09/07/2022 - 12/07/2022", "Vancouver", "3", "Software Engineering","graduate"),
  ("CS5200", 'Database Management Systems', 25, 25, 10, 10, NULL, 19765, "offline", "Spring 2023", "18:00", "21:20", "WED", "09/07/2022 - 12/07/2022", "Silicon Valley", "4", "Software Engineering","graduate"),
  ("CS5340", 'Computer/Human Interaction', 15, 15, 0, 0, NULL, 20462, "offline", "Spring 2023", "18:00", "21:20", "WED/FRI", "09/07/2022 - 12/07/2022", "Silicon Valley", "4", "Software Engineering","graduate"),
  ("CS5600", 'Computer Systems', 20, 20, 0, 0, "CS2510",18574, "offline", "Fall 2022", "15:25","17:05", "WED","09/07/2022 - 12/07/2022", "Silicon Valley", "4", "Computer Systems","graduate"),
  ("CS5610", 'Web Development', 50, 50, 20, 20, NULL,19787, "offline", "Summer 2022", "13:00","16:20", "TUE","09/07/2022 - 12/07/2022", "Boston", "4", "Software Engineering","graduate");

select * from course;

insert into offline_course (crn, number, location)
VALUES
  (19765, "CS5200", "Rich Hall, Room 321"),
  (20073, "CS5010", "Hart Hall, Room 1201"),
  (20462, "CS5340", "San Jose Building Room 1421"),
  (18574, "CS5600", "San Jose Building Room 1010"),
  (19787, "CS5610", "Shillman Hall, Room 335");

select * from offline_course;


insert into online_course (crn, number, type, link)
VALUES
  (12022, "CS3650", "online", "http:zoom1234"),
  (12023, "CS3700",  "online", "http:zoom1e3r234"),
  (12000, "CS2510", "online", "http:zoom12re3434");
  
select * from online_course;

insert into advisor (id, name, campus_name) 
VALUES
  (451, "Shanon Marquez", "Boston"),
  (452, "Cora Norman", "Toronto"),
  (453, "Julia Hyde", "Silicon Valley"),
  (454, "Alessandra Sears", "Silicon Valley"),
  (455, "Janice Fernandez", "Silicon Valley"),
  (456, "Keiran Nielsen", "San Francisco"),
  (457, "Addie Kinney", "San Francisco"),
  (458, "Dani Fitzpatrick", "Seattle"),
  (459, "Waseem Sanders", "Seattle");

select * from advisor;

insert into ta (crn, id, name, course_number)
VALUES
  (19765, 765, "Peter Mccray", "CS5200"),
  (12022, 643, "Tala Terrell", "CS3650"),
  (20462, 265, "Guiyu Zhang", "CS5340"),
  (18574, 987, "So Lee", "CS5600"),
  (19787, 564, "Divya Mody", "CS5610"),
  (12022, 341, "Barry Herbert", "CS3650"),
  (19787, 129, "Bridget Kay", "CS3700"),
  (12000, 689, "Yueyuan Li", "CS2510");
  
select * from ta;

insert into professor (id, name, department_id, title)
VALUES
  (7433, "Jeongkyu Lee", 333, "Professor"),
  (7434, "Thea Lozano", 333, " Assistant Professor"),
  (7435, "Arda Georgee", 333, "Assistant Professor"),
  (7436, "Alexis Whyte", 333, "Teaching Professor"),
  (7437, "Kabir Cano", 333, "Assistant Professor"),
  (7438, "Clare Woodcock", 333, "Associate Professor"),
  (7439, "Ruiye Guo", 333, "Professor"),
  (7440, "Junli Cui", 333, "Professor"),
  (7441, "Dora Hooper", 333, "Professor");
  

select * from professor;

insert into teaching (professor_id, crn, course_number)
VALUES
  (7433, 19765, "CS5200"),
  (7434, 12000, "CS2510"),
  (7435, 12023, "CS3700"),
  (7436, 20462, "CS5340"),
  (7437, 19787, "CS5610"),
  (7438, 12022, "CS3650"),
  (7439, 18574, "CS5600"),
  (7440, 20073, "CS5010");
  
select * from teaching;


insert into works_on (professor_id, department_id, introduction)
VALUES
  (7433, 333, "Dr. Lee joined Khoury department in 2022"),
  (7434, 333, "Dr. Lozano joined Khoury department in 2022"),
  (7435, 333, "Dr. Georgee joined Khoury department in 2022"),
  (7436, 333, "Dr. Whyte joined Khoury department in 2022"),
  (7437, 333, "Dr. Cano joined Khoury department in 2022"),
  (7438, 333, "Dr. Guo joined Khoury department in 2022"),
  (7439, 333, "Dr. Cui joined Khoury department in 2022"),
  (7440, 333, "Dr. Hooper joined Khoury department in 2022");
  
select * from works_on;

insert into concentration (field, introduction, professor_id)
VALUES
  ("421", "Concentration on Database", 7433),
  ("422", "Concentration on Systems", 7434),
  ("423", "Concentration on Software", 7435),
  ("424", "Concentration on Theory", 7436),
  ("425", "Concentration on Security", 7437),    
  ("426", "Concentration on HCI", 7438),
  ("427", "Concentration on Artificial Intelligence", 7439),
  ("428", "Concentration on Data Science", 7440);
  
select * from concentration;
  
insert into registration (crn, nuid, course_number, permission, registration_time)
VALUES
  (19765, 117781357, "CS5200", "Allow", "2022-04-15"),
  (12000, 171041918, "CS2510", "Denied", "2022-04-15"),
  (12023, 189601184, "CS3700", "Allow", "2022-04-15"),
  (20462, 726060989, "CS5340", "Denied", "2022-04-15"),
  (19765, 268246649, "CS5200", "Allow", "2022-04-15"),
  (19787, 613463657, "CS5610", "Denied", "2022-04-15"),
  (12022, 437134272, "CS3650", "Allow", "2022-04-15"),
  (18574, 946262966, "CS5600", "Denied", "2022-04-15"),
  (20073, 988764751, "CS5010", "Allow", "2022-04-15");
  
select * from registration;

insert into users(id,password,email,role)
Values(375339156,'02031f84','jenk@wcu.edu','student'),
(479614611,'abcg2342','je344@wcu.edu','student'),
(12345,'12345678','admin@wcu.edu','admin')
  