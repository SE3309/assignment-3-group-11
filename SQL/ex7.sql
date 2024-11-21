CREATE VIEW low_commission_brokers AS
SELECT userId, email, nme, address, commissionPercentage
FROM broker
WHERE commissionPercentage < 0.1;

SELECT nme 
FROM low_commission_brokers
WHERE nme LIKE "%John%";

INSERT INTO low_commission_brokers
VALUES (
	1001,
    "johnjohnjohn@john.com",
    "Johnny Joanna Johnson",
    "1234 John Ave, Jonestown, South Africa",
    0.001
);

CREATE VIEW messages AS
SELECT subjectOfMessage, messageText, dateSent
FROM message
WHERE subjectOfMessage LIKE "%and%";

SELECT * FROM messages
WHERE messageText LIKE "% dog %";

UPDATE messages
SET messageText = 'hello there'
WHERE subjectOfMessage = "Fill sit hit human list stand.";