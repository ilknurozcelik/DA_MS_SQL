SELECT * FROM USERS

SELECT * FROM [dbo].[ADDRESS]

SELECT * FROM [dbo].[CITIES]

SELECT * FROM [dbo].[COUNTRIES]

SELECT * FROM [dbo].[DISTRICTS]

SELECT * FROM [dbo].[INVOICEDETAILS]

SELECT * FROM [dbo].[INVOICES]

SELECT * FROM [dbo].[ITEMS]

SELECT * FROM [dbo].[ORDERDETAILS]

SELECT * FROM [dbo].[ORDERS]

SELECT * FROM [dbo].[PAYMENTS]

SELECT * FROM [dbo].[TOWNS]

SELECT * FROM [dbo].[USERS]

SELECT U.USERNAME_ AS KULLANICIADI, U.NAMESURNAME AS ADSOYAD, CT.CITY AS IL, T.TOWN AS ILCE,
	D.DISTRICT AS SEMT, A.ADDRESSTEXT AS ACIKADRES, O.ID AS SIPARISID, O.DATE_ AS TARIH,
	O.TOTALPRICE AS TOPLAMTUTAR, P.DATE_ AS ODEMETARIHI, P.APPROVECODE AS BANKAONAYKODU,
	I.DATE_ AS FATURATARIHI, I.CARGOFICHENO AS KARGOFISNO, ITM.ITEMCODE AS URUNKONU, ITM.ITEMNAME AS URUNADI,
	OD.AMOUNT AS MIKTAR, OD.UNITPRICE AS BIRIMFIYAT, OD.LINETOTAL AS SATIRTOPLAMI
FROM ORDERS O
INNER JOIN USERS U ON U.ID=O.USERID
INNER JOIN ADDRESS A ON A.ID= O.ADDRESSID
INNER JOIN CITIES CT ON CT.ID=A.CITYID
INNER JOIN TOWNS T ON T.ID=A.TOWNID
INNER JOIN DISTRICTS D ON D.ID=A.DISTRICTID
INNER JOIN PAYMENTS P ON P.ORDERID=O.ID
INNER JOIN INVOICES I ON I.ORDERID=O.ID
INNER JOIN ORDERDETAILS OD ON OD.ORDERID=O.ID
INNER JOIN ITEMS ITM ON ITM.ID=OD.ITEMID
WHERE O.ID=26121

--U.NAMESURNAME='Ceyda GEZG�NC�'

/* �EH�RLERE G�RE TOPLAM S�PAR��LER� L�STELEME */

SELECT 
	CT.CITY AS SEHIRADI,
	SUM(OD.LINETOTAL) AS TOPLAMSIPARISTUTARI,
	SUM(OD.AMOUNT) AS TOPLAMSIPARISADEDI,
	COUNT(OD.ID) TOPLAMSIPARISSAYISI
FROM ORDERS O
	INNER JOIN USERS U ON U.ID=O.USERID
	INNER JOIN ADDRESS A ON A.ID= O.ADDRESSID
	INNER JOIN CITIES CT ON CT.ID=A.CITYID
	INNER JOIN TOWNS T ON T.ID=A.TOWNID
	INNER JOIN DISTRICTS D ON D.ID=A.DISTRICTID
	INNER JOIN PAYMENTS P ON P.ORDERID=O.ID
	INNER JOIN INVOICES I ON I.ORDERID=O.ID
	INNER JOIN ORDERDETAILS OD ON OD.ORDERID=O.ID
	INNER JOIN ITEMS ITM ON ITM.ID=OD.ITEMID
GROUP BY CT.CITY
ORDER BY CT.CITY


/* �R�N KATEGOR�LER�NE G�RE S�PAR�� DA�ILIMI */


SELECT ITM.CATEGORY1, ITM.CATEGORY2, ITM.CATEGORY3,
	SUM(OD.LINETOTAL) AS TOPLAMSIPARISTUTARI,
	SUM(OD.AMOUNT) AS TOPLAMSIPARISADEDI,
	COUNT(OD.ID) TOPLAMSIPARISSAYISI
FROM ORDERS O
	INNER JOIN USERS U ON U.ID=O.USERID
	INNER JOIN ADDRESS A ON A.ID= O.ADDRESSID
	INNER JOIN CITIES CT ON CT.ID=A.CITYID
	INNER JOIN TOWNS T ON T.ID=A.TOWNID
	INNER JOIN DISTRICTS D ON D.ID=A.DISTRICTID
	INNER JOIN PAYMENTS P ON P.ORDERID=O.ID
	INNER JOIN INVOICES I ON I.ORDERID=O.ID
	INNER JOIN ORDERDETAILS OD ON OD.ORDERID=O.ID
	INNER JOIN ITEMS ITM ON ITM.ID=OD.ITEMID
WHERE ITM.CATEGORY1='KOZMETIK'
GROUP BY ITM.CATEGORY1, ITM.CATEGORY2, ITM.CATEGORY3
ORDER BY 4 DESC

/* TAR�HE G�RE S�PAR�� DA�ILIMI */

