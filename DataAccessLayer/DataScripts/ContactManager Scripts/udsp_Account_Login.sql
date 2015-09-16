USE `contactmanager`;
DROP procedure IF EXISTS `udsp_Account_Login`;

DELIMITER $$
USE `contactmanager`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `udsp_Account_Login`(
	var_Username 	varchar(45)		,
	var_Password 	varchar(45)
)
BEGIN

SELECT * FROM account_base 
WHERE 
	Username	=	var_Username
AND
	Password	=	var_Password;
    
END$$

DELIMITER ;