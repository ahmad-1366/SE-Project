-- -----------------------------------------------------
-- Schema Onestop
-- -----------------------------------------------------
--CREATE DATABASE Onestop;
USE Onestop;


-- -----------------------------------------------------
-- Table `Onestop`.`User`
-- -----------------------------------------------------
CREATE TABLE [User] (
    [user_id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [first_name] VARCHAR(30) NULL,
    [last_name] VARCHAR(30) NULL,
    [cnic] VARCHAR(15) NULL UNIQUE,
    [dob] DATETIME NULL,
    [gender] VARCHAR(10) NULL,
    [username] VARCHAR(15) NULL UNIQUE,
    [password] VARCHAR(15) NULL,
    [type] VARCHAR(15) NULL
);

-- -----------------------------------------------------
-- Table `Onestop`.`Issuance`
-- -----------------------------------------------------
CREATE TABLE [ISSUANCEFORM] (
    [form_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [phone] VARCHAR(15) NULL,
    [email] VARCHAR(30) NULL,
    [doc_type] VARCHAR(15) NULL,
	[start_year] VARCHAR(4) NULL,	-- Degree Starting Year(Needed to generate Degree)
	[end_year] VARCHAR(4) NULL		-- Degree Ending Year(Needed to generate Degree)
);

-- -----------------------------------------------------
-- Table `Onestop`.`Request`
-- -----------------------------------------------------
CREATE TABLE [Request] (
    [request_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [user_id] INT NULL,
    [form_id] INT NULL,
    [status] VARCHAR(45) NULL,
	[submit_date] DATETIME NULL DEFAULT GETDATE(),
	[est_complete] DATETIME NULL DEFAULT DATEADD(day, 10, GETDATE()), 

    CONSTRAINT [request_user_id] FOREIGN KEY ([user_id])
        REFERENCES [User] ([user_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [request_issuance_id] FOREIGN KEY ([form_id])
        REFERENCES [IssuanceForm] ([form_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `Onestop`.`Activity`
-- -----------------------------------------------------
CREATE TABLE [Activity] (
    [activity_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [request_id] INT NULL,
    [description] VARCHAR(45) NULL,
	[department] VARCHAR(15) NULL,
    [timestamp] DATETIME NULL DEFAULT GETDATE(),

    CONSTRAINT [activity_request_id] FOREIGN KEY ([request_id])
        REFERENCES [Request] ([request_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `Onestop`.`Notification`
-- -----------------------------------------------------
CREATE TABLE [Notification] (
    [notification_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [user_id] INT NULL,
	[rcv_group] VARCHAR(15) NULL,
    [description] VARCHAR(60) NULL,
    [timestamp] DATETIME NULL DEFAULT GETDATE(),
    CONSTRAINT [notification_user_id] FOREIGN KEY ([user_id])
        REFERENCES [User] ([user_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `Onestop`.`Bill`
-- -----------------------------------------------------
CREATE TABLE [Bill] (
    [bill_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [request_id] INT NULL,
    [amount] INT NULL,
    [status] VARCHAR(10) NULL,
    [generated_on] DATETIME NULL DEFAULT GETDATE(),
    [paid_on] DATETIME NULL,
    CONSTRAINT [bill_request_id] FOREIGN KEY ([request_id])
        REFERENCES [Request] ([request_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `Onestop`.`Department`
-- -----------------------------------------------------
CREATE TABLE [Department] (
    [dept_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [dept_name] VARCHAR(30) NULL,
    [dept_code] VARCHAR(5) NULL
);

-- -----------------------------------------------------
-- Table `Onestop`.`Degree`
-- -----------------------------------------------------
CREATE TABLE [Degree] (
    [degree_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [user_id] INT NULL,
    [dept_id] INT NULL,
    [batch] VARCHAR(15) NULL,  -- 2021,2022 etc
    [level] VARCHAR(40) NULL,  -- Bachelors, Masters, PhD, Post Doctorate etc

    CONSTRAINT [degree_user_id] FOREIGN KEY ([user_id])
        REFERENCES [User] ([user_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [degree_dept_id] FOREIGN KEY ([dept_id])
        REFERENCES [Department] ([dept_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `Onestop`.`Transcript`
-- -----------------------------------------------------
CREATE TABLE [Transcript] (
    [transcript_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [user_id] INT NULL,
    [cgpa] CHAR(5) NULL,
    [start_year] SMALLINT NULL,
    [end_year] SMALLINT NULL,
    CONSTRAINT [transcript_user_id] FOREIGN KEY ([user_id])
        REFERENCES [User] ([user_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `Onestop`.`Course`
-- -----------------------------------------------------
CREATE TABLE [Course] (
    [course_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [course_code] VARCHAR(8) NULL,
    [course_name] VARCHAR(45) NULL,
	[credit_hrs] TINYINT NULL
);

-- -----------------------------------------------------
-- Table `Onestop`.`Grade`
-- -----------------------------------------------------
CREATE TABLE [Grade] (
    [grade_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [transcript_id] INT NULL,
    [course_id] INT NULL,
    [letter_grade] char(3) NULL,
    CONSTRAINT [grade_transcript_id] FOREIGN KEY ([transcript_id])
        REFERENCES [Transcript] ([transcript_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT [grade_course_id] FOREIGN KEY ([course_id])
        REFERENCES [Course] ([course_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `Onestop`.`Complaint`
-- -----------------------------------------------------
CREATE TABLE [Complaint] (
    [complaint_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [user_id] INT NULL,
    [description] VARCHAR(45) NULL,
    [doc_type] VARCHAR(10) NULL,
    CONSTRAINT [complaint_user_id] FOREIGN KEY ([user_id])
        REFERENCES [User] ([user_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);


-- -----------------------------------------------------
-- Table `Onestop`.`CreditCard`
-- -----------------------------------------------------
CREATE TABLE [CreditCard] (
    [card_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [cardno] VARCHAR(20) NULL,
    [code] VARCHAR(5) NULL,
    [balance] INT NULL
);

-- -----------------------------------------------------
-- Table `Onestop`.`Wallet`
-- -----------------------------------------------------
CREATE TABLE [Wallet] (
    [wallet_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [phone] VARCHAR(15) NULL,
    [balance] INT NULL
);

-- -----------------------------------------------------
-- Table `Onestop`.`Objection`
-- -----------------------------------------------------
CREATE TABLE [Comment] (
    [obj_id] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[cmt_from] VARCHAR(45) NULL,
    [request_id] INT NULL,
    [description] VARCHAR(45) NULL,
    [timestamp] DATETIME NULL DEFAULT GETDATE(),
    CONSTRAINT [objection_request_id] FOREIGN KEY ([request_id])
        REFERENCES [Request] ([request_id])
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
Go
CREATE TRIGGER NewRequest
ON REQUEST
AFTER INSERT AS 
BEGIN
	INSERT INTO NOTIFICATION(user_id, rcv_group, description)
	VALUES (null, 'Admin', 'New Issuance Request Recieved');
END
drop Trigger NewRequest

INSERT INTO ONESTOP.DBO.[User](first_name, last_name, cnic, dob, gender, username, password, type) VALUES
('Emma', 'Jones', '8901234567890', '1991-02-15', 'Female', 'emma.jones', '1234', 'Admin'),
('John', 'Doe', '52345-78901-3', '1990-01-01', 'Male', 'john.doe', '1234', 'Director' ),
('Jane', 'Doe', '52345-78901-4', '1991-02-02', 'Female', '21I-0301', '1234', 'Student'),
('Alice', 'Smith', '45678-90123-4', '1985-03-10', 'Female', '21I-0302', '1234', 'Student'),
('David', 'Smith', '52345-78901-5', '1980-03-03', 'Male', 'david.smith', '1234', 'FYP Staff'),
('Sarah', 'Johnson', '52345-78901-6', '1985-04-04', 'Female', 'sarah.johnson', '1234', 'Finance Staff'),
('Michael', 'Brown', '52345-78901-7', '1975-05-05', 'Male', 'michael.brown', '1234', 'Finance Staff'),
('Emily', 'Davis', '52345-78901-8', '1988-06-06', 'Female', 'emily.davis', '1234', 'Admin'),
('Daniel', 'Martin', '52345-78901-9', '1982-07-07', 'Male', '21I-0305', '1234', 'Student'),
('Rachel', 'Garcia', '12345-78901-0', '1992-08-08', 'Female', '21I-0300', '1234', 'Student'),
('Sophia', 'Miller', '67890-12345-6', '1993-07-10', 'Female', '21I-0401', '123', 'Student'),
('James', 'Wilson', '01234-56789-1', '1995-10-25', 'Male', '21I-0601', '1234', 'Student'),
('Emily', 'Williams', '23456-78901-4', '1994-06-30', 'Female', '21I-0801', '1234', 'Student');

INSERT INTO ONESTOP.DBO.Department
(dept_name, dept_code) VALUES
('Computer Science', 'CS'),
('Artificial Intelligence', 'AI'),
('Data Science', 'DS'),
('Cyber Security', 'CY'),
('Software Engineering', 'SE'),
('Electrical Engineering', 'EE'),
('Management Sciences', 'BA');


INSERT INTO [Course] ([course_code], [course_name], [credit_hrs]) VALUES 
('CS101', 'Introduction to Computer Science', 3),
('CS201', 'Data Structures and Algorithms', 4),
('CS301', 'Operating Systems', 4),
('CS401', 'Database Management Systems', 4),
('CS501', 'Computer Networks', 4),
('CS601', 'Software Engineering', 4),
('CS701', 'Artificial Intelligence', 4),
('CS801', 'Machine Learning', 4),
('CS901', 'Computer Graphics', 4),
('CS1001', 'Web Development', 4),
('CS1101', 'Mobile Application Development', 4),
('CS1201', 'Cybersecurity', 4),
('CS1301', 'Cloud Computing', 4),
('CS1401', 'Big Data Analytics', 4),
('CS1501', 'Blockchain Technology', 4),
('CS1601', 'Internet of Things', 4),
('CS1701', 'Data Science', 4),
('CS1801', 'Computer Vision', 4),
('CS1901', 'Quantum Computing', 4),
('CS2001', 'Bioinformatics', 4);

DECLARE @counter INT;
SET @counter = 1;
WHILE @counter <= 7
BEGIN
    DECLARE @transcript_id INT;
    SET @transcript_id = @counter;

    DECLARE @course_counter INT;
    SET @course_counter = 1;

    WHILE @course_counter <= 20
    BEGIN
        DECLARE @course_id INT;
        SET @course_id = @course_counter;

        DECLARE @letter_grade CHAR(1);
        SET @letter_grade = CHAR(ROUND(RAND() * 4 + 65, 0)); -- Random letter grade A, B, C, D

        INSERT INTO [Grade] ([transcript_id], [course_id], [letter_grade]) VALUES 
        (@transcript_id, @course_id, @letter_grade);

        SET @course_counter = @course_counter + 1;
    END;

    SET @counter = @counter + 1;
END;
--SELECT 'Server=' + @@SERVERNAME + ';Database=' + DB_NAME() + ';Integrated Security=True;' AS ConnectionString;

