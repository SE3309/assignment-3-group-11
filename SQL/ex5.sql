SELECT *
FROM searchfilterhistory
WHERE basementFinished = 1;

SELECT AVG(finalPrice) AS "Average Final Price for Completed Transaction"
FROM trns
GROUP BY stat, paymentMethod
HAVING stat = "Completed"
AND paymentMethod = 'Cash';

SELECT COUNT(*) AS "Count of messages sent after June 1, 2024"
FROM message
WHERE dateSent > "2024-06-01";

SELECT userId, username, phoneNumber, transactionId, stat, finalPrice, transactionDate
FROM broker
INNER JOIN trns
ON userId = brokerId
WHERE userId = 711;

SELECT userID, location, size, datePosted, priceRange, numOfWashroom
FROM searchfilterhistory
WHERE datePosted > "2024-06-01"
ORDER BY priceRange DESC;

SELECT propertyID, address, monthlyRent
FROM propertyforrent;

SELECT * 
FROM appointment
WHERE viewerInfo
LIKE "% and %";