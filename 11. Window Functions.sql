-- Topic   : Window Functions
-- Concepts : OVER(), PARTITION BY, rolling totals, ROW_NUMBER(),RANK(), DENSE_RANK()

-- Key difference from GROUP BY:
--   GROUP BY collapses rows into one row per group.
--   Window functions keep every individual row while still letting you compute group-level calculations alongside them.

-- GROUP BY (for comparison)
-- Collapses rows — only one row per gender is returned.
select gender, avg(salary) as AVR_salary 
From employee_demographics dem
Join employee_salary Sal
	on dem.employee_id = Sal.employee_id 
group by gender;

-- OVER() — applies the function across the entire result set
-- without any grouping or collapsing of rows.

select gender, avg(salary) over() As overall_avg_salary  -- lookas the avarage salary for the whole column 
From employee_demographics dem
Join employee_salary Sal
	on dem.employee_id = Sal.employee_id ;
    
-- PARTITION BY — like GROUP BY, but rows are NOT collapsed.
-- Each row still appears; the aggregate is computed per partition.
SELECT dem.first_name, gender, AVG(salary) OVER(PARTITION BY gender) AS avg_sal
From employee_demographics dem
Join employee_salary Sal
	on dem.employee_id = Sal.employee_id ;

-- SUM with PARTITION BY
select dem.first_name, gender, 
SUM(salary) over( partition by gender ) Sum_Sal -- lookas the avarage salary for the whole column but it will not be effected if we add another column
From employee_demographics dem
Join employee_salary Sal
	on dem.employee_id = Sal.employee_id ;
    
-- Rolling Total
-- Adding ORDER BY inside OVER() creates a cumulative/running
-- total — each row shows the sum up to and including that row.

select dem.first_name, gender,salary, 
SUM(salary) over( partition by gender order by dem.employee_id ) roling_total -- lookas the avarage salary for the whole column but it will not be effected if we add another column
From employee_demographics dem
Join employee_salary Sal
	on dem.employee_id = Sal.employee_id ;
    
-- ROW_NUMBER, RANK, DENSE_RANK

-- ROW_NUMBER  : always unique; no ties; 1, 2, 3, 4 ...
-- RANK        : ties share a rank; next rank skips numbers; 1, 1, 3 ...
-- DENSE_RANK  : ties share a rank; next rank does NOT skip; 1, 1, 2 ...
    
-- ROW_NUMBER across the whole table (no partition)
select dem.first_name, gender,salary,
row_number() over() -- the row numbers will not repeat themselves unless partitioned
From employee_demographics dem
Join employee_salary Sal
	on dem.employee_id = Sal.employee_id ;
    
-- ROW_NUMBER partitioned by gender, ranked by salary descending
select dem.first_name, gender,salary,
row_number() over(partition by gender order by salary desc) -- the row numbers will not repeat themselves unless partitioned
From employee_demographics dem
Join employee_salary Sal
	on dem.employee_id = Sal.employee_id 
;
    
-- Side-by-side comparison of all three ranking functions
    select dem.first_name, gender,salary,
row_number() over(partition by gender order by salary desc) row_num,
Rank() over(partition by gender order by salary desc) rank_num,
Dense_Rank() over(partition by gender order by salary desc) rank_num -- the row numbers will not repeat themselves unless partitioned
From employee_demographics dem
Join employee_salary Sal
	on dem.employee_id = Sal.employee_id 
;
    