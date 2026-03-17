usersCREATE TABLE venues (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    capacity INT NOT NULL,
    location VARCHAR(255) NOT NULL,
    type VARCHAR(100) NOT NULL,
    photo BLOB
);

ALTER TABLE venues
ADD COLUMN projector BOOLEAN DEFAULT FALSE,
ADD COLUMN ac BOOLEAN DEFAULT FALSE,
ADD COLUMN micAndSpeaker BOOLEAN DEFAULT FALSE;

CREATE TABLE VenueBookings (
	 id INT PRIMARY KEY AUTO_INCREMENT,
    Venue_Name VARCHAR(255),
    Location VARCHAR(255),
    Booking_Date DATE,
    From_Time TIME,
    To_Time TIME,
    Booked_Capacity INT,
    Venue_Capacity INT,
    Staff VARCHAR(255),
    Status VARCHAR(50),
    Description VARCHAR(255)    
);

ALTER TABLE VenueBookings
ADD COLUMN rejection_reason VARCHAR(255);
ALTER TABLE VenueBookings
ADD COLUMN email VARCHAR(255) NOT NULL;


CREATE TABLE staffdetails (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    department VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    contact VARCHAR(20) NOT NULL
);

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('admin', 'user') DEFAULT 'user',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE HELP(
	id INT AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE NOT NULL,
	venuename VARCHAR(255) NOT NULL,
	subject VARCHAR(255) NOT NULL,
	comments VARCHAR(525) NOT NULL
);

ALTER TABLE HELP
ADD COLUMN Status VARCHAR(50) NOT NULL;

ALTER TABLE users 
DROP COLUMN depatment;

ALTER TABLE users CHANGE name username VARCHAR(255) ;


INSERT INTO HELP (name, email, venuename, SUBJECT,comments)
VALUES  
('vijay','vijaykrishnaa.cs23@bitsathy.ac.in','DF conference-room','for test','for test'),
('harshan','harshan.ad23@bitsathy.ac.in','DF conference-room','for test','for test'),
('enitha','enitha.it23@bitsathy.ac.in','DF conference-room','for test','for test'),
('shashwath','shashwath.it23@bitsathy.ac.in','DF conference-room','for test','for test'),
('arvindh','arvind.it23@bitsathy.ac.in','DF conference-room','for test','for test')


INSERT INTO staffdetails (name, department, email, contact)
VALUES
('Ananya Sharma', 'Admin', 'ananya.sharma@example.com', '9876543210'),
('Ravi Kumar', 'IT', 'ravi.kumar@example.com', '9876543220'),
('Priya Verma', 'HR', 'priya.verma@example.com', '9876543230'),
('Harish Patel', 'Operations', 'harish.patel@example.com', '9876543240'),
('Meera Singh', 'Support', 'meera.singh@example.com', '9876543250'),
('Arvindh Reddy', 'Facilities', 'arvindh.reddy@example.com', '9876543260'),
('Simran Kapoor', 'Marketing', 'simran.kapoor@example.com', '9876543270'),
('Vikram Das', 'Security', 'vikram.das@example.com', '9876543280'),
('Nisha Mehta', 'Catering', 'nisha.mehta@example.com', '9876543290'),
('Sandeep Joshi', 'Facilities', 'sandeep.joshi@example.com', '9876543300');


INSERT INTO VenueBookings (Venue_Name, Location, Booking_Date, From_Time, To_Time, Booked_Capacity, Venue_Capacity, Staff, Status, Description) VALUES
('SF seminar-hall 1', 'Sunflower-block', '2024-10-10', '10:00:00', '12:00:00', 300, 500, 'Arvindh', 'Awaiting..', 'Seminar on emerging technologies'),
('SF seminar-hall 2', 'Sunflower-block', '2024-10-12', '14:00:00', '16:00:00', 200, 400, 'Vijay', 'Awaiting..', 'Team building workshop'),
('SF seminar-hall 3', 'Daisy-block', '2024-10-15', '09:30:00', '11:30:00', 150, 300, 'Kumar', 'Awaiting..', 'Panel discussion on AI advancements'),
('DF conference-room', 'Daffodil-block', '2024-10-18', '11:15:00', '13:15:00', 100, 150, 'Sneha', 'Awaiting..', 'Internal team meeting'),
('RW auditorium', 'Rosewood-block', '2024-10-20', '16:00:00', '18:00:00', 500, 800, 'Mohan', 'Awaiting..', 'Annual company meeting');


CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    roles VARCHAR(255) NOT NULL,
    depatment VARCHAR(255) NOT NULL
);


INSERT INTO users(username,email,roles,depatment)
VALUE
('vijay','vijaykrishnaa.cs23@bitsathy.ac.in','admin','cs'),
('harshan','harshan.ad23@bitsathy.ac.in','user','aids'),
('arvind','arvindh.it23@bitsathy.ac.in','user','cs'),
('enitha','enitha.it23@bitsathy.ac.in','user','cs');


TRUNCATE TABLE VenueBookings;
