=============================================
-- Age group is between 18 and 65 for donors 
=============================================
ALTER TABLE Donor
ADD CONSTRAINT chk_donor_age CHECK (Age BETWEEN 18 AND 65);

=============================================
-- Weight should be more than / equal to 50 
=============================================
ALTER TABLE Donor
ADD CONSTRAINT chk_donor_weight CHECK (Weight >= 50);

