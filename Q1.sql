-- Find the avarage offer's price for each city. Count only offers of trips that last more than 4 days and is prescribed for more than 2 participants. Order these precies in descending order.

USE TravelAgency

SELECT AVG(Offers.basicPrice) AS Avg_Price, Locations.city
FROM ((((Offers
INNER JOIN SessionsOfOffers ON Offers.id = SessionsOfOffers.offerID)
INNER JOIN Sessions ON SessionsOfOffers.sessionID = Sessions.id)
INNER JOIN Trips ON Offers.tripID = Trips.id)
INNER JOIN Locations ON Trips.locationID = Locations.id)

WHERE 
	Offers.participantsNumber > 2 AND 
	DATEDIFF(day, Sessions.firstDay,Sessions.lastDay) > 4

GROUP BY Locations.city
ORDER BY Avg_Price DESC


