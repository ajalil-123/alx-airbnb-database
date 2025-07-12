
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_created_at,
    
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role AS user_role,
    u.created_at AS user_created_at,
    
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.location AS property_location,
    p.pricepernight,
    p.created_at AS property_created_at,
    p.updated_at AS property_updated_at,
    
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date

FROM bookings b

JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON pay.booking_id = b.booking_id;

#before optimization

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_created_at,
    
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number,
    u.role AS user_role,
    u.created_at AS user_created_at,
    
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    p.location AS property_location,
    p.pricepernight,
    p.created_at AS property_created_at,
    p.updated_at AS property_updated_at,
    
    pay.payment_id,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date

FROM bookings b

JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON pay.booking_id = b.booking_id;



# Refactored Query (Lean & Indexed)
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,

    u.first_name AS user_first_name,
    u.last_name  AS user_last_name,
    u.email      AS user_email,

    p.name       AS property_name,
    p.location   AS property_location,

    pay.amount   AS payment_amount,
    pay.payment_method

FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON pay.booking_id = b.booking_id;


EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,

    u.first_name AS user_first_name,
    u.last_name  AS user_last_name,
    u.email      AS user_email,

    p.name       AS property_name,
    p.location   AS property_location,

    pay.amount   AS payment_amount,
    pay.payment_method

FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON pay.booking_id = b.booking_id;

