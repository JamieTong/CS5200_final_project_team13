-- functions for students

-- 1.select

-- 1.1 Check course list
select * from course;

-- 1.1.1 Find all courses taught by specific professor
select course.number, course.CRN, course.name
from course join teaching on course.CRN = teaching.CRN
join professor on professor.id = teaching.professor_id
where professor.name = 'Jeongkyu Lee'  # input
;
-- 1.1.2 Find courses that are provided on specific day 
select *
from course join campus on course.campus_name = campus.name
where time like '%Th%'  # input (format: M, Tu, W, Th, F, Sa, Su)
;

-- 1.1.3 - 1.1.7 整合
select course.*
from course join campus on course.campus_name = campus.name
where campus.name = 'FA22' or course.name like '%FA22%' or  course.type = 'FA22' or course.semester = 'FA22' or course.major = 'FA22'# input
;

-- 1.1.3 Find courses that are provided on specific campus
select *
from course join campus on course.campus_name = campus.name
where campus.name = 'Silicon Valley'  # input
;
-- 1.1.4 Find courses with key words
select *
from course
where course.name like '%Database%' # input
;
-- 1.1.5 Find courses with type
select *
from course
where course.type = 'online' # input
;
-- 1.1.6 Find courses with semester
select *
from course
where course.semester = 'FA22' # input
;
-- 1.1.7 Find courses with major
select *
from course
where course.major = 'Computer Systems' # input
;
-- 1.1.8 Find information of a specific professor
select professor.*, concentration.field, concentration.introduction
from professor left join concentration on professor.id = concentration.professor_id
where professor.name = 'Thea Lozano' # input
;

-- 1.2 Find how many credits has registered and whether has been allowed
with a as(select NUID, credit, permission
from registration join course on course.CRN = registration.CRN)

select NUID, sum(credit) as credict_registered, permission
from a
group by NUID
having NUID = '189601184'  # input
;
-- 1.3 Find how many courses are available
with a as (
select major, count(*) as course_num
from course
group by major)

select  NUID, course_num
from student join a on student.major = a.major
where NUID = '613463657'  # input
;

-- functions for professors

-- 1.select
select *
from teaching
where  teaching.professor_id = '7433'  # input
;

-- 1.1 Find registration status for his/her course
select registration.course_number, registration.CRN, count(*) as total_students, course.seats_available, course.total_seats, course.wl_available, course.total_wl
from registration join course on registration.CRN = course.CRN
	join teaching on teaching.CRN = course.CRN
where teaching.professor_id = '7433' and registration.permission = 'Allow'   # input
group by registration.course_number
    ;

-- 1.2 Find his/her information
select professor.*, concentration.field, concentration.introduction
from professor join concentration on professor.id = concentration.professor_id
where id = '7434' # input
;

-- 1.3 check the student list of his/her course
select  student.name, student.NUID
from registration join course on registration.CRN = course.CRN
	join teaching on teaching.CRN = course.CRN
    join student on student.NUID = registration.NUID
where teaching.professor_id = '7433' and permission = 'Allow'
;

-- functions for advisors

-- 1 select
-- 1.1 Access the registration table to check students' registration status
select * 
from registration
where  NUID = '117781357'
;

-- 1.2 Check whether a student meet the minimal credit requirement
with cts as(
select student.NUID, student.min_credit as min_credit, sum(credit) as registered_credit, (min_credit - sum(credit)) as tag
from registration join course on registration.CRN = course.CRN join student on student.NUID = registration.NUID
group by NUID
)

select NUID, min_credit, registered_credit,
case when tag > 0 then 'No' 
    else 'Yes' end as meet_requirement
from cts
where NUID = '613463657'  # input
;

-- 2. Edit
-- 2.1 allow a registration
update registration
set permission = 'Allow'
where NUID = '726060989'   # input
;
-- 2.2 deny a registration
update registration
set permission = 'Denied'
where NUID = '726060989'   # input
;

-- functions for advisors

-- 1 select
select * 
from ta
where id = '129'
;

-- 1.1 select course info. of assisting course
select course.* 
from ta join course on ta.CRN = course.CRN
where id = '129';

-- 1.2 check the student list of assisting course
select  student.name, student.NUID, course.number
from ta join course on ta.CRN = course.CRN 
     join registration on registration.course_number = course.number
     join student on student.NUID = registration.NUID
where id = '765' and permission = 'Allow'
;