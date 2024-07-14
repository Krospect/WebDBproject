
create database cs336project;
use cs336project;
show tables;
CREATE TABLE Customers (
    ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Username VARCHAR(100),
    Password VARCHAR(100),
    Email_address VARCHAR(250)
);
CREATE TABLE Employee(
	SSN varchar(11) PRIMARY KEY, 
    First_Name varchar(50), 
    Last_Name varchar(50), 
    Username varchar(100), 
    Password varchar(100) 
);
CREATE TABLE Train (
	Four_Digit_Number_ID int(4) PRIMARY KEY, 
    TL_Name varchar(250)
);
CREATE TABLE Schedule(
	ID int PRIMARY KEY, 
	TrainID int(4), 
    DepTime time, 
    ArrTime time, 
    Destination varchar(250), 
    Fare float, 
    Origin varchar(250),
    foreign key (TrainID) references Train(Four_Digit_Number_ID)
);
CREATE TABLE Reservations(
	Reservation_Number int PRIMARY KEY, 
    cust_id int, 
    Sched_id int, 
    Total_Fare float, 
    Date date,
    foreign key (cust_id) references Customers(ID), 
    foreign key (Sched_id) references Schedule(ID)
);
CREATE TABLE Books(
	ID int, 
    Sched_ID int, 
    Reservation_Number int, 
    primary key (ID, Sched_ID), 
    foreign key (ID) references Customers(ID), 
    foreign key (Sched_ID) references Schedule(ID), 
    foreign key (Reservation_Number) references Reservations(Reservation_Number)
);
CREATE TABLE Stations(
	ID int PRIMARY KEY, 
	Train_ID int(4), 
	Name varchar(250), 
    Travel_Time_From_Stop_1 time, 
    Stop_Number int, 
    City varchar(100), 
    State varchar(2), 
    foreign key (Train_ID) references Train(Four_Digit_Number_ID)
);
CREATE TABLE Goes(
	Train_ID int(4) PRIMARY KEY, 
    Station_ID int, 
    Sched_ID int,
    foreign key (Train_ID) references Train(Four_Digit_Number_ID), 
    foreign key (Station_ID) references Stations(ID), 
    foreign key (Sched_ID) references Schedule(ID)
);

INSERT INTO Customers (ID, First_Name, Last_Name, Username, Password, Email_address)
VALUES (1, 'Alice', 'Smith', 'AliceSmith', 'password123', 'alice.smith@example.com'),
       (2, 'Bob', 'Johnson', 'BobJohnson', 'password456', 'bob.johnson@example.com');
INSERT INTO Employee (SSN, First_Name, Last_Name, Username, Password)
VALUES ('123-45-6789', 'Charlie', 'Brown', 'CharlieBrown', 'pass789'),
       ('987-65-4321', 'Diana', 'Prince', 'DianaPrince', 'wonder123');
INSERT INTO Train (Four_Digit_Number_ID, TL_Name)
VALUES (1001, 'Express Line'),
       (1002, 'Local Line');
INSERT INTO Schedule (ID, TrainID, DepTime, ArrTime, Destination, Fare, Origin)
VALUES (1, 1001, '08:00:00', '12:00:00', 'CityA', 50.0, 'CityB'),
       (2, 1002, '09:00:00', '13:00:00', 'CityC', 45.0, 'CityD');
INSERT INTO Reservations (Reservation_Number, cust_id, Sched_id, Total_Fare, Date)
VALUES (1, 1, 1, 50.0, '2024-07-01'),
       (2, 2, 2, 45.0, '2024-07-02');
INSERT INTO Books (ID, Sched_ID, Reservation_Number)
VALUES (1, 1, 1),
       (2, 2, 2);
INSERT INTO Stations (ID, Train_ID, Name, Travel_Time_From_Stop_1, Stop_Number, City, State)
VALUES (1, 1001, 'Station A', '00:30:00', 1, 'CityA', 'CA'),
       (2, 1002, 'Station B', '01:00:00', 2, 'CityB', 'NY');
INSERT INTO Goes (Train_ID, Station_ID, Sched_ID)
VALUES (1001, 1, 1),
       (1002, 2, 2);

show tables;
