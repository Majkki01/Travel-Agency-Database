--The seller lists the 3 most popular destinations for groups with at least one child with a StartDay in the period of time from the beginning of June up to the end of August.
--Records should be grouped by Location.
--The following information should be displayed: all attributes of the Locations table, count of reservation groups that visited these locations and were groups with at least one child.
--Sort the amount of reservations in descending order and give top 3 results.
USE TravelAgency
SELECT TOP(3) Locations.country, Locations.city, Locations.hotel, Locations.starsCount, COUNT(Reservations.ReservationNumber) AS ResCount
FROM Reservations
INNER JOIN ReservationGroups ON Reservations.groupID = ReservationGroups.id
INNER JOIN Sessions ON Reservations.sessionID = Sessions.id
INNER JOIN Trips ON Sessions.tripID = Trips.id
INNER JOIN Locations ON Trips.locationID = Locations.id

WHERE ReservationGroups.childrenNumber > 0 AND
month(Sessions.firstDay) > 5 AND
month(Sessions.firstDay) < 9

GROUP BY Locations.country, Locations.city, Locations.hotel, Locations.starsCount
ORDER BY ResCount DESC