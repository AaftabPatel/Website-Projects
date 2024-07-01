
create database SupportSail;
use SupportSail;
show tables;

CREATE TABLE contactData (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mobNo VARCHAR(10) NOT NULL,
    message TEXT
);
desc contactData;
select * from contactData;



CREATE TABLE volunteerData (id INT AUTO_INCREMENT PRIMARY KEY,
                 project VARCHAR(100),
                 fullName VARCHAR(100),
                 email VARCHAR(100),
                 mobNo VARCHAR(15)
                );
select * from volunteerData;
truncate volunteerData;
desc volunteerData;
            
CREATE TABLE organizations (
    organizationId INT AUTO_INCREMENT PRIMARY KEY,
    organizationName VARCHAR(100) NOT NULL,
    contactPersonName VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL ,
    phoneNumber VARCHAR(20) ,
    address VARCHAR(255) ,
    zipCode VARCHAR(20),
    description TEXT,
    registrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    upiId varchar(50) unique
);
drop table organizations;
INSERT INTO organizations (organizationName, contactPersonName, email, phoneNumber, address, zipCode, description, upiId) VALUES
('Charity Foundation', 'John Smith', 'charity@example.com', '1234567890', '123 Street, City', '12345', 'Supporting various causes', 'user1@bank1'),
('Humanitarian Aid Group', 'Emily Johnson', 'humanitarian@example.com', '9876543210', '456 Avenue, Town', '54321', 'Assisting communities in need', 'customerA@bank2'),
('Global Relief Organization', 'Michael Davis', 'globalrelief@example.com', '1112223333', '789 Road, Village', '67890', 'Bringing aid worldwide', 'payments@bank3'),
('Community Support Network', 'Emma Wilson', 'communitysupport@example.com', '4445556666', '321 Lane, Suburb', '13579', 'Empowering local initiatives', 'upiuser123@bank4'),
('Hope for Tomorrow', 'Sophia Miller', 'hope@example.com', '7778889999', '654 Drive, County', '97531', 'Creating opportunities for all', 'business_xyz@bank5'),
('Helping Hands Foundation', 'Daniel Brown', 'helpinghands@example.com', '2223334444', '987 Boulevard, City', '24680', 'Extending a helping hand', 'mycompany@bank6'),
('United Aid Association', 'Olivia Garcia', 'unitedaid@example.com', '5556667777', '159 Street, Town', '86420', 'Uniting efforts for a better world', 'shopaholic@bank7'),
('Peaceful Hearts Initiative', 'Liam Martinez', 'peacefulhearts@example.com', '8889990000', '753 Avenue, Village', '12346', 'Promoting peace and harmony', 'quickpayments@bank8'),
('Supportive Communities Inc.', 'Ava Rodriguez', 'supportivecommunities@example.com', '3334445555', '852 Road, Suburb', '97531', 'Building supportive neighborhoods', 'finance_dept@bank9'),
('Brighter Futures Foundation', 'Noah Hernandez', 'brighterfutures@example.com', '9990001111', '963 Lane, County', '24680', 'Creating brighter futures', 'testuser@bank10');

select * from organizations;


desc organizations;


CREATE TABLE donations (
    id INT AUTO_INCREMENT PRIMARY KEY,
    organizationName VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    mobileNumber VARCHAR(20) NOT NULL,
	amount varchar(10) NOT NULL,
    donationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
drop table donations;
desc donations;
select * from donations;

drop table events;
CREATE TABLE events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    etitle VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    organizer VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    description TEXT
);

use SupportSail;

INSERT INTO events (etitle, location, organizer, date, description) VALUES
('Music Festival', 'City Park', 'ABC Events Company', '2023-05-15', 'A celebration of music with various artists performing.'),
('Tech Conference', 'Convention Center', 'Tech World Inc.', '2023-07-20', 'Explore the latest trends and innovations in technology.'),
('Charity Gala', 'Grand Hotel Ballroom', 'Hope Foundation', '2023-09-10', 'Raising funds for underprivileged children.'),
('Art Exhibition', 'Art Gallery XYZ', 'Artistic Visions', '2023-06-25', 'Showcasing diverse artworks from local and international artists.'),
('Food Fair', 'Central Plaza', 'TasteMasters', '2023-08-05', 'Experience a culinary journey with delicious cuisines.'),
('Fitness Expo', 'Fitness Center Arena', 'FitLife Events', '2023-10-15', 'Discover the latest in health and fitness.'),
('Science Symposium', 'Science Institute Auditorium', 'SciTech Society', '2023-11-30', 'Exploring advancements in various scientific fields.'),
('Fashion Show', 'Fashion Hub Mall', 'StyleX Events', '2023-07-05', 'Showcasing the newest fashion trends.'),
('Business Summit', 'Luxury Hotel Conference Hall', 'BizConnect', '2023-09-25', 'Networking and discussions on corporate strategies.'),
('Film Screening', 'City Cinema', 'Silver Screenings', '2023-06-10', 'Presenting award-winning films from around the world.');

select * from events;




