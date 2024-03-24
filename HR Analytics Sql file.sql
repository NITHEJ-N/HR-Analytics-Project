create database projecthr;
use projecthr;
select * from HR1;
select * from HR2;

#KPI 1
 select Department, round((count(if(Attrition="Yes",1,null)) / count(*)*100),2) as AttritionRate from HR1 
 group by Department 
 order by Department;
 
 #KPI 2
 select Gender, JobRole, round(avg( HourlyRate),2) as HourlyRate  from HR1 where Gender="Male" and JobRole="Research Scientist" 
 group by JobRole order by JobRole;
 
 #KPI3 
 select Department, round((count(if(Attrition="Yes",1,null)) / count(*)*100),2) as AttritionRate, sum(MonthlyIncome) as MonthlyIncome from HR1
 inner join HR2 ON (HR1.EmployeeID=HR2.EmployeeID)
 group by Department;
 
 #KPI4
select Department,round(avg(TotalWorkingYears),2) as Years from HR1 inner join HR2 ON (HR1.EmployeeID=HR2.EmployeeID)
 group by Department;
 
 #KPI5
select JobRole, avg( WorkLifeBalance) as WorkBalance from HR1 inner join HR2 ON (HR1.EmployeeID=HR2.EmployeeID)
   group by JobRole;
   

#KPI6
select Department,max( YearsSinceLastPromotion) as years, round((count(if(Attrition="Yes",1,null)) / count(*)*100),2) as AttritionRate from HR1
 inner join HR2 ON (HR1.EmployeeID=HR2.EmployeeID)
 group by Department;
