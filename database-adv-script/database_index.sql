-- Active: 1738418844128@@127.0.0.1@3306@airbnb_database
-- Active: 1738418844128@@127.0.0.1@3306@mysql



#Index creation for users table

CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);


#Index creation for bookings table

CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);

#Index creation for properties table

CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_pricepernight ON properties(pricepernight);




#  Measure Before Index

EXPLAIN SELECT *
FROM bookings
WHERE user_id = '11111111-1111-1111-1111-111111111111';

# Add Index
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

# Measure After Index
EXPLAIN SELECT *
FROM bookings
WHERE user_id = '11111111-1111-1111-1111-111111111111';

# actual execution time and cost estimates
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = '11111111-1111-1111-1111-111111111111';