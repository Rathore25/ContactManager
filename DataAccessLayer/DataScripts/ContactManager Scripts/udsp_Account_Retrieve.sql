USE `contactmanager`;
DROP procedure IF EXISTS `udsp_Account_Retrieve`;

DELIMITER $$
USE `contactmanager`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `udsp_Account_Retrieve`(
	var_Username 	VARCHAR(45)		,
	var_EmailId 	VARCHAR(100)
)
BEGIN

SELECT * FROM account_base 
WHERE 
	Username	=	var_Username
AND
	EmailId		=	var_EmailId;
    
END$$

DELIMITER ;
