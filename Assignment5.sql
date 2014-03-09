-- This file is to use for reference when dealing with how we will normalize our tables.
-- The tables are still in development so we still need to discuss how to break them apart
-- ToDo tags are placed around the file to indicate where we have not finished and need to further examine
-- Once you think a ToDo section has been completed, type your initials in the comment next to it
-- Once all our initials are recorded, we can delete the ToDo and repeat until the file, then the project is done

-- ToDo: Set up shipper table which records data about a shipper
-- Needs primary key. Determine if there are any other values which should be included in this table.
CREATE TABLE SHIPPER
(
	ShipperPhone INT NOT NULL
	, ShipperContact CHAR(20) NOT NULL
	, ShipperCountry VARCHAR(MAX) NOT NULL
	, ShipperContents VARCHAR(MAX) NOT NULL
)

-- ToDo: Set up shipment table which records data the shipment from the shipper to the store.
-- Needs primary key. Determine if there are any other values which should be included in this table.
CREATE TABLE SHIPMENT
(
	ShipmentNumber BIGINT NOT NULL
	, ItemOrderDate DATE NOT NULL 
	, Departure DATE NOT NULL
	, Arrival DATE NULL
)
	
-- ToDo: Set up items table which records data the item sold at the store
-- Needs primary key. Determine if there are any other values which should be included in this table.
CREATE TABLE ITEMS
(
	ShipmentNumber BIGINT NOT NULL
	, ItemInsuredValue INT NULL
	, Item VARCHAR(MAX) NOT NULL
	, Price INT NOT NULL
	, StoreSalesperson CHAR(20) NOT NULL
)

-- ToDo: Set up store table which records data about a store - not the shipper -
-- Needs primary key. Determine if there are any other values which should be included in this table.
CREATE TABLE STORE
(
	StoreName VARCHAR(MAX) NOT NULL
	, StoreCity VARCHAR(MAX) NOT NULL
	, StoreSalesperson CHAR(20) NOT NULL
	, ItemOrderDate DATE NOT NULL 
)

-- Drops tables when changed	
--DROP TABLE SHIPMENT, STORE, ITEMS, SHIPPER
