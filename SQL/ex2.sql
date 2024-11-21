CREATE TABLE individual (
	userId INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE clt (
	userId INT NOT NULL PRIMARY KEY,
    email VARCHAR(100),
    nme VARCHAR(30) NOT NULL,
    username VARCHAR(30) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(30),
    paymentInfo VARCHAR(50),
    FOREIGN KEY (userID) REFERENCES individual(userId)
);

CREATE TABLE broker (
	userId INT NOT NULL PRIMARY KEY,
    email VARCHAR(100),
    nme VARCHAR(30) NOT NULL,
    username VARCHAR(30) NOT NULL,
    address VARCHAR(100) NOT NULL,
    phoneNumber VARCHAR(30),
    paymentInfo VARCHAR(50),
    workEmail VARCHAR(100),
    officeContactInfo VARCHAR(100),
    commissionPercentage DECIMAL(4,3) NOT NULL,
    FOREIGN KEY (userId) REFERENCES individual(userId)
);

CREATE TABLE appointment (
	appointmentId INT NOT NULL AUTO_INCREMENT,
    userId INT NOT NULL,
    additionalMessage VARCHAR(100),
    dte DATE,
    preApprovedMortgage DECIMAL(12, 2),
    hasBroker INT NOT NULL,
    viewerInfo VARCHAR(200),
    PRIMARY KEY (appointmentId),
    FOREIGN KEY (userId) REFERENCES individual(userId)
);

CREATE TABLE searchFilterHistory (
	filterID INT NOT NULL AUTO_INCREMENT,
    userID INT NOT NULL,
    location VARCHAR(50),
    size INT NOT NULL,
    datePosted DATE,
    priceRange DECIMAL(12,2),
    notes VARCHAR(100),
    postType INT NOT NULL,
    basementFinished INT NOT NULL,
    numOfBedroom INT,
    numOfWashroom DECIMAL(3,1),
    PRIMARY KEY (filterId),
    FOREIGN KEY (userId) REFERENCES individual(userId)
);

CREATE TABLE message (
	messageId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    senderId INT NOT NULL,
    receiverId INT NOT NULL,
    messageText VARCHAR(2000),
    subjectOfMessage VARCHAR(75),
    dateSent DATE,
    FOREIGN KEY (senderId) REFERENCES individual(userId),
    FOREIGN KEY (receiverId) REFERENCES individual(userId)
);

CREATE TABLE property (
	propertyID INT NOT NULL AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE propertyForRent (
	propertyID INT NOT NULL PRIMARY KEY,
    creatorId INT NOT NULL,
    address VARCHAR(100) NOT NULL,
    isAvailable INT NOT NULL,
    datePosted DATE,
    hasBroker INT NOT NULL,
    brokerId INT NULL,
    buildingFeatures VARCHAR(200),
    dscrptn VARCHAR(200),
    monthlyRent DECIMAL(12,2),
    deposit DECIMAL(12,2),
    utilitiesIncluded INT,
    appliancesIncluded INT,
    FOREIGN KEY (propertyId) REFERENCES property(propertyId),
    FOREIGN KEY (creatorId) REFERENCES individual(userId),
    FOREIGN KEY (brokerId) REFERENCES broker(userId)
);

CREATE TABLE propertyForSale (
	propertyId INT PRIMARY KEY,
    creatorId INT NOT NULL,
    address VARCHAR(100) NOT NULL,
    isAvailable INT NOT NULL,
    datePosted DATE,
    hasBroker INT NOT NULL,
    brokerId INT NULL,
    buildingFeatures VARCHAR(200),
    dscrptn VARCHAR(200),
    sellingPrice DECIMAL(12,2) NOT NULL,
    annualPropertyTax DECIMAL(12,2) NOT NULL,
    basementFinished INT NOT NULL,
    averagePricePerSquareFoot DECIMAL(12,2),
    expectedSellDate DATE,
    FOREIGN KEY (propertyId) REFERENCES property(propertyId),
    FOREIGN KEY (creatorId) REFERENCES individual(userId),
    FOREIGN KEY (brokerId) REFERENCES broker(userId)
);

CREATE TABLE trns (
	transactionId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    buyerId INT NOT NULL,
    sellerId INT NOT NULL,
    brokerId INT NULL,
    propertyId INT NOT NULL,
    commission DECIMAL(12,2),
    stat VARCHAR(20),
    paymentMethod VARCHAR(20) NOT NULL,
    finalPrice DECIMAL(12,2) NOT NULL,
    listingPrice DECIMAL(12,2) NOT NULL,
    transactionDate DATE NOT NULL,
    FOREIGN KEY (buyerId) REFERENCES individual(userId),
    FOREIGN KEY (sellerId) REFERENCES individual(userId),
    FOREIGN KEY (brokerId) REFERENCES broker(userId),
    FOREIGN KEY (propertyId) REFERENCES property(propertyId)
);