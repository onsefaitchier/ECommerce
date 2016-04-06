-- MySQL Script generated by MySQL Workbench
-- lun. 04 avril 2016 23:04:28 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categories` (
  `CategoryId` INT NOT NULL,
  `Category` VARCHAR(45) NULL,
  PRIMARY KEY (`CategoryId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `ProductId` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(255) NULL,
  `Price` FLOAT NULL,
  `Categories_CategoryId` INT NOT NULL,
  PRIMARY KEY (`ProductId`),
  INDEX `fk_Products_Categories_idx` (`Categories_CategoryId` ASC),
  CONSTRAINT `fk_Products_Categories`
    FOREIGN KEY (`Categories_CategoryId`)
    REFERENCES `mydb`.`Categories` (`CategoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orders` (
  `OrderId` INT NOT NULL,
  `ContactName` VARCHAR(255) NULL,
  `DeliveryAddress` VARCHAR(255) NULL,
  `CCName` VARCHAR(255) NULL,
  `CCNumber` INT NULL,
  `CCExpiryDate` DATE NULL,
  PRIMARY KEY (`OrderId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderDetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderDetails` (
  `Orders_OrderId` INT NOT NULL,
  `Categories_CategoryId` INT NOT NULL,
  `Quantity` INT NULL,
  `Price` VARCHAR(45) NULL,
  INDEX `fk_OrderDetails_Orders1_idx` (`Orders_OrderId` ASC),
  INDEX `fk_OrderDetails_Categories1_idx` (`Categories_CategoryId` ASC),
  CONSTRAINT `fk_OrderDetails_Orders1`
    FOREIGN KEY (`Orders_OrderId`)
    REFERENCES `mydb`.`Orders` (`OrderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderDetails_Categories1`
    FOREIGN KEY (`Categories_CategoryId`)
    REFERENCES `mydb`.`Categories` (`CategoryId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
