-- This file is to use for reference when dealing with how we will normalize our tables.
-- The tables are still in development so we still need to discuss how to break them apart
-- ToDo tags are placed around the file to indicate where we have not finished and need to further examine
-- Once you think a ToDo section has been completed, type your initials in the comment next to it
-- Once all our initials are recorded, we can delete the ToDo and repeat until the file, then the project is done

-- ToDo: Set up shipper table which records data about a shipper
-- Determine if there are any other values which should be included in this table.
CREATE TABLE SHIPPER
(
	-- Multivalued Dependency: (ShipperPhone,ShipperContact) ->> ShipperCountry,ShipperContents
	-- Explanation: for every set of (ShipperPhone,ShipperContact), there may be multiple countries they ship from
	-- as well as the contents they ship
	-- Example: (770-770-7777,Alex) -> USA,Laptops & (770-770-7777,Alex) -> Phillipines,Desktops
	ShipperPhone INT NOT NULL
	, ShipperContact CHAR(20) NOT NULL
	, ShipperCountry VARCHAR(MAX) NOT NULL
	, ShipperContents VARCHAR(MAX) NOT NULL
	CONSTRAINT pk_SHIPPER PRIMARY KEY (ShipperPhone, ShipperContact) -- Primary Key
)

-- ToDo: Set up shipment table which records data the shipment from the shipper to the store.
-- Determine if there are any other values which should be included in this table.
CREATE TABLE SHIPMENT
(
	-- No multivalued dependencies
	ShipmentNumber BIGINT NOT NULL
	, ItemOrderDate DATE NOT NULL 
	, Departure DATE NOT NULL
	, Arrival DATE NULL
	CONSTRAINT pk_SHIPMENT PRIMARY KEY (ShipmentNumber) -- Primary Key
)
	
-- ToDo: Set up items table which records data the item sold at the store
-- Determine if there are any other values which should be included in this table.
CREATE TABLE ITEMS
(
	-- Multivalued Dependency: (ShipmentNumber) ->> ItemInsuredValue,Item,Price,StoreSalesperson
	-- For every shipment, there could be multiple items, therefore multiple sets are dependent 
	-- on a single shipment number
	-- Example: (123) -> 100,Laptop,500,Alex & (123) -> 200,Desktop,700,Zack
	ShipmentNumber BIGINT NOT NULL
	, ItemInsuredValue INT NULL
	, Item VARCHAR(MAX) NOT NULL
	, Price INT NOT NULL
	, StoreSalesperson CHAR(20) NOT NULL
	-- , ItemOrderDate DATE NOT NULL
	CONSTRAINT pk_ITEMS PRIMARY KEY (ShipmentNumber) -- Primary Key
)

-- ToDo: Set up store table which records data about a store - not the shipper -
-- Needs primary key. Determine if there are any other values which should be included in this table.
CREATE TABLE STORE
(
	-- ToDo: I, Alex, see a good relationship between the attributes in this table, but I do not see a good
	-- attribute for a primary key, I think we should add an attribute (StoreNumber) and assign every number its
	-- own unique StoreNumber so that we can use that as a primary key, let me know what you think.
	
	-- ToDo: I, Alex, also think that the ItemOrderDate should be moved to the ITEMS table because
	-- There would be way too many records. A table shouldn't have so many records only because of one attribute.
	-- For example: (StoreName1,Atlanta,Alex,1/1/01), (StoreName1,Atlanta,Alex,1/2/01), (StoreName1,Atlanta,Alex,1/3/01)
	-- The store table should only include 1 record for every store and just associated through a foregin key.
	StoreName VARCHAR(MAX) NOT NULL
	, StoreCity VARCHAR(MAX) NOT NULL
	, StoreSalesperson CHAR(20) NOT NULL
	, ItemOrderDate DATE NOT NULL 
	CONSTRAINT pk_STORE PRIMARY KEY (ShipmentNumber) -- Primary Key
)

-- Drops tables when changed	
--DROP TABLE SHIPMENT, STORE, ITEMS, SHIPPER
