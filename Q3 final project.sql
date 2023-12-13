SELECT * FROM finalproject.projectfinalsql;


SELECT DISTINCT SUBSTRING(`Order ID`, 1, 2) AS CountryCode
FROM projectfinalsql;


SELECT City, MAX(Profit) AS TopProfit
FROM projectfinalsql
GROUP BY City
ORDER BY TopProfit DESC
LIMIT 5; 



WITH RankedData AS (
  SELECT *, ROW_NUMBER() OVER (ORDER BY Sales DESC) AS rnk
  FROM projectfinalsql
)
SELECT * FROM RankedData WHERE rnk = 1;


SELECT DISTINCT City, State
FROM projectfinalsql;



SELECT *
FROM projectfinalsql
WHERE Sales > 500;



SELECT *,
       CASE
         WHEN Sales <= 100 THEN 'Low'
         WHEN Sales <= 500 THEN 'Medium'
         WHEN Sales <= 2000 THEN 'High'
         ELSE 'Best'
       END AS SalesCategory
FROM projectfinalsql;


SELECT City, Region,
       SUM(Sales) AS TotalSales,
       SUM(Profit) AS TotalProfits,
       COUNT(Sales) AS SalesCount,
       COUNT(Profit) AS ProfitCount
FROM projectfinalsql
GROUP BY City, Region;


SELECT *
FROM projectfinalsql
WHERE Region IN ('East', 'West') AND Sales > 500;




SELECT City, Sales,RANK() OVER(PARTITION BY City ORDER BY Sales DESC),
    DENSE_RANK() OVER(PARTITION BY City ORDER BY Sales DESC) FROM projectfinalsql;






