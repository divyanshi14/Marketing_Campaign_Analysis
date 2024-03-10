
-- 1. Total Customers

SELECT COUNT(DISTINCT ID) AS Total_Customers FROM Marketing_Data



-- 2. Total Countries

SELECT COUNT(DISTINCT Country) AS Total_Coutnry FROM Marketing_Data



-- 3. Total Website Views

SELECT SUM(NumWebVisitsMonth) AS Total_WebsiteViews FROM Marketing_Data



-- 4. Total Complains

SELECT SUM(Complain) AS Toatal_Complains FROM Marketing_Data



-- 5. Web Purchases by Birth Year

WITH table1 AS
(SELECT CASE
           WHEN Year_Birth BETWEEN 1893 AND 1902 THEN '1893-1902'
		   WHEN Year_Birth BETWEEN 1933 AND 1942 THEN '1933-1942'
		   WHEN Year_Birth BETWEEN 1943 AND 1952 THEN '1943-1952'
		   WHEN Year_Birth BETWEEN 1953 AND 1962 THEN '1953-1962'
		   WHEN Year_Birth BETWEEN 1963 AND 1972 THEN '1963-1972'
		   WHEN Year_Birth BETWEEN 1973 AND 1982 THEN '1973-1982'
		   WHEN Year_Birth BETWEEN 1983 AND 1992 THEN '1983-1992'
		   WHEN Year_Birth BETWEEN 1993 AND 2002 THEN '1993-2002'
	   END AS Birth_Year,
	   NumWebPurchases
FROM Marketing_Data
)
SELECT Birth_Year, SUM(NumWebPurchases) AS Num_of_Web_Purchases  
FROM table1
GROUP BY Birth_Year
ORDER BY Birth_Year



-- 6. Web Purchases by Education Type

SELECT Education AS EducationType, SUM(NumWebPurchases) AS Num_of_Web_Purchases
FROM Marketing_Data
GROUP BY Education



-- 7. Web Purchases by Marital Status

SELECT Marital_Status , SUM(NumWebPurchases) AS Num_of_Web_Purchases
FROM Marketing_Data
GROUP BY Marital_Status



-- 8. Web Purchases by Coutry

SELECT Country , SUM(NumWebPurchases) AS Num_of_Web_Purchases
FROM Marketing_Data
GROUP BY Country



-- 9. Which Marketing Campaign was most Successful

SELECT
(SELECT SUM(AcceptedCmp1) FROM Marketing_Data) AS AcceptedCmp1,
(SELECT SUM(AcceptedCmp2) FROM Marketing_Data) AS AcceptedCmp2,
(SELECT SUM(AcceptedCmp3) FROM Marketing_Data) AS AcceptedCmp3,
(SELECT SUM(AcceptedCmp4) FROM Marketing_Data) AS AcceptedCmp4,
(SELECT SUM(AcceptedCmp5) FROM Marketing_Data) AS AcceptedCmp5,
(SELECT SUM(Response) FROM Marketing_Data) AS LastCampaign



-- 10. Customer Count by Birth Year

WITH table1 AS
(SELECT CASE
           WHEN Year_Birth BETWEEN 1893 AND 1902 THEN '1893-1902'
		   WHEN Year_Birth BETWEEN 1933 AND 1942 THEN '1933-1942'
		   WHEN Year_Birth BETWEEN 1943 AND 1952 THEN '1943-1952'
		   WHEN Year_Birth BETWEEN 1953 AND 1962 THEN '1953-1962'
		   WHEN Year_Birth BETWEEN 1963 AND 1972 THEN '1963-1972'
		   WHEN Year_Birth BETWEEN 1973 AND 1982 THEN '1973-1982'
		   WHEN Year_Birth BETWEEN 1983 AND 1992 THEN '1983-1992'
		   WHEN Year_Birth BETWEEN 1993 AND 2002 THEN '1993-2002'
	   END AS Birth_Year,
	   ID
FROM Marketing_Data
)
SELECT Birth_Year, COUNT(ID) AS Num_of_Customer  
FROM table1
GROUP BY Birth_Year
ORDER BY Birth_Year



-- 11. Customer Count by Education Type

SELECT Education AS EducationType, COUNT(ID) AS Num_of_Customer
FROM Marketing_Data
GROUP BY Education



-- 12. Customer Count by Marital Status

SELECT Marital_Status, COUNT(ID) AS Num_of_Customer 
FROM Marketing_Data
GROUP BY Marital_Status



-- 13. Customer Count by Country

SELECT Country, COUNT(ID) AS Num_of_Customer 
FROM Marketing_Data
GROUP BY Country



-- 14. Sales by Product

SELECT 
(SELECT SUM(MntWines) FROM Marketing_Data) AS Wines_Sales,
(SELECT SUM(MntFruits) FROM Marketing_Data) AS Fruits_Sales,
(SELECT SUM(MntMeatProducts) FROM Marketing_Data) AS MeatProducts_Sales,
(SELECT SUM(MntFishProducts) FROM Marketing_Data) AS FishProducts_Sales,
(SELECT SUM(MntSweetProducts) FROM Marketing_Data) AS SweetProducts_Sales,
(SELECT SUM(MntGoldProds) FROM Marketing_Data) AS GoldProducts_Sales



-- 15. Purchases by Channel

SELECT
(SELECT SUM(NumDealsPurchases) FROM Marketing_Data) AS DealPurchases,
(SELECT SUM(NumWebPurchases) FROM Marketing_Data) AS WebPurchases,
(SELECT SUM(NumCatalogPurchases) FROM Marketing_Data) AS CatalogPurchases,
(SELECT SUM(NumStorePurchases) FROM Marketing_Data) AS StorePurchases
