UPDATE propertyforsale
SET sellingPrice = sellingPrice * 2
WHERE sellingPrice < 1000000;

DELETE FROM message
WHERE subjectOfMessage
LIKE "% successful %";

INSERT INTO trns (buyerId, sellerId, brokerId, propertyId, commission, stat, paymentMethod, finalPrice, listingPrice, transactionDate) 
SELECT buyerId, sellerId, brokerId, propertyId, commission, "Pending", paymentMethod, finalPrice, listingPrice, CURRENT_DATE()
FROM trns 
WHERE transactionId = 14;