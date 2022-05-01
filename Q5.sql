-- For each trip, find the avarage number of options offered in all its offers. Give the name of then trip, and the avg value. Sort results in descending order.

USE TravelAgency

SELECT x.name, AVG(x.OptionsCount) AS AvgTripsOptions
FROM(
	SELECT CAST(COUNT(OfferedOptions.offeredOptionID) AS float) AS OptionsCount, Trips.name, Offers.id
	FROM ((Offers
	INNER JOIN OfferedOptions ON Offers.id = OfferedOptions.offerID)
	INNER JOIN Trips ON Offers.tripID = Trips.id)

	GROUP BY Offers.id, Trips.name
)x

GROUP BY x.name
ORDER BY AvgTripsOptions DESC