# Vehicle Rental System

This repository contains the **Database Design (ERD)** and **SQL Queries** for the Vehicle Rental System.

---

## Part 1: Database Design (ERD)

The database is designed to manage a simple vehicle rental system where users can book vehicles for a specific time period.

### Tables

* **Users**: Stores user information (Admin / Customer)
* **Vehicles**: Stores vehicle details (Car, Bike, Truck)
* **Bookings**: Stores rental booking records

### Relationships

* One User can have multiple Bookings (One-to-Many)
* One Vehicle can be associated with multiple Bookings (Many-to-One)
* Each Booking links exactly one User and one Vehicle

### ERD Diagram

The complete ERD is available at the link below:

[https://drawsql.app/teams/saifullah-kabir/diagrams/vehicle-rental-system](https://drawsql.app/teams/saifullah-kabir/diagrams/vehicle-rental-system)

---

## Part 2: SQL Queries

SQL queries are written based on the designed schema and stored in the following file:

- [queries.sql](queries.sql)

### Implemented Queries

* Retrieve booking information with customer name and vehicle name (INNER JOIN)
* Find vehicles that have never been booked (NOT EXISTS)
* Retrieve available vehicles of a specific type (WHERE)
* Find vehicles with more than two bookings (GROUP BY, HAVING)

---

## Notes

* Database: PostgreSQL
* Tested using Beekeeper Studio

---
