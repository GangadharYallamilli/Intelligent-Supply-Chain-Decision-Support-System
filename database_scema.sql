create database supply_chain;
use supply_chain;
create table supply_data(
product_type varchar(50),
sku VARCHAR(50),
    price FLOAT,
    availability INT,
    number_of_products_sold INT,
    revenue_generated FLOAT,
    customer_demographics VARCHAR(50),
    stock_levels INT,
    lead_time INT,
    order_quantities INT,
    shipping_times INT,
    shipping_carriers VARCHAR(50),
    shipping_costs FLOAT,
    supplier_name VARCHAR(50),
    location VARCHAR(50),
    lead_time_alt INT,
    production_volumes INT,
    manufacturing_lead_time INT,
    manufacturing_costs FLOAT,
    inspection_results VARCHAR(50),
    defect_rates FLOAT,
    transportation_modes VARCHAR(50),
    routes VARCHAR(50),
    costs FLOAT,
    total_cost FLOAT,
    profit FLOAT,
    delay_risk INT,
    stock_risk INT
);
-- view
SELECT * FROM supply_data;

-- Demand by Product
SELECT product_type, 
       SUM(number_of_products_sold) AS total_demand
FROM supply_data
GROUP BY product_type
ORDER BY total_demand DESC; 

-- Revenue by Product
SELECT product_type, 
       SUM(revenue_generated) AS total_revenue
FROM supply_data
GROUP BY product_type
ORDER BY total_revenue DESC;

-- Best Suppliers (Fast Delivery)
SELECT supplier_name, 
       AVG(lead_time) AS avg_lead_time
FROM supply_data
GROUP BY supplier_name
ORDER BY avg_lead_time;

-- High Defect Suppliers
SELECT supplier_name, 
       AVG(defect_rates) AS avg_defect
FROM supply_data
GROUP BY supplier_name
ORDER BY avg_defect DESC;

-- Cost by Transport Mode
SELECT transportation_modes, 
       AVG(total_cost) AS avg_cost
FROM supply_data
GROUP BY transportation_modes
ORDER BY avg_cost;

-- High Risk Products
SELECT product_type, 
       SUM(delay_risk) AS delay_cases,
       SUM(stock_risk) AS stock_issues
FROM supply_data
GROUP BY product_type;

SELECT * FROM final_output;

DROP TABLE IF EXISTS final_output;
USE supply_chain;
DROP TABLE IF EXISTS final_output;
RENAME TABLE final_supply_chain_output TO final_output;

USE supply_chain;
SHOW TABLES;

SELECT * FROM final_output LIMIT 5;


USE supply_chain;

DROP TABLE IF EXISTS final_output;

DROP TABLE final_output;

CREATE TABLE final_output (
    product_type VARCHAR(50),
    price FLOAT,
    stock_levels INT,
    original_demand FLOAT,
    demand_new FLOAT,
    demand_increase FLOAT,
    delay_risk_after INT,
    profit FLOAT,
    profit_after FLOAT,
    decision VARCHAR(50),
    scenario VARCHAR(50)
);


SELECT scenario, COUNT(*) 
FROM final_output 
GROUP BY scenario;

