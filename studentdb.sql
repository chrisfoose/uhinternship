-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `idStudent` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `studentEmail` VARCHAR(45) NULL,
  `personalEmail` VARCHAR(45) NULL,
  `interest` VARCHAR(45) NULL,
  `active` BIT(0) NULL,
  `program` VARCHAR(45) NULL,
  `CA` BIT(0) NULL,
  `CO` BIT(0) NULL,
  `AS` BIT(0) NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE INDEX `idStudent_UNIQUE` (`idStudent` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Notes` (
  `idNotes` INT NOT NULL AUTO_INCREMENT,
  `idStudent` INT NULL,
  PRIMARY KEY (`idNotes`),
  UNIQUE INDEX `idNotes_UNIQUE` (`idNotes` ASC) VISIBLE,
  UNIQUE INDEX `idStudent_UNIQUE` (`idStudent` ASC) VISIBLE,
  CONSTRAINT `idStudent`
    FOREIGN KEY (`idStudent`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`jobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`jobs` (
  `idjobs` INT UNSIGNED NOT NULL,
  `idStudent` INT NULL,
  `jobActive` TINYINT(1) NULL,
  PRIMARY KEY (`idjobs`),
  UNIQUE INDEX `idStudent_UNIQUE` (`idStudent` ASC) VISIBLE,
  CONSTRAINT `idStudent`
    FOREIGN KEY (`idStudent`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`graduated`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`graduated` (
  `idgraduated` TINYINT(1) NOT NULL,
  `idStudent` INT NOT NULL,
  PRIMARY KEY (`idStudent`),
  CONSTRAINT `idStudent`
    FOREIGN KEY (`idStudent`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`internship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`internship` (
  `idinternship` INT UNSIGNED NOT NULL,
  `idStudent` INT NULL,
  `internshipCompany` VARCHAR(45) NULL,
  `internshipSemester` VARCHAR(45) NULL,
  PRIMARY KEY (`idinternship`),
  INDEX `idStudent_idx` (`idStudent` ASC) VISIBLE,
  CONSTRAINT `idStudent`
    FOREIGN KEY (`idStudent`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`courseSubstitutions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`courseSubstitutions` (
  `idcourseSubstitutions` INT UNSIGNED NOT NULL,
  `courseSubstitutionsClass` VARCHAR(45) NULL,
  `idStudent` INT NULL,
  PRIMARY KEY (`idcourseSubstitutions`),
  INDEX `idStudent_idx` (`idStudent` ASC) VISIBLE,
  CONSTRAINT `idStudent`
    FOREIGN KEY (`idStudent`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ics101`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ics101` (
  `idics101` INT NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  PRIMARY KEY (`idics101`),
  UNIQUE INDEX `idics101_UNIQUE` (`idics101` ASC) VISIBLE,
  INDEX `studentID_idx` (`studentID` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its103`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its103` (
  `idits103` INT NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  PRIMARY KEY (`idits103`),
  UNIQUE INDEX `idits103_UNIQUE` (`idits103` ASC) VISIBLE,
  INDEX `studentID_idx` (`studentID` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its104`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its104` (
  `idits104` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  PRIMARY KEY (`idits104`),
  INDEX `studentID_idx` (`studentID` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`acc201`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`acc201` (
  `idacc201` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idacc201`),
  UNIQUE INDEX `idacc201_UNIQUE` (`idacc201` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`idacc201`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `lastName`
    FOREIGN KEY ()
    REFERENCES `mydb`.`student` ()
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`eng102`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`eng102` (
  `ideng102` INT NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  PRIMARY KEY (`ideng102`),
  UNIQUE INDEX `ideng102_UNIQUE` (`ideng102` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its108`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its108` (
  `idits108` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  PRIMARY KEY (`idits108`),
  INDEX `studentID_idx` (`studentID` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its118`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its118` (
  `idits118` INT NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  `its118col` VARCHAR(45) NULL,
  PRIMARY KEY (`idits118`),
  UNIQUE INDEX `idits118_UNIQUE` (`idits118` ASC) VISIBLE,
  INDEX `studentID_idx` (`studentID` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its121`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its121` (
  `idits121` INT NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  PRIMARY KEY (`idits121`),
  UNIQUE INDEX `idits121_UNIQUE` (`idits121` ASC) VISIBLE,
  INDEX `studentID_idx` (`studentID` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`eng100`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`eng100` (
  `ideng100` INT NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  PRIMARY KEY (`ideng100`),
  UNIQUE INDEX `ideng100_UNIQUE` (`ideng100` ASC) VISIBLE,
  INDEX `studentID_idx` (`studentID` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`math100`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`math100` (
  `idmath100` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idmath100`),
  UNIQUE INDEX `idmath100_UNIQUE` (`idmath100` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its129`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its129` (
  `idits129` INT NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  PRIMARY KEY (`idits129`),
  UNIQUE INDEX `idits129_UNIQUE` (`idits129` ASC) VISIBLE,
  INDEX `studentID_idx` (`studentID` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its215`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its215` (
  `idits215` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idits215`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its218`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its218` (
  `idits218` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idits218`),
  UNIQUE INDEX `idits218_UNIQUE` (`idits218` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`spco151`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`spco151` (
  `idspco151` INT NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  PRIMARY KEY (`idspco151`),
  UNIQUE INDEX `idspco151_UNIQUE` (`idspco151` ASC) VISIBLE,
  INDEX `studentID_idx` (`studentID` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its124`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its124` (
  `idits124` INT NOT NULL AUTO_INCREMENT,
  `studentID` INT NULL,
  `its124col` VARCHAR(45) NULL,
  PRIMARY KEY (`idits124`),
  UNIQUE INDEX `idits124_UNIQUE` (`idits124` ASC) VISIBLE,
  INDEX `studentID_idx` (`studentID` ASC) VISIBLE,
  CONSTRAINT `studentID`
    FOREIGN KEY (`studentID`)
    REFERENCES `mydb`.`student` (`idStudent`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its221`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its221` (
  `idits221` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idits221`),
  UNIQUE INDEX `idits221_UNIQUE` (`idits221` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its287`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its287` (
  `idits287` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idits287`),
  UNIQUE INDEX `idits287_UNIQUE` (`idits287` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`its288`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`its288` (
  `idits288` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idits288`),
  UNIQUE INDEX `idits288_UNIQUE` (`idits288` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ics281`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ics281` (
  `idics281` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idics281`),
  UNIQUE INDEX `idics281_UNIQUE` (`idics281` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ics282`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ics282` (
  `idics282` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idics282`),
  UNIQUE INDEX `idics282_UNIQUE` (`idics282` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Program` (
  `idProgram` INT NOT NULL AUTO_INCREMENT,
  `year` YEAR(4) NULL,
  PRIMARY KEY (`idProgram`),
  UNIQUE INDEX `idProgram_UNIQUE` (`idProgram` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
