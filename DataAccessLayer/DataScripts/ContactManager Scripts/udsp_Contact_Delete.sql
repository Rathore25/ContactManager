USE `contactmanager`;
DROP procedure IF EXISTS `udsp_Contact_Delete`;

DELIMITER $$
USE `contactmanager`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `udsp_Contact_Delete`(
	var_ContactId	varchar(45)
)
BEGIN

DELETE FROM contact_base WHERE ContactId=var_ContactId ;

END$$

DELIMITER ;