-- For each person, that is a participant of particular reservation, count the number of those reservations that started between april and november.
-- Count only these reservations which has higher basic price than the avarage one. Sort these amounts in descending order.

USE TravelAgency

SELECT People.firstName, People.surname, COUNT(Reservations.ReservationNumber) AS ResAmount
FROM ((((((People
INNER JOIN Participants ON People.PESEL = Participants.PESEL)
INNER JOIN ParticipantsInGroups ON Participants.PESEL = ParticipantsInGroups.PESEL)
INNER JOIN ReservationGroups ON ParticipantsInGroups.groupID = ReservationGroups.id)
INNER JOIN Reservations ON ReservationGroups.id = Reservations.groupID)
INNER JOIN Sessions ON Reservations.sessionID = Sessions.id)
INNER JOIN Offers ON Reservations.offerID = Offers.id)

WHERE Offers.basicPrice >= (
	SELECT AVG(Offers.basicPrice)
	FROM Offers) AND
	month(Sessions.firstDay) BETWEEN 4 AND 11

GROUP BY People.firstName, People.surname
ORDER BY ResAmount DESC