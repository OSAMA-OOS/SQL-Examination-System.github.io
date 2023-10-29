-----------exec the procdure student_insert-------

--procedure that add answer for question while exame running and add  score for answer and calculate final result

--@exam_id int,@student_id int,@pool_question int,@answer nvarchar
   EXEC student_insert  15,3,6,'1'
   EXEC student_insert  15,3,7,'1'
   EXEC student_insert  15,3,9,'1'


delete from Student_Answer where Pool_Question_ID>5
-----------exec the procdure student_update_answer-------
--procedure that change answer while exame running and add new score for answer and calculate final result 
--@exam_id int,@student_id int,@pool_question int,@answer nvarchar 
  EXEC student_update_answer 15,3,6,'1'
  EXEC student_update_answer 15,3,6,'3'
  EXEC student_update_answer 15,3,6,'4'
select*from students_pass_exam
select*from student_answer
-----------exec the procdure student_result  -------
--procedure that show result of exam that student sign in 
 
--@student_id int,@exam_id int
 EXEC student_result 3,15
 EXEC student_result 1,15
 EXEC student_result 4,15
 



 -------view to show final answer for student and score he achieved
        select Exam_Name,Question,Answer,correct_answer,Score 
		from result where Student_id=3 and Exam_id=15

 -------view to show students who pass the exam and final result 
   select Student_ID,student_name,course_name ,Final_Result,'Congratulations you passed the exam'as Exam_Result
    from students_pass_exam 
 
 -------view to show students who failed in the exam
    select Student_ID,student_name,course_name ,Final_Result,'Unfortunately, you failed in the exam'as Exam_Result
    from students_failed_exam 

--------

select * from Instructor_Manager