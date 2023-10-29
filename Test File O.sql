
-------------------------------------------------------------------- Test File -----------------------------------------------------------

---------------------------------------- Procedure to create Exam--------------------

exec Creating_Exam 'C# Exam' , 'Corrective' , '2023-09-10', 100 , 2024 , 1,1

--------------------------------- Choose questions of exam ---------------------------

exec insert_Question 1,10,20,1,1

------------------------------- Choose single Student for Exam -----------------------

exec Choose_Single_Student_for_Exam 1,18,1,1,'01:00:00','03:00:00'

-------------------------- Adding Students of specific Course in specific track ------

exec Choose_Students_for_Exam_in_Course 1,1,19,'12:34:56','14:34:56'

--------------------------------- Create Random Questions depend on course id -------

exec Choosing_Random_Exam_Questions 1,1,10,18,10

---------- Update Single Value in Exam Table  --------------------------------------

exec Update_Single_Exam_Value 1,'Date','2023-09-5',18

----------------- Update Multi Values Exam Table  -----------------------------------

declare @Updates ExamMultiValueUpdateType 
insert into @Updates
values
('Date','2023-09-15')
exec Update_Multi_Exam_Value  @Updates,20,1

-------------------------------- Update in Student Exam ------------------------------

exec Update_Single_Student_Exam_Value 1, 'Start_Time' , '12:30:56',20

------------------------------------Update in Question Pool --------------------------

declare @Updates Question_pool_Type 
insert into @Updates
values
('Choice_1','test'),
('Choice_2','test 2 ')
exec Update_Multi_Question_Pool_Value  @Updates,1,1,1

------------------------------------------ Update in Question Exam table --------------

exec Update_on_Question_Degree_IN_Exam_Table 1,1,20,4,5

-------------------------------------------------- Delete in Exam Table ----------------

exec Delete_From_Exam_Table 1,20
 


