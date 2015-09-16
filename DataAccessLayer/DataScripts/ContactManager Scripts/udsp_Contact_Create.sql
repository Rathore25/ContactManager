USE `contactmanager`;
DROP procedure IF EXISTS `udsp_Contact_Create`;

DELIMITER $$
USE `contactmanager`$$
CREATE PROCEDURE `udsp_Contact_Create`(
 var_ContactId			VARCHAR(45)		,
 var_Name				VARCHAR(45)		,
 var_Dob				DATETIME		,
 var_City				VARCHAR(45)		,
 var_Phone				VARCHAR(45)		,
 var_EmailId			VARCHAR(100)	,
 var_AccountRelatedId	VARCHAR(45)
)
BEGIN

DECLARE error_InvalidInputs       CONDITION FOR SQLSTATE 'HY000';


IF NOT EXISTS(SELECT * FROM contact_base WHERE Name=var_Name AND Phone=var_Phone AND EmailId=var_EmailId AND AccountRelatedId=var_AccountRelatedId) THEN
	INSERT INTO contact_base 	(ContactId		,Name		,Dob	,City		,Phone		,EmailId	,AccountRelatedId		) VALUES
								(var_ContactId	,var_Name	,var_Dob,var_City	,var_Phone	,var_EmailId,var_AccountRelatedId   );
ELSE
	SIGNAL error_InvalidInputs
	SET MESSAGE_TEXT    = "Contact already exists.",
	MYSQL_ERRNO     	= 2002;
END IF;

END$$

DELIMITER ;