USE `contactmanager`;
DROP procedure IF EXISTS `udsp_Account_Register`;

DELIMITER $$
USE `contactmanager`$$
CREATE PROCEDURE `udsp_Account_Register`(
	var_AccountId 	VARCHAR(100)	,
	var_Username 	VARCHAR(45)		,
	var_Password 	VARCHAR(45)		,
	var_FullName 	VARCHAR(45)		,
	var_EmailId 	VARCHAR(100)
)
BEGIN

INSERT INTO account_base	(AccountId	 	 ,Username    ,Password    ,FullName    ,EmailId	) VALUES
							(var_AccountId	 ,var_Username,var_Password,var_FullName,var_EmailId);

END$$

DELIMITER ;