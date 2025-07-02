

Constraints
User Table
Unique constraint on email.
Non-null constraints on required fields.

Property Table
Foreign key constraint on host_id.
Non-null constraints on essential attributes.

Booking Table
Foreign key constraints on property_id and user_id.
status must be one of pending, confirmed, or canceled.

Payment Table
Foreign key constraint on booking_id, ensuring payment is linked to valid bookings.

Review Table
Constraints on rating values (1-5).
Foreign key constraints on property_id and user_id.

Message Table
Foreign key constraints on sender_id and recipient_id.