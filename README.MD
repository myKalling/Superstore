The provided SQL documentation outlines a comprehensive suite of stored procedures designed for the Superstore database, developed by Kenny Gallardo between April and May 2026. This system leverages advanced T-SQL features—including Common Table Expressions (CTEs), window functions, and JSON integration—to manage customers, orders, and products efficiently.
Core Database Functionalities
The stored procedures are categorized into primary business entities: Customers, Orders, and Products.
1. Customer Management
Creation & Retrieval: New customers are added via CreateCustomer. Information can be retrieved for a single entity using GetCustomer or in bulk (top 100 active) via GetAllCustomers.
Updates & Deletion: Customer records are modified through UpdateCustomer. Deletion is handled by DeleteCustomer, which supports both soft deletes (setting IsActive = 0) and hard deletes that cascade to associated addresses and orders.
Address Integration: Addresses are managed through specific procedures like CreateAddress, UpdateAddress, and GetCustomerAddresses.
2. Order Processing
Transaction Handling: Orders are created using CreateOrder and updated via UpdateOrder, which utilizes COALESCE to allow partial updates of fields like SalesPrice or ShipDate.1011
Detailed Insights: GetOrderDetails provides a complex view by returning both order headers and associated products in a structured JSON format.
History & Cleanup: DeleteOrder manages the removal or deactivation of order records and their corresponding details in the OrderDetail table.
3. Product & Catalog Management
Inventory Control: CreateProduct includes logic to prevent duplicates by checking for existing ProductName, CategoryID, and SubCategoryID combinations.
Catalog Browsing: Products can be retrieved individually or via GetAllProducts, which joins category and sub-category information for a complete view.
Advanced SQL Implementations
The repository includes an AdvancedSQLConcepts.sql guide that demonstrates high-level techniques used within the system:18
Window Functions: Used for cumulative calculations like RunningProfit (using SUM() OVER) and sequencing orders with ROW_NUMBER().
CTEs & Subqueries: Utilized to simplify complex logic, such as filtering high-value customers who have placed five or more orders or finding orders with profits above the global average.
Data Integrity: Scripts like BackfillCustomerID.sql and BackfillProductIDandOrderID.sql use transactions (BEGIN TRAN) and sanity checks to ensure data consistency during bulk updates.
Security & Administration
Permissions: A dedicated AppUser is established with EXECUTE permissions granted at the schema level (dbo), ensuring the application can run these procedures without having direct table access.
Bulk Loading: Templates for BULK INSERT are provided to ingest data from CSV files into staging tables (stg_Address, stg_OrderDetail) before moving them to production tables.

Guidelines from Data 102 instructor provided:
Superstore
This project consists of a front-end written in React.js, a back-end written in C#, and MS SQL stored procedures.

Superstore API
Address
GET /api/addresses/{id}

POST /api/addresses

PUT /api/addresses/{id}

DELETE /api/addresses/{id}

AddressType (Lookup Table)
GET /api/addresstypes
Category (Lookup Table)
GET /api/categories

Country (Lookup Table)
GET /api/countries

Customer
GET /api/customers
GET /api/customers/{id}
GET /api/customers/{id}/addresses
GET /api/customers/{id}/orders
POST /api/customers
PUT /api/customers/{id}
DELETE /api/customers/{id}

Order
GET /api/orders
GET /api/orders/{id}
GET /api/orders/{id}/orderdetails
POST /api/orders
PUT /api/orders/{id}
DELETE /api/orders/{id}

Product
GET /api/products
GET /api/products/{id}
POST /api/products
PUT /api/products/{id}
DELETE /api/products/{id}

Region (Lookup Table)
GET /api/regions

Segment (Lookup Table)
GET /api/segments

ShipMode (Lookup Table)
GET /api/shipmodes

State (Lookup Table)
GET /api/states

SubCategory (Lookup Table)
GET /api/subcategories

