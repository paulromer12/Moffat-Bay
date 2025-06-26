-- Group 4 
-- dml.sql

-- 1. Populate User (using our personas)
INSERT INTO User (email, first_name, last_name, phone, password_hash) VALUES
('morgan.jones@example.com', 'Morgan', 'Jones', '555-1001', 'hash_morgan'),
('miko.miyazaki@example.com', 'Miko', 'Miyazaki', '555-1002', 'hash_miko'),
('emily.strange@example.com', 'Emily', 'Strange', '555-1003', 'hash_emily');

-- 2. Populate Inquiry
INSERT INTO Inquiry (user_id, email, full_name, subject, message, attachment) VALUES
(1, 'morgan.jones@example.com', 'Morgan Jones', 'Question About Amenities', 'Do you offer kayak rentals?', ''),
(2, 'miko.miyazaki@example.com', 'Miko Miyazaki', 'Registration Help', 'I’m having trouble signing up.', ''),
(3, 'emily.strange@example.com', 'Emily Strange', 'Booking Dates', 'Can I book outside of summer season?', '');

-- 3. Populate Attractions
INSERT INTO Attractions (name, description, price, availability_status) VALUES
('Sunset Trail', 'Scenic hiking at dusk', 0.00, 'Available'),
('Kayak Tour', 'Guided kayak around the bay', 25.00, 'Available'),
('Whale Watching', 'Boat tour for whale spotting', 40.00, 'Available');

-- 4. Populate RoomType
INSERT INTO RoomType (name, description, price_per_night) VALUES
('Queen', 'Queen bed cabin', 135.00),
('King', 'King bed cabin', 160.00),
('Double Full', 'Two full beds', 120.00);

-- 5. Populate Reservation
INSERT INTO Reservation (user_ID, room_type_id, num_guests, check_in_date, check_out_date, total_price, status) VALUES
(1, 1, 2, '2025-07-15', '2025-07-20', 675.00, 'confirmed'),
(2, 3, 1, '2025-09-10', '2025-09-12', 240.00, 'confirmed'),
(3, 2, 4, '2025-08-05', '2025-08-10', 800.00, 'confirmed');

-- 6. Populate ReservationAttraction
INSERT INTO ReservationAttraction (reservation_id, attraction_id) VALUES
(1, 2),
(1, 1),
(2, 3);
