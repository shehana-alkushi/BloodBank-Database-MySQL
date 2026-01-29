-- =========================
-- Jobs Table
-- =========================
CREATE TABLE Jobs (
  Job_Title VARCHAR(50) PRIMARY KEY,
  Salary DECIMAL(10,2) NOT NULL
);

-- =========================
-- Staff Table
-- =========================
CREATE TABLE Staff (
  Staff_ID INT PRIMARY KEY AUTO_INCREMENT,
  First_Name VARCHAR(25) NOT NULL,
  Last_Name VARCHAR(25) NOT NULL,
  Job_Title VARCHAR(50) NOT NULL,
  Hiring_Date DATE NOT NULL,
  FOREIGN KEY (Job_Title) REFERENCES Jobs(Job_Title)
);

-- =========================
-- Donor Table
-- =========================
CREATE TABLE Donor (
  Donor_ID INT PRIMARY KEY AUTO_INCREMENT,
  First_Name VARCHAR(25) NOT NULL,
  Last_Name VARCHAR(25) NOT NULL,
  Gender ENUM('F','M'),
  Age INT NOT NULL,
  Blood_Type ENUM('+A','+B','+O','+AB','-A','-B','-O','-AB') NOT NULL,
  Weight FLOAT NOT NULL,
  Height FLOAT NOT NULL,
  Donor_Eligibility ENUM('Eligible','Not Eligible'),
  Donation_Date DATETIME,
  Staff_ID INT NOT NULL,
  FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- =========================
-- Recipients Table
-- =========================
CREATE TABLE Recipients (
  Recipient_ID INT PRIMARY KEY AUTO_INCREMENT,
  First_Name VARCHAR(25) NOT NULL,
  Last_Name VARCHAR(25) NOT NULL,
  Gender ENUM('F','M'),
  Blood_Type ENUM('+A','+B','+O','+AB','-A','-B','-O','-AB') NOT NULL,
  DOB DATE,
  Staff_ID INT NOT NULL,
  FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- =========================
-- Appointment Table
-- =========================
CREATE TABLE Appointment (
  Appointment_ID INT PRIMARY KEY AUTO_INCREMENT,
  Date_Time DATETIME NOT NULL,
  Donor_ID INT NOT NULL,
  Status ENUM('Available','Booked'),
  FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID)
);

-- =========================
-- Tests Table (Template)
-- =========================
CREATE TABLE Tests (
  Test_Result ENUM('PASSED','FAILED','Requires Recheck') PRIMARY KEY,
  Blood_Pressure FLOAT NOT NULL,
  Hemoglobin_Lvl FLOAT NOT NULL,
  Hepatitis_B_Result ENUM('Positive','Negative') NOT NULL,
  Hepatitis_C_Result ENUM('Positive','Negative') NOT NULL,
  HIV_Result ENUM('Positive','Negative') NOT NULL,
  Malaria_Result ENUM('Positive','Negative') NOT NULL
);

-- =========================
-- Test Report Table
-- =========================
CREATE TABLE Test_Report (
  Report_ID INT PRIMARY KEY AUTO_INCREMENT,
  Donor_ID INT NOT NULL,
  Staff_ID INT NOT NULL,
  Test_Result ENUM('PASSED','FAILED','Requires Recheck'),
  FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID),
  FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
  FOREIGN KEY (Test_Result) REFERENCES Tests(Test_Result)
);

-- =========================
-- Blood Table
-- =========================
CREATE TABLE Blood (
  BloodBag_ID INT PRIMARY KEY AUTO_INCREMENT,
  Blood_DonationDate DATE NOT NULL,
  Expiration_Date DATE,
  Donor_ID INT NOT NULL,
  Staff_ID INT NOT NULL,
  Blood_Type ENUM('+A','+B','+O','+AB','-A','-B','-O','-AB') NOT NULL,
  FOREIGN KEY (Donor_ID) REFERENCES Donor(Donor_ID),
  FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

-- =========================
-- Recipient Blood (Bridge Table)
-- =========================
CREATE TABLE Rec_Blood (
  BloodBag_ID INT NOT NULL,
  Recipient_ID INT NOT NULL,
  PRIMARY KEY (BloodBag_ID, Recipient_ID),
  FOREIGN KEY (BloodBag_ID) REFERENCES Blood(BloodBag_ID),
  FOREIGN KEY (Recipient_ID) REFERENCES Recipients(Recipient_ID)
);
