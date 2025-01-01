CREATE DATABASE shopping_trends;

USE shopping_trends;
CREATE TABLE CustomerDetails (
    `Customer ID` INT PRIMARY KEY,
    `Age` INT,
    `Gender` VARCHAR(10),
    `Item Purchased` VARCHAR(255),
    `Category` VARCHAR(255),
    `Purchase Amount (USD)` DECIMAL(10, 2),
    `Location` VARCHAR(255),
    `Size` VARCHAR(50),
    `Color` VARCHAR(50),
    `Season` VARCHAR(50),
    `Review Rating` DECIMAL(3, 2),
    `Subscription Status` VARCHAR(50),
    `Shipping Type` VARCHAR(50),
    `Discount Applied` VARCHAR(3), -- To store "YES" or "NO"
    `Promo Code Used` VARCHAR(50),
    `Previous Purchases` INT,
    `Payment Method` VARCHAR(50),
    `Frequency of Purchases` VARCHAR(50)
);

-- Easy
-- Ques1. Retrieve all customers who are subscribed.
SELECT *
FROM CustomerDetails
WHERE `Subscription Status` = 'Yes';

-- Ques2. Find the total number of customers who applied a discount.
SELECT * 
FROM CustomerDetails
WHERE `Discount Applied` = 'Yes';

-- Ques3. List all purchases made during the "Winter" season.
SELECT *
FROM CustomerDetails
WHERE Season = 'Winter';

-- Intermediate
-- Ques4. Calculate the average purchase amount for each category.
SELECT Category, 
avg(`Purchase Amount (USD)`) as Avg_purchase_amt
FROM CustomerDetails
GROUP BY Category;

-- Ques5. Retrieve the top 3 locations with the highest total purchase amount.
SELECT Location, 
SUM(`Purchase Amount (USD)`) AS TotalAmount
FROM CustomerDetails
GROUP BY Location
ORDER BY TotalAmount DESC
LIMIT 3;

-- Ques6: Find all customers who used a promo code and rated their purchase above 4.
SELECT * FROM CustomerDetails 
WHERE `Promo Code Used` IS NOT NULL AND `Review Rating` > 4;

-- Ques7: List the most frequent item sizes purchased and their frequency.
SELECT Size, COUNT(*) AS frequency
FROM CustomerDetails
GROUP BY Size
ORDER BY frequency desc;

-- Ques8: Determine the total purchase amount for each payment method.
SELECT `Payment Method`, 
SUM(`Purchase Amount (USD)`) AS TotalAmount 
FROM CustomerDetails 
GROUP BY `Payment Method`;

-- Hard Ques
-- Ques9: Identify the customer who has made the highest number of previous purchases.
SELECT `Customer ID`, 
Max(`Previous Purchases`) AS Max_purchase
FROM CustomerDetails;

-- Ques10: Calculate the total purchases and average purchase amount for each subscription status.
SELECT `Subscription Status`, 
COUNT(*) AS TotalPurchases, 
AVG(`Purchase Amount (USD)`) AS AvgAmount 
FROM CustomerDetails 
GROUP BY `Subscription Status`;

-- Ques11: Find the top 5 customers by purchase amount along with their average review rating.
SELECT `Customer ID`,
SUM(`Purchase Amount (USD)`) AS MaxAmount, 
AVG(`Review Rating`) AS AvgReview
FROM CustomerDetails
GROUP BY `Customer ID`
ORDER BY MaxAmount DESC
LIMIT 5;

-- Ques12: Identify the most popular category by total purchases and purchase amount.
SELECT `Category`, COUNT(*) AS TotalPurchases, 
SUM(`Purchase Amount (USD)`) AS TotalAmount 
FROM CustomerDetails 
GROUP BY `Category` 
ORDER BY TotalPurchases DESC, 
TotalAmount DESC 
LIMIT 1;

-- Ques13: Find the average purchase amount and total reviews by season and gender.
SELECT `Season`, `Gender`, 
AVG(`Purchase Amount (USD)`) AS AvgPurchaseAmount, 
COUNT(`Review Rating`) AS TotalReviews 
FROM CustomerDetails 
GROUP BY `Season`, `Gender`;
