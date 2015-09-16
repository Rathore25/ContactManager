  CREATE TABLE `contactmanager`.`contact_base` (
  `ContactAutoId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `ContactId` VARCHAR(45) NOT NULL COMMENT '',
  `Name` VARCHAR(45) NULL COMMENT '',
  `Dob` DATETIME NULL COMMENT '',
  `City` VARCHAR(45) NULL COMMENT '',
  `Phone` VARCHAR(45) NULL COMMENT '',
  `EmailId` VARCHAR(100) NULL COMMENT '',
  `AccountRelatedId` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`ContactAutoId`)  COMMENT '');