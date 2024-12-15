-- Create the Tickets table

CREATE DATABASE reservation_system;

USE reservation_system;
CREATE TABLE tickets (
    pnr INT PRIMARY KEY,
    train_name VARCHAR(100) NOT NULL,
    journey_date DATE NOT NULL,
    fare DECIMAL(10, 2) NOT NULL,
    passenger_name VARCHAR(100) NOT NULL,
    berth_status VARCHAR(10) NOT NULL CHECK (berth_status IN ('Confirmed', 'RAC', 'WL')),
    berth_number INT NOT NULL CHECK (berth_number BETWEEN 1 AND 72),
    source_station VARCHAR(100) NOT NULL,
    destination_station VARCHAR(100) NOT NULL,
    class_type VARCHAR(20) NOT NULL CHECK (class_type IN ('Sleeper', '3AC', '2AC', '1AC')),
    booking_time TIME NOT NULL
);


-- Insert hardcoded data into the tickets table
INSERT INTO tickets (pnr, train_name, journey_date, fare, passenger_name, berth_status, berth_number, source_station, destination_station, class_type, booking_time)
VALUES
(123456, 'Shatabdi Express', '2024-12-20', 500.00, 'John Doe', 'Confirmed', 15, 'New Delhi', 'Lucknow', '1AC', '09:30:00'),
(234567, 'Rajdhani Express', '2024-12-21', 1500.00, 'Jane Smith', 'RAC', 45, 'Mumbai', 'Delhi', '2AC', '14:45:00'),
(345678, 'Duronto Express', '2024-12-22', 1200.00, 'Alice Johnson', 'WL', 72, 'Kolkata', 'Chennai', '3AC', '19:20:00'),
(456789, 'Garib Rath', '2024-12-23', 800.00, 'Robert Brown', 'Confirmed', 3, 'Hyderabad', 'Bangalore', 'Sleeper', '06:15:00'),
(567890, 'Jan Shatabdi', '2024-12-24', 600.00, 'Emily Davis', 'RAC', 32, 'Pune', 'Ahmedabad', '2AC', '11:00:00'),
(678901, 'Sampark Kranti', '2024-12-25', 950.00, 'Charlie Evans', 'Confirmed', 20, 'Chennai', 'Coimbatore', '3AC', '08:50:00'),
(789012, 'Humsafar Express', '2024-12-26', 1100.00, 'Laura Wilson', 'WL', 67, 'Delhi', 'Jaipur', 'Sleeper', '20:05:00'),
(890123, 'Duronto Express', '2024-12-27', 1350.00, 'Chris Martin', 'RAC', 48, 'Mumbai', 'Goa', '1AC', '16:30:00'),
(901234, 'Garib Rath', '2024-12-28', 780.00, 'Megan Brown', 'Confirmed', 9, 'Kolkata', 'Patna', 'Sleeper', '13:15:00'),
(101112, 'Rajdhani Express', '2024-12-29', 1600.00, 'Peter Clark', 'Confirmed', 5, 'Bangalore', 'Hyderabad', '2AC', '17:45:00'),
(111213, 'Shatabdi Express', '2024-12-30', 520.00, 'Diana Lee', 'RAC', 33, 'Delhi', 'Chandigarh', '3AC', '07:30:00'),
(121314, 'Sampark Kranti', '2024-12-31', 970.00, 'Sam Harris', 'WL', 70, 'Mumbai', 'Nagpur', '3AC', '18:55:00'),
(131415, 'Jan Shatabdi', '2025-01-01', 620.00, 'Paul Adams', 'Confirmed', 18, 'Lucknow', 'Varanasi', 'Sleeper', '10:10:00'),
(141516, 'Shatabdi Express', '2025-01-02', 560.00, 'Ethan Lewis', 'RAC', 27, 'New Delhi', 'Agra', '2AC', '12:25:00'),
(151617, 'Rajdhani Express', '2025-01-03', 1550.00, 'Grace Turner', 'WL', 66, 'Chennai', 'Mumbai', '1AC', '21:15:00'),
(161718, 'Duronto Express', '2025-01-04', 1250.00, 'Henry Miller', 'Confirmed', 8, 'Delhi', 'Amritsar', '2AC', '06:40:00'),
(171819, 'Garib Rath', '2025-01-05', 850.00, 'Olivia Scott', 'Confirmed', 2, 'Pune', 'Hyderabad', '3AC', '04:50:00'),
(181920, 'Jan Shatabdi', '2025-01-06', 610.00, 'Liam Walker', 'RAC', 35, 'Bhopal', 'Gwalior', 'Sleeper', '15:20:00'),
(192021, 'Shatabdi Express', '2025-01-07', 580.00, 'Lucas Green', 'WL', 60, 'Delhi', 'Kanpur', '3AC', '07:45:00'),
(202122, 'Rajdhani Express', '2025-01-08', 1650.00, 'Ava White', 'Confirmed', 7, 'Mumbai', 'Delhi', '1AC', '22:30:00'),
(212223, 'Duronto Express', '2025-01-09', 1300.00, 'Ella King', 'RAC', 40, 'Hyderabad', 'Chennai', '2AC', '10:00:00'),
(222324, 'Garib Rath', '2025-01-10', 870.00, 'Noah Brown', 'Confirmed', 4, 'Lucknow', 'Patna', 'Sleeper', '05:35:00'),
(232425, 'Jan Shatabdi', '2025-01-11', 640.00, 'Mia Moore', 'RAC', 36, 'Jaipur', 'Delhi', '3AC', '14:00:00');

-- Retrieve all records from the tickets table
SELECT * FROM tickets;
