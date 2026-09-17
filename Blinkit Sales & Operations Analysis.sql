CREATE DATABASE blinkit_db;
USE blinkit_db;

CREATE TABLE blinkit_orders_1000 (
    order_id INT,
    customer_id INT,
    city VARCHAR(50),
    product_category VARCHAR(50),
    product_name VARCHAR(50),
    quantity INT,
    price_per_unit INT,
    payment_mode VARCHAR(20),
    delivery_time_minutes INT,
    order_date DATETIME,
    total_amount INT
);
SELECT COUNT(*) FROM blinkit_orders_1000;

                     /*Queries*/
                     
  /*QUERY 1: Show first 10 orders*/    
      SELECT * 
      FROM blinkit_orders_1000
      LIMIT 10;

  /*QUERY 2: Total number of orders*/    
        SELECT COUNT(*) AS total_orders
        FROM blinkit_orders_1000;

/*QUERY 3: Total revenue generated*/   
       SELECT SUM(total_amount) AS total_revenue
       FROM blinkit_orders_1000;


/*QUERY 4: Average order value*/   
     SELECT AVG(total_amount) AS avg_order_value
     FROM blinkit_orders_1000;


/*QUERY 5: Orders by city*/   
      SELECT city, COUNT(*) AS total_orders
      FROM blinkit_orders_1000
      GROUP BY city;


/*QUERY 6: Revenue by city*/   
     SELECT city, SUM(total_amount) AS revenue
     FROM blinkit_orders_1000
     GROUP BY city;


/*QUERY 7: Most ordered product category*/   
    SELECT product_category, COUNT(*) AS orders
    FROM blinkit_orders_1000
    GROUP BY product_category
    ORDER BY orders DESC;
    
    /*QUERY 8:Top 5 highest value orders*/ 
          SELECT order_id, total_amount
          FROM blinkit_orders_1000
          ORDER BY total_amount DESC
          LIMIT 5;

    
    /*QUERY 9: Average delivery time*/ 
          SELECT AVG(delivery_time_minutes)
          FROM blinkit_orders_1000;

    
    /*QUERY 10:Orders by payment mode*/ 
             SELECT payment_mode, COUNT(*) AS orders
             FROM blinkit_orders_1000
			GROUP BY payment_mode;

   /*QUERY 11:Customers with more than 3 orders*/ 
             SELECT customer_id, COUNT(*) AS order_count
             FROM blinkit_orders_1000
             GROUP BY customer_id
             HAVING COUNT(*) > 3;

   
   /*QUERY 12:Daily order trend*/ 
		SELECT DATE(order_date) AS order_day, COUNT(*) AS orders
		FROM blinkit_orders_1000
        GROUP BY DATE(order_date);

   
   
   /*QUERY 13:Revenue by product category*/ 
            SELECT product_category, SUM(total_amount) AS revenue
            FROM blinkit_orders_1000
            GROUP BY product_category;

   
   
   /*QUERY 14:Orders delivered under 15 minutes*/ 
                SELECT COUNT(*) AS fast_deliveries
                FROM blinkit_orders_1000
                WHERE delivery_time_minutes < 15;

/*QUERY 15:City with highest average order value*/
     SELECT city, AVG(total_amount) AS avg_order_value
     FROM blinkit_orders_1000
     GROUP BY city
     ORDER BY avg_order_value DESC
     LIMIT 1;

