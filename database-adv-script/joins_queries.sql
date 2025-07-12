
# Inner join
SELECT *
FROM bookings
INNER JOIN users ON booking.user_id = users.user_id;


# Left join
SELECT *
FROM property
LEFT JOIN reviews ON property.property_id = reviews.property_id
ORDER BY property_id ASC;

# full outer join
SELECT *
FROM bookings
FULL OUTER JOIN users ON bookings_user_id = users.user_id;
