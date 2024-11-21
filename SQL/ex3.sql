INSERT INTO appointment VALUES
(
	1,
    1,
    "hello",
    CURRENT_DATE(),
    123456.78,
    0,
    "hi there"
);

INSERT INTO appointment (userId, hasBroker)
SELECT userId, 1
FROM individual
WHERE userId = 2;

INSERT INTO appointment (userId, additionalMessage, dte, hasBroker)
VALUES 
	(3, "very cool", CURRENT_DATE(), 0), 
	(4, "not cool", "2024-01-01", 1);