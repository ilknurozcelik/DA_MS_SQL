/* WHERE CONDITION */

SELECT *
FROM CUSTOMERS
WHERE CITY='�STANBUL'

SELECT *
FROM CUSTOMERS
WHERE CITY <> '�STANBUL'

SELECT *
FROM CUSTOMERS
WHERE BIRTHDATE < '19900101'

SELECT *
FROM CUSTOMERS
WHERE BIRTHDATE < '19971024'

SELECT *
FROM CUSTOMERS
WHERE BIRTHDATE <= '19971024'

SELECT *
FROM CUSTOMERS
WHERE BIRTHDATE BETWEEN '19900101' AND '19981231'

SELECT *
FROM CUSTOMERS
WHERE AGE BETWEEN '22' AND '30'

SELECT *
FROM CUSTOMERS
WHERE CUSTOMERNAME LIKE 'AL�%'

SELECT *
FROM CUSTOMERS
WHERE CUSTOMERNAME LIKE '%ALP'

SELECT *
FROM CUSTOMERS
WHERE CUSTOMERNAME LIKE '%ALA%'

SELECT *
FROM CUSTOMERS
WHERE CUSTOMERNAME NOT LIKE 'AL�%'

SELECT *
FROM CUSTOMERS
WHERE CITY IN('�STANBUL','ANKARA')

SELECT *
FROM CUSTOMERS
WHERE CITY IN('�STANBUL')

SELECT *
FROM CUSTOMERS
WHERE CITY IN('�STANBUL','ANKARA', '�ZM�R', 'BURSA')

/* WE CAN USE WHERE CONDITION W�TH UPDATE METHOD */

UPDATE CUSTOMERS SET GENDER='ERKEK' WHERE GENDER='E'
UPDATE CUSTOMERS SET GENDER='KADIN' WHERE GENDER='K'

/* WE CAN USE WHERE CONDITION W�TH DELETE METHOD */

DELETE FROM CUSTOMERS WHERE ID=18

/* AND OR OPERATORS */

SELECT *
FROM CUSTOMERS
WHERE CITY='�STANBUL' AND DISTRICT='BEYL�KD�Z�'
AND DISTRICT='ESENLER' -- BURADA HATA VER�R. ��NK� DISTRICT HEM BEYL�KD�Z� HEM ESENLER OLAMAZ.

SELECT *
FROM CUSTOMERS
WHERE CITY='�STANBUL' AND GENDER='ERKEK'

SELECT *
FROM CUSTOMERS
WHERE CITY='�STANBUL' AND GENDER='ERKEK' AND DISTRICT='ESENLER'

SELECT *
FROM CUSTOMERS
WHERE CITY='�STANBUL'
AND GENDER='ERKEK'
AND BIRTHDATE BETWEEN '19900101' AND '20000101'

SELECT *
FROM CUSTOMERS
-- WHERE CITY='�STANBUL' OR CITY='iZM�R' OR CITY='BURSA'
WHERE CITY IN('�STANBUL','�ZM�R','BURSA')

SELECT *
FROM CUSTOMERS
-- WHERE BIRTHDATE BETWEEN '19900101' AND '19981231'
WHERE BIRTHDATE >= '19900101' AND BIRTHDATE <='19981231'

SELECT *
FROM CUSTOMERS
WHERE BIRTHDATE <= '19900101' OR BIRTHDATE <='19981231'

SELECT *
FROM CUSTOMERS
WHERE BIRTHDATE BETWEEN '19900101' AND '19981231'

SELECT *
FROM CUSTOMERS
-- WHERE NOT BIRTHDATE BETWEEN '19900101' AND '19981231'  -- BU KOMUT ALTTAK� �LE AYNI ��� YAPIYOR
WHERE BIRTHDATE < '19900101' OR BIRTHDATE <'19981231'

/* DISTINCT METHOD

SELECT DISTINCT
COLUMN1, COLUMN2, COLUMN3,...
FROM TABLENAME
WHERE <CONDITIONS>

*/

SELECT DISTINCT CITY
FROM CUSTOMERS

SELECT CITY, DISTRICT
FROM CUSTOMERS
WHERE CITY='�STANBUL'

-- YUKARIDAK� SORGUDA DISTRICT SATIRINDA TEKRAR EDEN SATIRLAR D�NMEKTED�R.
-- BUNU �NLEMEK ���N DISTINCT METODUNU KULLANIRIZ.

SELECT DISTINCT GENDER  --SADECE �K� GENDER OLD. ���N DISTINCT �LE SADECE �K� SATIR D�NER. 
FROM CUSTOMERS

SELECT AGE
FROM CUSTOMERS

SELECT DISTINCT AGE
FROM CUSTOMERS

/* ORDER BY */

