-- know the tables and schemas in my databse 
SELECT 
	TABLE_NAME AS table_name,
    TABLE_SCHEMA AS schema_name
    
FROM 
    INFORMATION_SCHEMA.TABLES
WHERE 
    TABLE_TYPE = 'BASE TABLE'
    AND TABLE_CATALOG = 'ExaminationSystem'
order by(schema_name);
-------------------------------------------------------------------------------
-- retrive the all accounts  
SELECT 
    p.name AS login_name,
    dp.name AS user_name
FROM 
    sys.database_principals dp
JOIN 
    sys.server_principals p ON dp.sid = p.sid
WHERE 
    dp.type IN ('S', 'U', 'G')
    AND dp.name <> 'guest' and dp.name <> 'dbo';
------------------------------------------------------------------------------------
-- now we will test our database 
--********************************************************************************--
-- first test all roles of the training manger

--1 manage baranch table(insert,update and delete)
exec AddBranch
	@id=7,
	@name='ITI-Alex',
	@department_id=1,
	@user='Eng_Mrihan',
	@password='123';

select top 1 * from [Department].[Branch] order by(id) desc 

--1. 2 manage baranch table(update)
exec UpdateBranch
	@id=7,
	@name='ITI-Alexandria',
	@dep_id=1,
	@user='Eng_Mrihan',
	@pass='123';
select top 1 * from [Department].[Branch] order by(id) desc 

--1. 3 manage baranch table(delete)
exec DeleteBranch
	@name='ITI-Alexandria',
	@user='Eng_Mrihan',
	@pass='123'
select top 1 * from [Department].[Branch] order by(id) desc 

--*****************************************************************************--
--2 manage intake table(insert,update and delete) 
-- 2-1 add new intake
exec AddIntake
	@id=6,
	@name='.Net 23-24 Q1',
	@startdate = '2023/07/05',
	@enddate= '2023/11/05',
	@user='Eng_Mrihan',
	@pass='123';
select top 1 * from [Department].[Intake] order by(id) desc 

-- 2-2 update intake
exec UpdateIntake
	@id=6,
	@name='Mern_Stack 23-24 Q1', --we change name from .net to mern
	@startdate = '2023/07/05',
	@enddate= '2023/11/05',
	@user='Eng_Mrihan',
	@pass='123';
select top 1 * from [Department].[Intake] order by(id) desc

--2-3 delete intake
exec DeleteIntake
	@name='Mern_Stack 23-24 Q1',
	@user='Eng_Mrihan',
	@pass='123';
select top 1 * from [Department].[Intake] order by(id) desc
--**************************************************************--
--3 manage Track table(insert,update and delete) 
-- 3-1 add new Track
exec AddTrack
	@id=9,
	@name='Full stack .Net',
	@user='Eng_Mrihan',
	@pass='123';
select top 1 * from [Department].[Track] order by(id) desc

-- 3-2 update Track
exec UpdateTrack
	@oldName='Full stack .Net',
	@newName='Mern_Stack', --we change name from .net to mern
	@user='Eng_Mrihan',
	@pass='123';
select top 1 * from [Department].[Track] order by(id) desc

-- 3-3 delete track
exec DeleteTrack
	@name='Mern_Stack',
	@user='Eng_Mrihan',
	@pass='123';
select top 1 * from [Department].[Track] order by(id) desc
--**************************************************************--
--4 manage course table
--4.1 add new course
exec AddCourse
@id=10,
@name='Bootstarb',
@description='course to make responsive website',
@mindegree=50,
@maxdegree=100,
@instructorId=2,
@user='Eng_Mrihan',
@pass='123'

select top 1 * from  [Courses].[Course] order by(id)  desc
--4.2 update new course
exec UpdateCourse
@id=10, @name='Bootstarb',
@description='course to make responsive website',
@mindegree=50, @maxdegree=100,
@instructorId=1, --cahnge the instructor id
@user='Eng_Mrihan',
@pass='123'
select top 1 * from  [Courses].[Course] order by(id)  desc

