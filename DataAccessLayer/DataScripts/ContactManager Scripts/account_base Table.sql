CREATE TABLE `contactmanager`.`account_base` (
  `AccountAutoId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `AccountId` VARCHAR(45) NOT NULL COMMENT '',
  `Username` VARCHAR(45) NULL COMMENT '',
  `Password` VARCHAR(45) NULL COMMENT '',
  `FullName` VARCHAR(45) NULL COMMENT '',
  `EmailId` VARCHAR(100) NULL COMMENT '',
  PRIMARY KEY (`AccountAutoId`)  COMMENT '');