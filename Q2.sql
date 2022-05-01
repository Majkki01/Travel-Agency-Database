-- Find the sum of payments of reservations, for each seller that processed these reservations. Give the name, surname and the highest sums of gathered paymentes for each gender of the sellers.
-- Order these sums in descending order.


CREATE VIEW [Sellers Payment gathered] AS

SELECT People.firstName, People.surname, SUM(Reservations.Payment) AS PaymentSUM, 
CASE
	WHEN People.firstName LIKE '%a' THEN 'Female'
	ELSE 'Male'
END AS Gender

FROM (Reservations
INNER JOIN Sellers ON Reservations.sellerPESEL = Sellers.PESEL
INNER JOIN People ON Sellers.PESEL = People.PESEL)

GROUP BY People.firstName, People.surname

USE TravelAgency
SELECT *
FROM [Sellers Payment gathered]
WHERE Gender = 'Female' AND paymentSUM = (
	SELECT paymentSUM = MAX(paymentSUM)
	FROM [Sellers Payment gathered]
	WHERE Gender = 'Female')
UNION
SELECT *
FROM [Sellers Payment gathered]
WHERE Gender = 'Male' AND paymentSUM = (
	SELECT paymentSUM = MAX(paymentSUM)
	FROM [Sellers Payment gathered]
	WHERE Gender = 'Male')

ORDER BY PaymentSUM DESC



