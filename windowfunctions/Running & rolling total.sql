SELECT 
    orderdate,
    orderid,
   productid,
    sales,
      avg(sales) OVER (partition by productid) AS avgbyproduct,
      avg(sales) OVER (partition by productid order by orderdate) AS moving_avg,
       avg(sales) OVER (partition by productid order by orderdate rows between current row and 1 following) AS rolling_avg
FROM orders;
