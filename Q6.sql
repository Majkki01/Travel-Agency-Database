-- The Chief Finance Officer has decided to grant 3 best-performing sellers an annual financial bonus.
-- For that reason, he came up with the seller-rating formula. The score of the seller is calculated the following way:
-- Score = 100*(number of sold trips in last year) + 10*(ClientsRate) - Salary/(YearsOfExperience * 100)
-- CFO wants to display Name, surname and acheived score
--Remarks:
--Only currently employed sellers are considered to get a financial bonus.
--The top 3 results should be displayed.
--Results should be ordered by the Score in descending order.

USE TravelAgency

SELECT TOP(3) x.firstName, x.surname, Score + 10*Sellers.clientsRate - Sellers.salary/(Sellers.yearsOfExperience * 100) AS SCORE
FROM (
	SELECT People.PESEL, People.firstName, People.surname, 100*COUNT(Reservations.ReservationNumber) AS Score
	FROM ((Sellers
	INNER JOIN Reservations ON Sellers.PESEL = Reservations.sellerPESEL)
	INNER JOIN People ON Sellers.PESEL = People.PESEL)

	WHERE year(Reservations.dateOfReservation) = 2021
	GROUP BY People.firstName, People.surname, People.PESEL
)x INNER JOIN Sellers ON x.PESEL = Sellers.PESEL

WHERE Sellers.isEmployed = 1

ORDER BY SCORE DESC