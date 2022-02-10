-- MySQL Workbench Forward Engineering

/*SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
*/

CREATE DATABASE studentdb;

	use studentdb;

CREATE SCHEMA IF NOT EXISTS studentdb DEFAULT CHARACTER SET utf8 ;
USE studentdb ;


CREATE TABLE IF NOT EXISTS studentdb.student (
  idStudent INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  firstName VARCHAR(45) NULL,
  lastName VARCHAR(45) NULL,
  address VARCHAR(45) NULL,
  phone VARCHAR(45) NULL,
  studentEmail VARCHAR(45) NULL,
  personalEmail VARCHAR(45) NULL,
  interest VARCHAR(45) NULL,
  active BIT(0) NULL,
  program VARCHAR(45) NULL
 
  );


CREATE TABLE IF NOT EXISTS studentdb.jobs (
  idjobs INT /*UNSIGNED*/ NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idStudent INT NULL,
  /*jobActive BOOLEAN,*/

  /*UNIQUE INDEX idStudent_UNIQUE (idStudent ASC) VISIBLE,*/
  CONSTRAINT idStudent
    FOREIGN KEY (idStudent)
    REFERENCES studentdb.student (idStudent)
    ON DELETE CASCADE
    ON UPDATE CASCADE
	
	);

CREATE TABLE IF NOT EXISTS studentdb.notes (
  idNotes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idStudentNotes INT NULL,
  /*UNIQUE INDEX idNotes_UNIQUE (idNotes ASC) VISIBLE,
  UNIQUE INDEX idStudent_UNIQUE (idStudent ASC) VISIBLE,*/
  CONSTRAINT idStudentNotes
    FOREIGN KEY (idStudentNotes)
    REFERENCES studentdb.student (idStudent)
    ON DELETE CASCADE
    ON UPDATE CASCADE
	
	);


CREATE TABLE IF NOT EXISTS studentdb.graduated (
  idgraduated  BIT(0) NOT NULL PRIMARY KEY,
  idStudentGraduated INT NOT NULL,
  
  CONSTRAINT idStudentGraduated
    FOREIGN KEY (idStudentGraduated)
    REFERENCES studentdb.student (idStudent)
    ON DELETE CASCADE
    ON UPDATE CASCADE
	
	);


CREATE TABLE IF NOT EXISTS studentdb.internship (
  idinternship INT /*UNSIGNED*/ NOT NULL PRIMARY KEY,
  idStudentInternship INT NULL,
  internshipCompany VARCHAR(45) NULL,
  internshipSemester VARCHAR(45) NULL,
  
  /*INDEX idStudent_idx (idStudent ASC) VISIBLE,*/
  CONSTRAINT idStudentInternship
    FOREIGN KEY (idStudentInternship)
    REFERENCES studentdb.student (idStudent)
    ON DELETE CASCADE
    ON UPDATE CASCADE
	
	);

CREATE TABLE IF NOT EXISTS studentdb.courseSubstitutions (
  idcourseSubstitutions INT UNSIGNED NOT NULL PRIMARY KEY,
  courseSubstitutionsClass VARCHAR(45) NULL,
  idStudentCourseSub INT NULL,
 
  /*INDEX idStudent_idx (idStudent ASC) VISIBLE,*/
  CONSTRAINT idStudentCourseSub
    FOREIGN KEY (idStudentCourseSub)
    REFERENCES studentdb.student (idStudent)
    ON DELETE CASCADE
    ON UPDATE CASCADE
	
	);

