USE `contactmanager`;
DROP procedure IF EXISTS `udsp_Contact_Retrieve`;

DELIMITER $$
USE `contactmanager`$$
CREATE PROCEDURE `udsp_Contact_Retrieve`(
var_ContactId 			VARCHAR(45)		,
var_AccountRelatedId 	VARCHAR(45)
)
BEGIN

IF(var_ContactId = "") THEN
	SELECT * FROM contact_base WHERE AccountRelatedId=var_AccountRelatedId;
ELSE
	SELECT * FROM contact_base WHERE ContactId=var_ContactId;
END IF;

END$$

DELIMITER ;