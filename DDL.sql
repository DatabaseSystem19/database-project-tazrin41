drop table Health_Care;
drop table Tutor_Info;
drop table Child_Care_Centre;
drop table Total_ID;
drop table Child_Info;

// CREATE TABLE Child_Information (
    Child_ID INT PRIMARY KEY,
    Child_Name VARCHAR(50),
    Child_Age INT,
    Parent_Name VARCHAR(50),
    Contact VARCHAR(20),
    Address VARCHAR(100),
    Requirement VARCHAR(200)
);

//  CREATE TABLE Total_ID (
    Day_Nursery_ID INT PRIMARY KEY,
    Child_ID INT,
    Health_ID INT,
    Education_ID INT,
    Date_required DATE,
    Total INT,
    FOREIGN KEY (Child_ID) REFERENCES Child_Information(Child_ID)
);

//  CREATE TABLE Child_Care_Centre (
    Day_Nursery_ID INT,
    Child_ID INT,
    Branch_ID INT,
    Centre_Name VARCHAR(100),
    Location VARCHAR(100),
    Admin_Name VARCHAR(50),
    Contact VARCHAR(20),
    FOREIGN KEY (Day_Nursery_ID) REFERENCES Total_ID(Day_Nursery_ID),
    FOREIGN KEY (Child_ID) REFERENCES Child_Information(Child_ID)
);

//  CREATE TABLE Tutor_Info (
    Tutor_ID INT PRIMARY KEY,
    Tutor_Name VARCHAR(50),
    Contact VARCHAR(20),
    Objective VARCHAR(200),
    Child_ID INT,
    FOREIGN KEY (Child_ID) REFERENCES Child_Information(Child_ID)
);

// CREATE TABLE Health_Care (
    Pediatrician_Name VARCHAR(50),
    Pediatrician_ID INT,
    Hospital_Name VARCHAR(100),
    Contact VARCHAR(20),
    Problem VARCHAR(200),
    Child_ID INT,
    FOREIGN KEY (Child_ID) REFERENCES Child_Information(Child_ID)
);

ALTER TABLE Health_Care
ADD Pediatrician_Info;

ALTER TABLE Health_Care
RENAME COLUMN P_Info;

ALTER TABLE Health_Care
DROP COLUMN P_Info;

