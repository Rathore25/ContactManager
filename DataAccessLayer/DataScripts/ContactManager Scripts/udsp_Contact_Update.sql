USE `contactmanager`;
DROP procedure IF EXISTS `udsp_Contact_Update`;

DELIMITER $$
USE `contactmanager`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `udsp_Contact_Update`(
	var_ContactId			VARCHAR(45)		,
	var_Name				VARCHAR(45)		,
	var_Dob					DATETIME		,
	var_City				VARCHAR(45)		,
	var_Phone				VARCHAR(45)		,
	var_EmailId				VARCHAR(100)	,
	var_AccountRelatedId	VARCHAR(45)
)
BEGIN

UPDATE contact_base

SET 
	Name		=	var_Name	,
    Dob			=	var_Dob		,
    City		=	var_City	,
    Phone		=	var_Phone	,
    EmailId		=	var_EmailId
    
    WHERE 	ContactId=var_ContactId AND AccountRelatedId=var_AccountRelatedId;

END$$

DELIMITER ;