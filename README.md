# Blood Bank Management Database (MySQL)

This project presents the design and implementation of a relational database system for managing a Blood Bank in a healthcare environment.  
The system focuses on data integrity, normalization, and enforcing real-world business rules using MySQL.

The project covers the full database lifecycle, from conceptual design (ERD) to logical design, normalization, and SQL implementation.

---

## Project Scope
The database is designed to manage and track:
- Blood donors and their eligibility
- Blood bags and expiration dates
- Recipients and blood transfusions
- Staff roles and responsibilities
- Medical test results and donation constraints
- Appointments and donation scheduling

This system aims to improve reliability, traceability, and accuracy in blood donation management.

---

## Technologies & Tools
- MySQL
- SQL (DDL & DML)
- Relational Database Design
- Entity Relationship Diagrams (ERD)
- Data Normalization (1NF, 2NF, 3NF)
- Triggers & Constraints

---

## Database Design

### Conceptual Design
The conceptual design was created using ER diagrams to model real-world entities and their relationships, including:
- Donor
- Blood
- Recipient
- Staff
- Job
- Appointment
- Test_Report
- Recipients_Blood (bridge table)

The design ensures proper handling of many-to-many relationships and follows healthcare-specific business rules.

### Logical Design & Normalization
All tables were normalized up to Third Normal Form (3NF) to:
- Eliminate redundancy.
- Prevent update anomalies.
- Ensure data consistency.

Normalization was applied systematically to each entity based on functional dependencies.

---

## Business Rules Implemented
Some of the key business rules enforced in the database include:
- Donors must be between 18 and 65 years old.
- Donor minimum weight requirement.
- Blood bags expire 42 days after donation.
- Donors must pass all required medical tests before donation.
- Each blood bag must be linked to a valid donor.
- Blood transfusions must respect blood type compatibility.

---

## Database Implementation

### DDL (Data Definition Language)
- Database and table creation
- Primary and foreign key constraints
- CHECK constraints to enforce domain rules
- ALTER and MODIFY statements

### Triggers
Triggers were implemented to automate critical logic, including:
- Automatically setting blood expiration dates
- Updating donor status based on test results
- Enforcing healthcare-related constraints at the database level

---

## DML (Data Manipulation Language)
The project includes:
- Insert statements for all entities
- Update operations demonstrating data changes
- Delete operations with before/after validation

---

## Sample Queries
Several SQL queries were developed to demonstrate data retrieval and analysis, including:
- Conditional queries using AND / OR
- JOIN queries across multiple tables
- Aggregate functions such as COUNT
- Queries supporting operational decision-making

Query results are provided as screenshots in the repository.

---

## Project Structure
