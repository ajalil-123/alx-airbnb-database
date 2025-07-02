

INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (UUID(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
  (UUID(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '2345678901', 'host'),
  (UUID(), 'Carol', 'Lee', 'carol@example.com', 'hashed_pw_3', '3456789012', 'guest'),
  (UUID(), 'David', 'Brown', 'david@example.com', 'hashed_pw_4', '4567890123', 'admin');



INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  (UUID(), '22222222-2222-2222-2222-222222222222', 'Cozy Cottage', 'A peaceful retreat in the countryside.', 'Rwanda, Musanze', 50.00),
  (UUID(), '22222222-2222-2222-2222-222222222222', 'Urban Loft', 'Modern apartment in city center.', 'Rwanda, Kigali', 80.00);


INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (UUID(), 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2025-07-10', '2025-07-12', 100.00, 'confirmed'),
  (UUID(), 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', '2025-08-01', '2025-08-04', 240.00, 'pending');


INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  (UUID(), 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 100.00, 'credit_card');



INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  (UUID(), 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Wonderful stay, very quiet and clean!'),
  (UUID(), 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 4, 'Great location, modern space, but a bit noisy.');


INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  (UUID(), '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi, is the cottage available for next week?'),
  (UUID(), '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, it is available from July 10th to 12th.');
