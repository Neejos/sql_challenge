#create a view of avg Salary by title

create view title_emp As
select Round(Avg(s.salary),2) As "Avg_Salary",t.title
from (employees as e
join salaries as s
on e.emp_no=s.emp_no)
JOIN titles as t
on  e.emp_title_id = t.title_id
group by t.title;
 
select * from title_emp