-- Active: 1738418844128@@127.0.0.1@3306@airbnb_database


DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,


    PRIMARY KEY (booking_id, start_date), -- start_date must be part of PK
    
    INDEX idx_property_id (property_id),
    INDEX idx_user_id (user_id)
)

PARTITION BY RANGE (YEAR(start_date))(
  PARTITION p2023 VALUES LESS THAN (2024),
  PARTITION p2024 VALUES LESS THAN (2025),
  PARTITION p2025 VALUES LESS THAN (2026),
  PARTITION pMax VALUES LESS THAN MAXVALUE

);


EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';


SELECT NOW();
-- Run your query
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-12-31';
SELECT NOW();