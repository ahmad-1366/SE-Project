SELECT * FROM ACTIVITY
select * from bill
select * from request
select * from issuanceform
select * from Notification

select * from [user] where user_id = 4

select * from activity inner join request on Activity.request_id = Request.request_id
where user_id = 4


INSERT INTO ACTIVITY(request_id, description, department) VALUES
(1, 'Processing Started', 'Finance Staff'),
(1, 'Processing Started', 'FYP Staff'),
(1, 'Under Review', 'FYP Staff'),
(1, 'Under Review', 'Finance Staff'),
(1, 'Approved', 'Finance Staff'),
(1, 'Approved', 'FYP Staff'),
(1, 'Request Finalized', 'Admin'),
(2, 'Processing Started', 'Finance Staff'),
(3, 'Processing Started', 'FYP Staff');


SELECT * FROM REQUEST
update activity 
set timestamp = GETDAte()

delete from notification
delete from issuanceform
delete from request
select * from issuanceform
update issuanceform set doc_type='Degree'

select first_name,last_name,cnic,dob,gender,batch,level,dept_name from dbo.[Degree] inner join [User] on 
[Degree].user_id = [User].user_id inner join [Department] on [Department].dept_id = [Degree].dept_id where 
[user].user_id = 4

SELECT
    Department,
    COUNT(*) AS TotalRequests,
    MIN(ProcessingStarted) AS MinProcessingTime,
    MAX(RequestFinalized) AS MaxProcessingTime,
    AVG(DATEDIFF(minute, ProcessingStarted, RequestFinalized)) AS AvgProcessingTime
FROM (
    SELECT
        Department,
        MIN(CASE WHEN description = 'Processing Started' THEN timestamp END) AS ProcessingStarted,
        MAX(CASE WHEN description = 'Request Finalized' THEN timestamp END) AS RequestFinalized
    FROM ACTIVITY
    GROUP BY Department, request_id
) AS Subquery
GROUP BY Department;

INSERT INTO [Notification] (user_id, rcv_group, description) VALUES 
(0null,'Request Approved By FYP Department')


SELECT
    Department,
    COUNT(*) AS TotalRequests,
    MIN(ProcessingStarted) AS MinProcessingTime,
    CASE
        WHEN MAX(RequestFinalized) IS NULL THEN NULL
        ELSE MAX(RequestFinalized)
    END AS MaxProcessingTime,
    AVG(
        CASE
            WHEN MAX(RequestFinalized) IS NULL THEN NULL
            ELSE DATEDIFF(minute, ProcessingStarted, RequestFinalized)
        END
    ) AS AvgProcessingTime
FROM (
    SELECT
        Department,
        MIN(CASE WHEN description = 'Processing Started' THEN timestamp END) AS ProcessingStarted,
        MAX(CASE WHEN description = 'Request Finalized' THEN timestamp END) AS RequestFinalized
    FROM Activity
    GROUP BY Department, request_id
) AS Subquery
GROUP BY Department;

select * from activity


select Bill.status from request inner join bill on bill.request_id = request.request_id;


SELECT [user].first_name, [user].last_name, [user].username, request.request_id, bill.status
FROM [USER] INNER JOIN REQUEST ON [USER].user_id = REQUEST.user_id INNER JOIN BILL ON 
BILL.request_id = REQUEST.request_id


INSERT INTO BILL (request_id, amount, status, paid_on) VALUES
(1, 100, 'Paid', GETDATE()),
(2, 150, 'Paid', GETDATE()),
(3, 200, 'Not Paid', NULL),
(4, 300, 'Not Paid', NULL)


ALTER TABLE Activity
ALTER COLUMN Activity.[timestamp] DATETIME DEFAULT GETDATE();


select first_name,last_name,cnic,dob,gender,cgpa,start_year,end_year from [User] inner join Transcript on [User].user_id = Transcript.user_id where [User].user_id = 1

select * from transcript

select * from issuanceform


Select * from Comment



SELECT [user].first_name, [user].last_name, [user].username, request.request_id, bill.status as paymentstatus
FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id INNER JOIN BILL ON BILL.request_id = REQUEST.request_id

SELECT [user].first_name, [user].last_name, [user].username, request.request_id, bill.status as paymentstatus, ACTIVITY.description 
as activitystatus FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id INNER JOIN BILL ON BILL.request_id = REQUEST.request_id
LEFT JOIN Activity ON REQUEST.request_id = ACTIVITY.request_id WHERE ACTIVITY.department = 'Finance Staff' AND 
ACTIVITY.description in ('Approved', 'Rejected', 'Objected') or activity.description is null

select * from [user]


SELECT * FROM REQUEST INNER JOIN ISSUANCEFORM ON REQUEST.form_id = ISSUANCEFORM.form_id WHERE 
doc_type = 'Degree' AND status = 'Processed' AND user_id = 1

SELECT * FROM COMPLAINT

select * from degree

insert into degree(user_id, dept_id, batch, level) VALUES
(4,1,'Spring-2020','Bachelors of Science')
insert into transcript(user_id, cgpa, start_year, end_year) values
(4, '3.0', '2020', '2024')

select * from request
select * from degree
select * from transcript
SELECT * FROM NOTIFICATION
alter table transcript
alter column cgpa char(5)
update transcript set cgpa = '3.0'

INSERT INTO NOTIFICATION (rcv_group, description) VALUES
('All', 'New Degree Issuance Request'),
('All', 'New Degree Issuance Request'),
('All', 'New Degree Issuance Request'),
('All', 'New Degree Issuance Request'),
('All', 'New Degree Issuance Request'),
('All', 'New Degree Issuance Request')


