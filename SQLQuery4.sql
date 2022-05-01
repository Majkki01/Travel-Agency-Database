USE TravelAgency

SELECT * FROM Reservations

SELECT * FROM PurchasedOptions

UPDATE Reservations
SET reservationNumber = '1111/1111'
WHERE advancePayment=2000;

SELECT * FROM Reservations

SELECT * FROM PurchasedOptions