--4.3 delete course
exec DeleteCourse
@name='Bootstarb',
@user='Eng_Mrihan',
@pass='123';
select top 1 * from  [Courses].[Course] order by(id)  desc
--**************************************************************--
--5 manage the instructor table(insert,update,delete)
--5.1 update instructors
exec AddInstructor
@id=21,
@name='belal',
@Instusername='belal',
@Instpass='123',
@manger_id=1,
@roleType='instructor',
@user='Eng_Mrihan',
@pass='123'

select top 1 * from [Members].Instructor  order by(id)  desc
--5.2 update instructors
exec UpdateInstructor
	@id=21,
	@name='hussien',
	@Instusername='hussien',
	@Instpass='123',
	@manger_id=1,
	@roleType='instructor',
	@user='Eng_Mrihan',
	@pass='123'
select top 1 * from [Members].Instructor  order by(id)  desc
--5.3 delete instructor
exec DeleteInstructor
@name='hussien',
@user='Eng_Mrihan',
@pass='123'
select top 1 * from [Members].Instructor  order by(id)  desc
--**************************************************************--
--6 manage the student table
--6.1 Add new student
----exec
use ExaminationSystem
exec AddStudent 
	@id=51,
	@name='omar',
	@student_user='omar',
	@student_pass='123',
	@Role_type='student',
	@Address='minya',
	@intacke_id=3,
	@user='Eng_mrihan',
	@pass='123'
select top 1 * from [Members].Student  order by(id)  desc
--6.2 update student
exec UpdateStudent
	@id=51, @name='maged',
	@student_user='maged', @student_pass='123',
	@Role_type='student', @Address='minya',
	@intacke_id=2,  --change the id of intake
	@user='Eng_mrihan',
	@pass='123'
select top 1 * from [Members].Student  order by(id)  desc

--6.3 delete student
exec DeleteStudent
@name='maged',
@user='Eng_Mrihan',
@pass='123'
select top 1 * from [Members].Student  order by(id)  desc
--**************************************************************************************--
--- test instructors rolement 
--The Instructor has a user and login access to the database he can read the data and write a data in one schema (Course Schema).
--1 add question into question pool 
-- add question type of choose
EXEC AddQuestions
    @question_type = 'MCQ',
    @text = 'Which of the following is 
	not a valid SQL type',
    @choice_1 = 'FLOAT',
    @choice_2 = 'NUMERIC',
    @choice_3 = 'DECIMAL',
    @choice_4 = 'Int',
    @answer = 'CHARACTER',
    @course_id = 1,
    @instructor_id = 1;

-- add qouestion type of text
EXEC AddQuestions
    @question_type = 'text',
    @text = 'Which statement is
	used to delete 
	all rows in a table without having
	the action logged',
    @answer = 'TRUNCATE',
    @course_id = 1,
    @instructor_id = 1;
-- add qouestion type of true/false
EXEC AddQuestions
    @question_type = 'true&false',
	@choice_1='True',
	@choice_2='False',
    @text = 'SQL Views are also known as
	Virtual tables',
    @answer = 'true',
    @course_id = 1,
    @instructor_id = 1;
select top 3 * from [Courses].[Question_Pool] order by(id) desc
-----------------------------
--view to show the instructor and its edit question details
select * from Show_QuestionsPool_Edit_Details
-----------------------------
--2 update question in the question pool 
exec UpdateQuestions
	@id=36,
    @question_type = 'true&false',
    @text = 'SQL Views are also known as
	actual tables',
    @answer = 'false',
    @course_id = 1,
    @instructor_id = 1;

--3 delete quesition from pool questions
exec DeleteQuestion 
@id=39,
@ins_id=1,
@course_id=1

-----------------------------
-- show all operation tha occuered on the question pool
select * from [dbo].[Audiot_QuestionPool]
