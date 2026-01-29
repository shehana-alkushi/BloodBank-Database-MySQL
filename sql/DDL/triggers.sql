-- =========================================
-- Trigger: Set blood expiration date (42 days)
-- =========================================
DELIMITER //
CREATE TRIGGER set_expiration_date
BEFORE INSERT ON Blood
FOR EACH ROW
BEGIN
  SET NEW.Expiration_Date = DATE_ADD(NEW.Blood_DonationDate, INTERVAL 42 DAY);
END;
//
  
-- =========================================
-- Trigger: Update donor eligibility based on test results
-- =========================================
DELIMITER //
CREATE TRIGGER update_donor_eligibility
AFTER INSERT ON Test_Report
FOR EACH ROW
BEGIN
  DECLARE eligibility_status VARCHAR(20);

  IF (
      NEW.Test_Result = 'PASSED'
     ) THEN
    SET 
       eligibility_status = 'Eligible';
  ELSE
    SET eligibility_status = 'Not Eligible';
  END IF;
    UPDATE Donor
    SET
      Donor_Eligibility = eligibility_status
  WHERE Donor_ID = NEW.Donor_ID;
END;

//
