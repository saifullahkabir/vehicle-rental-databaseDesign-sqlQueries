-- SQL Queries Input:

-- Create users table
create table users (
  user_id serial primary key,
  name varchar(50) not null,
  email varchar(100) unique not null,
  password text not null,
  phone varchar(15) not null,
  role varchar(20) check(role in ('Admin', 'Customer')) not null
);

-- Insert data into user
insert into users(name, email, password, phone, role) values
('Alice', 'alice@example.com', 'alice@@123', '1234567890', 'Customer'),
('Bob', 'bob@example.com', 'bob@@123', '0987654321', 'Admin'),
('Charlie', 'charlie@example.com', 'charlie@@123', '1122334455', 'Customer'),
('Rana', 'saifullahkabirranaa@gmail.com', 'rana@@123', '01878154323', 'Admin');


-- Create Vehicles Table
create table vehicles(
  vehicle_id serial primary key,
  name varchar(50) not null,
  type varchar(20) check(type in('Car', 'Bike', 'Truck')) not null,
  model varchar(50) not null,
  registration_number varchar(50) unique not null,
  rental_price int not null,
  status varchar(20)
  check(status in ('available', 'rented', 'maintenance')) not null
);

-- Insert data into vehicles
insert into vehicles(name, type, model, registration_number, rental_price, status) values
('Toyota Corolla', 'Car', '2022', 'ABC-123', 50, 'available'),
('Honda Civic', 'Car', '2021', 'DEF-456', 60, 'rented'),
('Yamaha R15', 'Bike', '2023', 'GHI-789', 30, 'available'),
('Ford F-150', 'Truck', '2020', 'JKL-012', 100, 'maintenance');


-- Create Bookings Table
create table bookings(
  booking_id serial primary key,
  user_id int references users(user_id),
  vehicle_id int references vehicles(vehicle_id),
  start_date date not null,
  end_date date not null,
  status varchar(20)
  check(status in ('pending', 'confirmed', 'completed', 'cancelled')) not null,
  total_cost int not null
);

insert into bookings(user_id, vehicle_id, start_date, end_date, status, total_cost) values
(1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(1, 1, '2023-12-10', '2023-12-12', 'pending', 100);


-- SQL Queries Result :codejoin close

-- Query 1: JOIN
-- Requirement: Retrieve booking information along with Customer name and Vehicle name.

select 
  b.booking_id,
  u.name as customer_name,
  v.name as vehicle_name,
  b.start_date,
  b.end_date,
  b.status 
  from bookings as b
  inner join users as u on b.user_id = u.user_id
  inner join vehicles as v on b.vehicle_id = v.vehicle_id;

-- Query 2: EXISTS (not exists)
-- Requirement: Find all vehicles that have never been booked.

select * from 
  vehicles 
  where not exists (
  select 1 
  from bookings
  where bookings.vehicle_id = vehicles.vehicle_id
  );

-- Query 3: WHERE
-- Requirement: Retrieve all available vehicles of a specific type (e.g. cars).
select * from vehicles
where type = 'Car'
and status = 'available';


-- Query 4: GROUP BY and HAVING
-- Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

select 
  v.name as vehicle_name,
  count(b.booking_id) as total_bookings
  from bookings as b
  inner join vehicles as v on b.vehicle_id = v.vehicle_id
  group by v.name
  having count(b.booking_id) > 2;












