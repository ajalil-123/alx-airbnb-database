
# Write a query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT user_id, COUNT(*) AS total_bookings
FROM bookings
GROUP BY user_id;




# Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.

-- Step 1 : aggregate bookings per property, then
-- Step 2 : apply the window function to rank them
WITH property_booking_totals AS (
    SELECT
        property_id,
        COUNT(*) AS total_bookings
    FROM bookings
    GROUP BY property_id
)

SELECT
    pbt.property_id,
    p.name,
    p.location,
    pbt.total_bookings,
    RANK()       OVER (ORDER BY pbt.total_bookings DESC) AS booking_rank,  -- handles ties
    ROW_NUMBER() OVER (ORDER BY pbt.total_bookings DESC) AS booking_rownum -- unique sequence
FROM property_booking_totals pbt
JOIN properties p ON pbt.property_id = p.property_id
ORDER BY pbt.total_bookings DESC;
