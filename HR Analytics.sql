use newschema;
SELECT * FROM newschema.`hr data`;
-- Total Employees;
SELECT Count(EmployeeNumber) as Total_Employees
FROM newschema.`hr data`;

-- Total Female
SELECT count(gender) AS total_female
FROM newschema.`hr data`
WHERE gender = 'female';
-- Total Male
-- Total Female
SELECT count(gender) AS total_female
FROM newschema.`hr data`
WHERE gender = 'male';

-- Total Attrition 
SELECT
  sum(Attrition = 'Yes') AS attrition_count
  FROM newschema.`hr data`;
  
-- Attrition Rate

SELECT
  CONCAT(FORMAT((SUM(attrition = 'Yes') * 100.0) / COUNT(*), 2), '%') AS attrition_rate_percentage
FROM newschema.`hr data` ;

  -- department wise employees attrition
  SELECT
  department,
  SUM(attrition = 'Yes') AS attrition_count
FROM newschema.`hr data`
GROUP BY department;

SELECT
  COALESCE(department, 'Grand Total') AS department,
  SUM(attrition = 'Yes') AS attrition_count
FROM newschema.`hr data`
GROUP BY department WITH ROLLUP;

-- Education wise Attrition
SELECT
  COALESCE(EducationField, 'Grand Total') AS education_field,
  SUM(attrition = 'Yes') AS attrition_count
FROM newschema.`hr data`
GROUP BY education_field WITH ROLLUP;

-- department wise Business Travel Count
SELECT
  department,
  businesstravel,
  COUNT(*) AS employee_count
FROM newschema.`hr data`
GROUP BY department, businesstravel WITH ROLLUP;

SELECT
  department,
  businesstravel,
  COUNT(*) AS employee_count
FROM newschema.`hr data`
GROUP BY department, businesstravel;

-- Attrition rate Vs Monthly income stats

WITH AttritionRate AS (
  SELECT
    (SUM(attrition= 'Yes') * 100.0) / COUNT(*) AS attrition_rate_percentage
  FROM newschema.`hr data`
),
MonthlyIncomeStats AS (
  SELECT
    MIN(monthlyincome) AS min_monthly_income,
    MAX(monthlyincome) AS max_monthly_income,
    AVG(monthlyincome) AS avg_monthly_income
    
  FROM newschema.`hr data`
)

SELECT
  attrition_rate_percentage,
  min_monthly_income,
  max_monthly_income,
  avg_monthly_income
FROM AttritionRate, MonthlyIncomeStats;

-- Average working years for each Department

SELECT
  department,
  AVG(Totalworkingyears) AS avg_working_years
FROM newschema.`hr data`
GROUP BY department;

-- Average Hourly rate of Male Research Scientist
SELECT
  AVG(hourlyrate) AS avg_hourly_rate
FROM newschema.`hr data`
WHERE gender = 'Male' AND jobRole = 'Research Scientist';













  




