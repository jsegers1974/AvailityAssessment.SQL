/*
a.	Write a SQL query that will produce a reverse-sorted list (alphabetically by name) of customers (first and last names) whose last name begins with the letter ‘S.’

I think the question here is to order by an alias so I ordered desc by 'fullname' alias.
*/

select c.custid, c.lastname, c.firstname, c.firstname + ' ' + c.lastname as fullname
from AvailityAssessment1.dbo.customer c
where c.LastName like 's%'
order by fullname desc

/*
b.	Write a SQL query that will show the total value of all orders each customer has placed in the past six months. Any customer without any orders should show a $0 value.
*/
select c.custId, c.lastname, c.firstname, sum(isnull(ol.cost,0) * isnull(ol.quantity,0)) as AmountSpent
from AvailityAssessment1.dbo.customer c
left join AvailityAssessment1.dbo.[Order] o on o.custid = c.custid and datediff("MM",o.OrderDate,getdate()) <= 6
left join AvailityAssessment1.dbo.OrderLine ol on ol.orderid = o.orderid
group by c.CustID, c.lastname, c.firstname


/*
a.	Amend the query from the previous question to only show those customers who have a total order value of more than $100 and less than $500 in the past six months.
*/
select c.custId, c.lastname, c.firstname, sum(isnull(ol.cost,0) * isnull(ol.quantity,0)) as AmountSpent
from AvailityAssessment1.dbo.customer c
left join AvailityAssessment1.dbo.[Order] o on o.custid = c.custid and datediff("MM",o.OrderDate,getdate()) <= 6
left join AvailityAssessment1.dbo.OrderLine ol on ol.orderid = o.orderid
group by c.CustID, c.lastname, c.firstname
having sum(isnull(ol.cost,0) * isnull(ol.quantity,0)) > 100 and sum(isnull(ol.cost,0) * isnull(ol.quantity,0)) < 500