/* syntax� a�a��daki gibidir.

SELECT
COLUMN1, COLUMN2, COLUMN3,...
FROM TABLENAME
WHERE <CONDITIONS>
ORDER BY COLUMN1 ASC, COLUMN2 DESC, COLUMN3 ASC...
*/

SELECT *
FROM CUSTOMERS
ORDER BY ID DESC

SELECT *
FROM CUSTOMERS
ORDER BY BIRTHDATE DESC

SELECT *
FROM CUSTOMERS
ORDER BY CITY

SELECT *
FROM CUSTOMERS
ORDER BY CITY, CUSTOMERNAME

SELECT *
FROM CUSTOMERS
ORDER BY CITY, CUSTOMERNAME DESC

SELECT *
FROM CUSTOMERS
ORDER BY CITY, DISTRICT, CUSTOMERNAME

SELECT *
FROM CUSTOMERS
WHERE GENDER = 'KADIN'
ORDER BY CITY, DISTRICT, CUSTOMERNAME

/* TOP  METODU nu sorgudan d�nen kay�tlar�n bir k�sm�n� g�rmek istedi�imizde kullan�r�z*/

/* syntax� a�a��daki gibidir.

SELECT TOP N
COLUMN1, COLUMN2, CLOUMN3, ...
FROM TABLENAME
WHERE <CONDITIONS>
*/

SELECT 
TOP 100 
* FROM CUSTOMERS

SELECT 
TOP 100 
* FROM CUSTOMERS
ORDER BY CUSTOMERNAME

SELECT 
TOP 200 
* FROM CUSTOMERS
ORDER BY CUSTOMERNAME

SELECT 
TOP 10 
* FROM CUSTOMERS
ORDER BY CUSTOMERNAME

SELECT 
TOP 50 
* FROM CUSTOMERS
ORDER BY CUSTOMERNAME

SELECT 
TOP 100 PERCENT
* FROM CUSTOMERS
ORDER BY CUSTOMERNAME

SELECT 
TOP 50 PERCENT
* FROM CUSTOMERS
ORDER BY CUSTOMERNAME

SELECT 
TOP 10 PERCENT
* FROM CUSTOMERS
ORDER BY CUSTOMERNAME

SELECT 
TOP 1 PERCENT
* FROM CUSTOMERS
ORDER BY CUSTOMERNAME

/* GROUP BY  METODU AGGREGATE FUNCTIONS LAR �LE KULLANILIR. BUNLAR:

SUM, M�N, MAX, AVG, COUNT
*/

/* SYNTAXI A�A�IDAK� G�B�D�R:

SELECT
SUM(PRICE), COUNT(ID), MIN(PRICE), MAX(PRICE),
AVG(PRICE)
FROM TABLENAME
*/

SELECT * FROM SALES

SELECT * FROM SALES ORDER BY AMOUNT

--BIR URUNDDEN EN AZ VE EN �OK NE KADAR SATILDI�INI BULMAK ���N

SELECT MIN(AMOUNT), MAX(AMOUNT), COUNT(*)  --VEYA COUNT(COLUMNNAME) �EKL�NDE DE KULLANILAB�L�R
FROM SALES

-- TOPLAM KA� ADET �R�N SATILDI�INI DA BULMAK ���N

SELECT MIN(AMOUNT), MAX(AMOUNT), COUNT(FICHENO), SUM(AMOUNT)
FROM SALES

-- ORTALAMA KA� ADET �R�N SATILDI�INI DA BULMAK ���N

SELECT MIN(AMOUNT), MAX(AMOUNT), COUNT(FICHENO), SUM(AMOUNT), AVG(AMOUNT)
FROM SALES

/* ��MD� DE F�YATLAR �ZER�NDEN SORGU YAPALIM */

SELECT * FROM SALES ORDER BY TOTALPRICE

SELECT MIN(TOTALPRICE), MAX(TOTALPRICE), COUNT(TOTALPRICE), SUM(TOTALPRICE), AVG(TOTALPRICE)
FROM SALES

-- AGG FONKS�YONLARI WHERE KO�ULU �LE KULLANALIM

SELECT MIN(TOTALPRICE), MAX(TOTALPRICE), COUNT(TOTALPRICE), SUM(TOTALPRICE), AVG(TOTALPRICE)
FROM SALES
WHERE CITY ='ADANA'

SELECT MIN(TOTALPRICE), MAX(TOTALPRICE), COUNT(TOTALPRICE), SUM(TOTALPRICE), AVG(TOTALPRICE)
FROM SALES
WHERE CITY = 'ANKARA'

SELECT MIN(TOTALPRICE), MAX(TOTALPRICE), COUNT(TOTALPRICE), SUM(TOTALPRICE), AVG(TOTALPRICE)
FROM SALES
WHERE CITY = '�STANBUL'