update request
set status = 'Processing'
where request_id = 1

select first_name,last_name,cnic,dob,gender,major,batch,level,dept_name from dbo.[Degree] inner join [User]
on [Degree].user_id = [User].user_id inner join [Department] on [Department].dept_id = [Degree].dept_id where
[user].user_id = 2


select * from request
update Request set status = 'Pending'

select * from Issuanceform

select * from bill

select * from activity

insert into bill (request_id, amount, status) values
(1, )

insert into degree (user_id, dept_id, batch, level) values
(1, 1, 'Spring-2020', 'Bachelors of Science'),
(2, 2, 'Spring-2020', 'Bachelors of Science'),
(3, 3, 'Spring-2020', 'Bachelors of Science')

insert into transcript(user_id, cgpa, start_year, end_year) values
(1,'3.0', 2020, 2024),
(2,'2.5', 2020, 2024),
(3,'2.0', 2020, 2024)

alter table transcript
alter column cgpa Varchar(5)


select * from degree
select *from transcript

ALTER TABLE Degree
ALTER COLUMN batch VARCHAR(15);
select * from transcript

delete from request

delete from activity
where description = 'Processing Started'

select first_name,last_name,cnic,username,dob,cgpa,start_year,end_year,batch,level,dept_name from [User]
inner join Transcript on [User].user_id = Transcript.user_id inner join Degree on Degree.user_id = [User].user_id
inner join Department on Degree.dept_id = Department.dept_id where [User].user_id = 1

delete from issuanceform
select * from notification
SELECT * FROM NOTIFICATION WHERE rcv_group = 'Dept' ORDER BY timestamp DESC


select first_name,last_name,cnic,dob,gender,cgpa,start_year,end_year,batch,level,dept_name from [User] inner 
join Transcript on [User].user_id = Transcript.user_id inner join Degree on Degree.user_id = [User].user_id 
inner join Department on Degree.dept_id = Department.dept_id where [User].user_id = 1;

SELECT [user].first_name, [user].last_name, [user].username, request.request_id, ACTIVITY.description as activitystatus 
FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id LEFT JOIN 
(SELECT * from Activity WHERE ACTIVITY.department = 'FYP Staff' AND (ACTIVITY.description in ('Approved', 'Rejected', 'Objected') or 
activity.description = 'Processing Started')) ON REQUEST.request_id = ACTIVITY.request_id ;


SELECT [user].first_name, [user].last_name, [user].username, request.request_id, ACTIVITY.description as activitystatus 
FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id LEFT JOIN Activity ON REQUEST.request_id = ACTIVITY.request_id 
WHERE ACTIVITY.department = 'FYP Staff' AND REQUEST.status = 'Processing'
activity.description != 'Processing Started');

select * from  activity

select * from activity where activity.department = 'FYP Staff' and 
delete from activity where description = 'Request' and request_id = 7

update activity 
set description = 'Processing Started' where request_id = 7 and description = 'Request Approved'
update activity set department = 'Admin' where activity_id = 34


SELECT [user].first_name, [user].last_name, [user].username, request.request_id, REQUEST.status as activitystatus 
FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id where request.status='Processing' and Request.request_id
in ( SELECT request_id FROM activity WHERE department = 'FYP Staff' AND description = 'Processing Started' AND request_id 
NOT IN ( SELECT request_id FROM Activity WHERE department = 'FYP Staff' AND description = 'Request Approved'));

SELECT [user].first_name, [user].last_name, [user].username, request.request_id, bill.status as paymentstatus, ACTIVITY.description
as activitystatus FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id INNER JOIN BILL ON BILL.request_id = REQUEST.request_id
LEFT JOIN Activity ON REQUEST.request_id = ACTIVITY.request_id WHERE ACTIVITY.department = 'Finance Staff' AND
ACTIVITY.description in ('Approved', 'Rejected', 'Objected') or activity.description is null

SELECT [user].first_name, [user].last_name, [user].username, request.request_id, BILL.status as paymentstatus, REQUEST.status as 
activitystatus FROM [USER] INNER JOIN REQUEST ON[USER].user_id = REQUEST.user_id INNER JOIN BILL ON BILL.request_id = REQUEST.request_id
where request.status = 'Processing' and Request.request_id in ( SELECT request_id FROM activity WHERE department = 'Finance Staff' AND 
description = 'Processing Started' AND request_id NOT IN ( SELECT request_id FROM Activity WHERE department = 'Finance Staff' and description IN ('Request Approved','Request Rejected')));

select * from activity

update activity set description = 'Request Approved' where activity_id = 39



select * from degree

INSERT INTO Grade (transcript_id, course_id, letter_grade) values
(7, 1, 'A'),
(7, 2, 'B+'),
(7, 3, 'A-'),
(7, 4, 'B')

alter table grade
alter column letter_grade char(3)

select * from grade

select * from course;

INSERT INTO COURSE (course_code, course_name, credit_hrs) VALUES
('AF1001','Fundamentals of Accounting',3),
('CS1002','Programming Fundamentals',3),
('CL1002','Programming Fundamentals - Lab',1),
('CL2001','Data Structures - Lab',1)


select * from activity



select * from comment
select * from request

insert into comment (cmt_from, request_id, description) values
('Finance', 3, 'Fees Not Paid'),
('FYP', 3, 'FYP not evaluated'),
('Admin', 3, 'Something something');

select * from [user]

