CREATE DATABASE Project2_DB;

CREATE TABLE User(
    User_ID integer NOT NULL,
    User_Name Varchar(255),
    User_Role Varchar(255) NOT NULL,
    Email Varchar(255),
    Phone Varchar(255),
    PRIMARY KEY (User_ID)
);

CREATE TABLE Admin(
    Admin_ID integer NOT NULL,
    Admin_name Varchar(255),
    Admin_department Varchar(255),
    Account_Status Varchar(255),
    Created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (Admin_ID)
);

CREATE TABLE Supervisor(
    Supervisor_id integer NOT NULL,
    Supervisor_name Varchar(255),
    Supervisor_department Varchar(255),
    Assigned_department Varchar(255),
    Account_Status Varchar(255),
    Created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (Supervisor_id)
);

CREATE TABLE Trainee(
    Trainee_id integer NOT NULL,
    Supervisor_id integer NOT NULL,
    Trainee_name Varchar(255),
    Trainee_department Varchar(255),
    Enrollment_year Varchar(255),
    Account_Status Varchar(255),
    Created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (Trainee_id),
    FOREIGN KEY (Supervisor_id) REFERENCES Supervisor(Supervisor_id)

);

CREATE TABLE Pationt(
    Pationt_id integer NOT NULL,
    Trainee_id integer NOT NULL,
    Pationt_name Varchar(255),
    Pationt_contact_number Varchar(255) NOT NULL,
    Pationt_email Varchar(255),
    Appointment_date TIMESTAMP NOT NULL DEFAULT NOW(),
    Pationt_department Varchar(255),
    Account_Status Varchar(255),
    Created_at TIMESTAMP NOT NULL DEFAULT NOW(),
    PRIMARY KEY (Pationt_id),
    FOREIGN KEY (Trainee_id) REFERENCES Trainee(Trainee_id)
);

CREATE TABLE Appointment(
    Appointment_id integer NOT NULL,
    User_ID integer NOT NULL,
    Appointment_date TIMESTAMP NOT NULL DEFAULT NOW(),
    Start_Time TIMESTAMP NOT NULL DEFAULT NOW(),
    End_Time TIMESTAMP NOT NULL DEFAULT NOW(),
    Appointment_description Varchar(255),
    Account_Status Varchar(255),
    PRIMARY KEY (Appointment_id),
    FOREIGN KEY (User_ID) REFERENCES User(User_ID)
);