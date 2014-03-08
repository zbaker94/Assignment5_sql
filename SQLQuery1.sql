CREATE TABLE SHIPPER
(
	ShipperPhone INT NOT NULL
	, ShipperContact CHAR(20) NOT NULL
	, ShipperCountry VARCHAR(MAX) NOT NULL
	, ShipperContents VARCHAR(MAX) NOT NULL
)

CREATE TABLE SHIPMENT
(
	ShipmentNumber BIGINT NOT NULL
	, ItemOrderDate DATE NOT NULL 
	, Departure DATE NOT NULL
	, Arrival DATE NULL
)
	

CREATE TABLE ITEMS
(
	ShipmentNumber BIGINT NOT NULL
	, ItemInsuredValue INT NULL
	, Item VARCHAR(MAX) NOT NULL
	, Price INT NOT NULL
	, StoreSalesperson CHAR(20) NOT NULL
)

CREATE TABLE STORE
(
	StoreName VARCHAR(MAX) NOT NULL
	, StoreCity VARCHAR(MAX) NOT NULL
	, StoreSalesperson CHAR(20) NOT NULL
	, ItemOrderDate DATE NOT NULL 
)
	
	DROP TABLE SHIPMENT, STORE, ITEMS, SHIPPER