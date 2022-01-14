--PART 1
ALTER SESSION SET CURRENT_SCHEMA = BUILDER2;

--PART 2
DESCRIBE BUILDER2.STOCK;

--PART A
SELECT STOCK_CODE, STOCK_DESCRIPTION, UNIT_PRICE, UNITCOSTPRICE, (UNIT_PRICE - UNITCOSTPRICE) PROFIT FROM BUILDER2.STOCK
Where (UNIT_PRICE - UNITCOSTPRICE) < 0;

--PART B
--SELECT STOCK_CODE, STOCK_DESCRIPTION, TO_CHAR(UNIT_PRICE, 'U9,999,999.99'), TO_CHAR(UNITCOSTPRICE, 'U9,999,999.99'), TO_CHAR((UNIT_PRICE - UNITCOSTPRICE), 'U9,999,999.99') PROFIT FROM BUILDER2.STOCK;
SELECT STOCK_CODE, STOCK_DESCRIPTION FROM BUILDER2.STOCK
WHERE STOCK.REORDER_level = 1;

--PART C
SELECT CUSTOMER_NAME FROM CUSTOMER
WHERE NOT EXISTS 
(SELECT CUSTOMER_ID FROM CORDER WHERE 
CORDER.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID);

--PART D
SELECT STOCK_DESCRIPTION FROM STOCK
JOIN CORDERLINE ON STOCK.STOCK_CODE = CORDERLINE.STOCK_CODE
JOIN CORDER ON CORDERLINE.CORDERNO = CORDER.CORDERNO
JOIN CUSTOMER ON CORDER.CUSTOMER_ID =  CUSTOMER.CUSTOMER_ID
WHERE CUSTOMER.CUSTOMER_NAME LIKE 'Nick Knowles';

--PART E
SELECT SUPPLIER_NAME FROM BUILDER2.SUPPLIER
WHERE NOT EXISTS (SELECT STOCK_CODE FROM BUILDER2.STOCK
WHERE SUPPLIER.SUPPLIER_ID = STOCK.SUPPLIER_ID);

--PART F
SELECT CUSTOMER_ID FROM CUSTOMER
JOIN CORDER ON CUSTOMER.CUSTOMER_ID = CORDER.CUSTOMER_ID
JOIN CORDERLINE ON CORDER.CORDERNO = CORDERLINE.CORDERNO
JOIN STOCK ON CORDERLINE.STOCK_CODE = STOCK.STOCK_CODE
WHERE STOCK_CODE LIKE 'A101'
OR STOCK_CODE LIKE'A111';

--PART 3.G
SELECT STAFF_NAME FROM STAFF
JOIN CORDER ON STAFF.STAFF_NO = CORDER.STAFFPAID
JOIN CUSTOMER ON CORDER.CUSTOMER_ID = CUSTOMER.CUSTOMER_ID
WHERE CUSTOMER_NAME LIKE 'John Flaherty';

--PART 3.H
SELECT STOCK_CODE, STOCK_DESCRIPTION, REORDER_LEVEL FROM BUILDER2.STOCK ORDER BY REORDER_LEVEL;

--PART 3.I
SELECT STOCK_CODE, UNIT_PRICE * .10, UNITCOSTPRICE * 10 FROM BUILDER2.STOCK;

--PART 3.J
SELECT STOCK_CODE, UNIT_PRICE * .10, UNITCOSTPRICE * 10, (UNIT_PRICE - UNITCOSTPRICE) PROFIT FROM BUILDER2.STOCK;

--PART 4
ALTER SESSION SET CURRENT_SCHEMA = POBYRNE;

--PART 4.A
DESCRIBE POBYRNE.MOVIES;