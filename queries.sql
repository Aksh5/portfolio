*Creating TABLE Orders (
OrderID INT PRIMARY KEY,
    OrderDate DATE,
    Amount INT,
    Customer_ID INT,
    StoreName VARCHAR(50)
);

-- Inserting Data for 2023
INSERT INTO Orders (OrderID, OrderDate, Amount, Customer_ID, StoreName) VALUES
(973, '2023-09-12', 9151, 32, 'BCD'),
(974, '2023-02-01', 2500, 19, 'ABC'),
(975, '2023-03-15', 5200, 15, 'FYK'),
(976, '2023-06-22', 6800, 50, 'PQR'),
(977, '2023-10-09', 3900, 28, 'XYZ'),
(978, '2023-01-20', 4500, 22, 'XYZ'),
(979, '2023-04-25', 7200, 37, 'ABC'),
(980, '2023-08-15', 3100, 40, 'BCD'),
(981, '2023-11-05', 1800, 55, 'FYK'),
(982, '2023-07-03', 9800, 26, 'XYD'),
(983, '2023-06-16', 8250, 41, 'BCD'),
(984, '2023-09-29', 5700, 36, 'PQR'),
(985, '2023-05-14', 6000, 18, 'SME'),
(986, '2023-03-20', 7150, 49, 'FYK'),
(987, '2023-01-30', 5300, 33, 'MNO'),
(988, '2023-12-02', 4200, 58, 'XYZ'),
(989, '2023-10-17', 2450, 32, 'FYK'),
(990, '2023-06-28', 3750, 22, 'ABC'),
(991, '2023-08-08', 9000, 28, 'XYZ'),
(992, '2023-02-14', 6400, 44, 'BCD'),
(993, '2023-11-01', 7700, 46, 'FYK'),
(994, '2023-09-18', 7200, 25, 'ABC'),
(995, '2023-10-28', 8600, 31, 'PQR'),
(996, '2023-07-19', 2500, 37, 'XYZ'),
(997, '2023-12-01', 5600, 42, 'XYD'),
(998, '2023-04-30', 3800, 51, 'BCD'),
(999, '2023-03-09', 8500, 24, 'FYK'),
(1000, '2023-01-18', 4200, 33, 'SME');
-- Inserting Data for 2024
INSERT INTO Orders (OrderID, OrderDate, Amount, Customer_ID, StoreName) VALUES
(1073, '2024-01-15', 5600, 41, 'PQR'),
(1074, '2024-02-20', 6950, 29, 'ABC'),
(1075, '2024-03-25', 4300, 19, 'XYZ'),
(1076, '2024-04-30', 5300, 34, 'SME'),
(1077, '2024-06-18', 3950, 40, 'BCD'),
(1078, '2024-07-05', 5000, 51, 'FYK'),
(1079, '2024-08-10', 4800, 53, 'PQR'),
(1080, '2024-09-22', 7200, 25, 'XYZ'),
(1081, '2024-10-14', 3400, 44, 'ABC'),
(1082, '2024-11-09', 7500, 50, 'BCD'),
(1083, '2024-12-03', 8600, 33, 'FYK');

-- Inserting Data for 2025
INSERT INTO Orders (OrderID, OrderDate, Amount, Customer_ID, StoreName) VALUES
(1973, '2025-01-10', 7626, 19, 'ABC'),
(1974, '2025-02-14', 6512, 25, 'XYZ'),
(1975, '2025-03-05', 4312, 38, 'PQR'),
(1976, '2025-05-22', 8100, 50, 'MNO'),
(1977, '2025-07-10', 3920, 42, 'BCD'),
(1978, '2025-08-12', 6000, 19, 'FYK'),
(1979, '2025-09-18', 4530, 33, 'XYZ'),
(1980, '2025-11-09', 3350, 36, 'ABC'),
(1981, '2025-12-01', 7250, 29, 'PQR'),
(1982, '2025-04-25', 6400, 51, 'XYZ'),
(1983, '2025-06-07', 5900, 49, 'FYK'),
(1984, '2025-01-18', 5050, 37, 'BCD'),
(1985, '2025-03-30', 7800, 52, 'MNO'),
(1986, '2025-07-22', 9500, 44, 'XYZ'),
(1987, '2025-08-20', 4100, 28, 'SME'),
(1988, '2025-09-15', 7200, 31, 'FYK'),
(1989, '2025-10-10', 8100, 34, 'XYZ'),
(1990, '2025-12-14', 7900, 23, 'ABC');

-- Calculate Sales by Year

select
StoreName,
sum(case when year(OrderDate) = 2023 then Amount else 0 end) as Sales_2023,
sum(case when year (OrderDate) = 2024 then Amount else 0 end) as Sales_2024,
sum(case when year (OrderDate) = 2025 then Amount else 0 end) as Sales_2025
from Orders
Group by StoreName
Order by StoreName;

--Calculates Total Spent by Customer 

select  Customer_ID, 
sum(case when year  (OrderDate) = 2023 then Amount else 0 end) as Total_Spent_2023,
sum(case when year  (OrderDate) = 2024 then Amount else 0 end) as Total_Spent_2024,
sum(case when year  (OrderDate) = 2025 then Amount else 0 end) as Total_Spent_2025
from  Orders
group by Customer_ID
Order by Customer_ID;

--Calculate Sale for the year 2024

select StoreName,
sum(Amount) as Total_Sales_2024
From Orders
where year(OrderDate) = 2024
group by StoreName
Order by Total_Sales_2024 desc;

--Calculate the most Orders

select Customer_ID,
count(OrderID) as Total_Orders
from Orders
group by Customer_ID
order by Total_Orders desc;

Calculates average spent for 2025

select  Customer_ID,
avg(Amount) as Avg_Spent_2025
from Orders
where year(OrderDate) = 2025
group by Customer_ID
order by Avg_Spent_2025 desc;
