-- Find the country of the trips with shortest avarage duration time. For calculations, include only sessions of trips that are for rest and their transport is plane
USE TravelAgency

SELECT TOP(1) Locations.country, AVG(DATEDIFF(day, Sessions.firstDay,Sessions.lastDay)) AS AvgLength
FROM ((Locations
INNER JOIN Trips ON Locations.id = Trips.locationID)
INNER JOIN Sessions ON Trips.id = Sessions.tripID)

WHERE Trips.type = 'for rest' AND
Trips.transport = 'plane'

GROUP BY Locations.country
ORDER BY AvgLength