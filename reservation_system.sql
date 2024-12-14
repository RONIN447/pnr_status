-- Create the Tickets table

CREATE DATABASE reservation_system;

USE reservation_system;
CREATE TABLE tickets (
    pnr INT PRIMARY KEY,
    train_name VARCHAR(100) NOT NULL,
    journey_date DATE NOT NULL,
    fare DECIMAL(10, 2) NOT NULL
);

-- Insert some hardcoded data into the Tickets table
INSERT INTO tickets (pnr, train_name, journey_date, fare)
VALUES
(123456, 'Shatabdi Express', '2024-12-20', 500.00),
(234567, 'Rajdhani Express', '2024-12-21', 1500.00),
(345678, 'Duronto Express', '2024-12-22', 1200.00);


SELECT * FROM tickets;
