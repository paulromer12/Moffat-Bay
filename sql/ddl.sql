-- Create database 
-- CREATE DATABASE IF NOT EXISTS moffat_bay;

-- Create MySQL User
-- CREATE USER IF NOT EXISTS 'moffat'@'localhost'
--  IDENTIFIED BY 'password';

-- GRANT ALL PRIVILEGES ON moffat_bay.* TO 'moffat'@'localhost';

-- FLUSH PRIVILEGES;

-- Switch to moffat_bay db
USE moffat_bay;

-- 1. User table
CREATE TABLE IF NOT EXISTS User (
  user_id       INT            AUTO_INCREMENT PRIMARY KEY,
  email         VARCHAR(255)   NOT NULL UNIQUE,
  first_name    VARCHAR(100)   NOT NULL,
  last_name     VARCHAR(100)   NOT NULL,
  phone         VARCHAR(20),
  password_hash VARCHAR(255)   NOT NULL,
  created_at    DATETIME       DEFAULT CURRENT_TIMESTAMP
);

-- 2. Inquiry table
CREATE TABLE IF NOT EXISTS Inquiry (
  inquiry_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id    INT NOT NULL,
  email      VARCHAR(255) NOT NULL,
  full_name  VARCHAR(150) NOT NULL,
  subject    VARCHAR(255) NOT NULL,
  message    TEXT         NOT NULL,
  attachment VARCHAR(255),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- 3. Room Type
CREATE TABLE IF NOT EXISTS RoomType (
  room_type_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price_per_night DECIMAL(10,2) NOT NULL
);

-- 4. Reservation
CREATE TABLE IF NOT EXISTS Reservation (
  reservation_ID INT             AUTO_INCREMENT PRIMARY KEY,
  user_ID        INT             NOT NULL,
  room_type_id   INT             NOT NULL,
  num_guests     INT             NOT NULL,
  check_in_date  DATE            NOT NULL,
  check_out_date DATE            NOT NULL,
  total_price    DECIMAL(8,2)    NOT NULL,
  status         VARCHAR(50)     NOT NULL DEFAULT 'confirmed',
  created_at     DATETIME        DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_ID)      REFERENCES User(user_id),
  FOREIGN KEY (room_type_id) REFERENCES RoomType(room_type_id)
);

-- 5. Attractions
CREATE TABLE IF NOT EXISTS Attractions (
  attraction_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  availability_status ENUM('Available','Unavailable') DEFAULT 'Available'
);

-- 6. ReservationAttraction
CREATE TABLE IF NOT EXISTS ReservationAttraction (
  reservation_id INT,
  attraction_id INT,
  PRIMARY KEY (reservation_id, attraction_id),
  FOREIGN KEY (reservation_id)  REFERENCES Reservation(reservation_ID),
  FOREIGN KEY (attraction_id)   REFERENCES Attractions(attraction_id)
);