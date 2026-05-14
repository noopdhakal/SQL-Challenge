-- Create the table
CREATE TABLE Sales (
    Product VARCHAR(50),
    Year INT,
    Amount DECIMAL(10,2)

);

-- Insert sample data
INSERT INTO Sales (Product, Year, Amount) VALUES
('Laptop', 2024, 1000),
('Laptop', 2025, 1200),
('Mobile', 2024, 800),
('Mobile', 2025, 950),
('Tablet', 2024, 600),
('Tablet', 2025, 750),
('Monitor', 2024, 400),
('Monitor', 2025, 500);

select * from sales;

select * from 
 (
    select product, year, amount from SALES
) sourceTable
pivot (
    sum(amount) for year in (2024, 2025)
) pivottables;
