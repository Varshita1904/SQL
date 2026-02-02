with cte as(select person_name, sum(weight) over(Rows between unbounded 
preceding and current row) as s
from Queue
order by turn)

select  person_name
from cte
where s<=1000
order by s desc
limit 1
