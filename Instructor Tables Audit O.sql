--we make audiots table that help us to know what occur on the table of Exam table 

-------------------------------------- Instructor Tables Audit --------------------------

------------------------------Exam table Audit ---------
create table Exam_Table_Audit
(
	Exam_ID int ,
	Exam_Name nvarchar(50),
	Exam_Type nvarchar(50),
	Exam_Date date ,
	Exam_total_Degree int ,
	Exam_Year int,
	Exam_Instructor_ID int ,
	Exam_Course_ID int,
	Status varchar(50) ,
	Date date ,
	constraint Status_Check_ check (Status in ('Deleted','inserted','updated'))
)
drop table  Exam_Table_Audit
------------------------------Exam Student_table Audit ---------
create table Student_Table_Audit
(
	Student_Exam_ID int,
	Student_Exam_Student_ID  int,
	Student_Exam_Start_Time time(7),
	Student_Exam_End_Time time(7),
	Final_Result int,
	Status varchar(50) ,
	Date date ,
	constraint Status_Check_Student_Table check (Status in ('Deleted','inserted','updated'))
)

------------------------------------------------------------------ Trigger for Insert in Exam Table ------------------------------------------------------

create trigger Exam_Audit on [Courses].[Exam]
after insert 
as 
begin 
	insert into Exam_Table_Audit ([Exam_ID],[Exam_Name],[Exam_Type],[Exam_Date],[Exam_total_Degree],[Exam_Year],[Exam_Instructor_ID],[Exam_Course_ID],[Status],[Date])
	select [Exam_ID] = i.[ID] , [Exam_Name] = i.[Name] ,[Exam_Type]=i.[Type], [Exam_Date] = i.[Date] , [Exam_total_Degree] = i.[total_degree] , [Exam_Year] = i.[year] ,
	[Exam_Instructor_ID] = i.[Instructor_ID] , [Exam_Course_ID] = i.Course_ID , 'inserted' , GETDATE()
	from inserted i

end

------------------------------------------------------------------ Trigger for Update in Exam Table ------------------------------------------------------

alter trigger Exam_Audit_Update on [Courses].[Exam]
after UPDATE
as
begin
	insert into Exam_Table_Audit ([Exam_ID], [Exam_Name],[Exam_Type], [Exam_Date], [Exam_total_Degree], [Exam_Year], [Exam_Instructor_ID], [Exam_Course_ID], [Status], [Date])
	select [Exam_ID] = i.[ID], [Exam_Name] = i.[Name],[Exam_Type]=i.[Type], [Exam_Date] = i.[Date], [Exam_total_Degree] = i.[total_degree], [Exam_Year] = i.[year],
		[Exam_Instructor_ID] = i.[Instructor_ID], [Exam_Course_ID] = i.Course_ID, 'updated', GETDATE()
	from inserted i
end

------------------------------------------------------------------ Trigger for delete from Exam Table ----------------------------------------------------

alter trigger Exam_Audit_Delete on [Courses].[Exam]
after delete
as
begin
	insert into Exam_Table_Audit ([Exam_ID], [Exam_Name],[Exam_Type], [Exam_Date], [Exam_total_Degree], [Exam_Year], [Exam_Instructor_ID], [Exam_Course_ID], [Status], [Date])
	select [Exam_ID] = i.[ID], [Exam_Name] = i.[Name],[Exam_Type]=i.[Type], [Exam_Date] = i.[Date], [Exam_total_Degree] = i.[total_degree], [Exam_Year] = i.[year],
		[Exam_Instructor_ID] = i.[Instructor_ID], [Exam_Course_ID] = i.Course_ID, 'Deleted', GETDATE()
	from deleted i
end

------------------------------------------------------------------- Trigger for Insert in Student-Exam Table ---------------------------------------------

alter trigger Student_Exam_Audit on [Members].[Student_Exam]
after insert 
as 
begin 
	insert into Student_Exam_Table_Audit (Student_Exam_ID,	Student_Exam_Student_ID,Student_Exam_Start_Time,Student_Exam_End_Time,Final_Result,[Status],[Date])
	select Student_Exam_ID =i.Exam_ID , Student_Exam_Student_ID =i.Student_ID , Student_Exam_Start_Time=i.Start_Time , Student_Exam_End_Time=i.End_Time ,0, 'inserted',getdate()
	from inserted i 
end

----------------------------------------------------------------Trigger for Update in Student_Exam Table ------------------------------------------------------

alter trigger Student_Exam_Update_Audit on [Members].[Student_Exam]
after update 
as 
begin 
	insert into Student_Exam_Table_Audit (Student_Exam_ID,	Student_Exam_Student_ID,Student_Exam_Start_Time,Student_Exam_End_Time,Final_Result,[Status],[Date])
	select Student_Exam_ID =i.Exam_ID , Student_Exam_Student_ID =i.Student_ID , Student_Exam_Start_Time=i.Start_Time , Student_Exam_End_Time=i.End_Time ,0, 'updated',getdate()
	from inserted i 
end

------------------------------------------------------------- Trigger for Delet in Student Exam Table --------------------------------------------------------- 

alter trigger Student_Exam_Delete_Audit on [Members].[Student_Exam]
after delete 
as 
begin 
	insert into Student_Exam_Table_Audit (Student_Exam_ID,	Student_Exam_Student_ID,Student_Exam_Start_Time,Student_Exam_End_Time,Final_Result,[Status],[Date])
	select Student_Exam_ID =i.Exam_ID , Student_Exam_Student_ID =i.Student_ID , Student_Exam_Start_Time=i.Start_Time , Student_Exam_End_Time=i.End_Time ,0, 'Deleted',getdate()
	from inserted i 
end