-- MySQL Script generated by MySQL Workbench
-- mar 13 dic 2022 13:20:47
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Proyecto Final - Argentina Programa
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Proyecto Final - Argentina Programa` ;

-- -----------------------------------------------------
-- Schema Proyecto Final - Argentina Programa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Proyecto Final - Argentina Programa` ;
USE `Proyecto Final - Argentina Programa` ;

-- -----------------------------------------------------
-- Table `Proyecto Final - Argentina Programa`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto Final - Argentina Programa`.`Usuario` ;

CREATE TABLE IF NOT EXISTS `Proyecto Final - Argentina Programa`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Usuario` VARCHAR(45) NOT NULL,
  `Contrasenia` VARCHAR(45) NOT NULL,
  `Fecha_Alta` DATE NOT NULL,
  `Estado` TINYINT NOT NULL,
  PRIMARY KEY (`idUsuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto Final - Argentina Programa`.`Persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto Final - Argentina Programa`.`Persona` ;

CREATE TABLE IF NOT EXISTS `Proyecto Final - Argentina Programa`.`Persona` (
  `DNI` INT NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Fecha_Nacimiento` DATE NOT NULL,
  `Nacionalidad` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`, `Email`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE,
  CONSTRAINT `fk_Persona`
    FOREIGN KEY (`DNI`)
    REFERENCES `Proyecto Final - Argentina Programa`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto Final - Argentina Programa`.`Experiencia_Laboral`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto Final - Argentina Programa`.`Experiencia_Laboral` ;

CREATE TABLE IF NOT EXISTS `Proyecto Final - Argentina Programa`.`Experiencia_Laboral` (
  `idExperiencia_Laboral` INT NOT NULL AUTO_INCREMENT,
  `Empresa` VARCHAR(45) NOT NULL,
  `Cargo` VARCHAR(45) NULL,
  `Fecha_Inicio` DATE NULL,
  `Fecha_Fin` DATE NULL,
  PRIMARY KEY (`idExperiencia_Laboral`),
  CONSTRAINT `fk_Experiencia_Laboral`
    FOREIGN KEY (`idExperiencia_Laboral`)
    REFERENCES `Proyecto Final - Argentina Programa`.`Persona` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto Final - Argentina Programa`.`Tecnologias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto Final - Argentina Programa`.`Tecnologias` ;

CREATE TABLE IF NOT EXISTS `Proyecto Final - Argentina Programa`.`Tecnologias` (
  `idTecnologias` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NULL,
  `Version` DECIMAL NULL,
  PRIMARY KEY (`idTecnologias`),
  CONSTRAINT `fk_Tecnologias`
    FOREIGN KEY (`idTecnologias`)
    REFERENCES `Proyecto Final - Argentina Programa`.`Persona` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto Final - Argentina Programa`.`Proyectos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto Final - Argentina Programa`.`Proyectos` ;

CREATE TABLE IF NOT EXISTS `Proyecto Final - Argentina Programa`.`Proyectos` (
  `idProyectos` INT NOT NULL AUTO_INCREMENT,
  `Fecha_Publicacion` DATE NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Descripcion` VARCHAR(200) NULL,
  `Url` VARCHAR(2000) NOT NULL,
  `Icono` VARCHAR(500) NULL,
  PRIMARY KEY (`idProyectos`),
  CONSTRAINT `fk_Proyectos`
    FOREIGN KEY (`idProyectos`)
    REFERENCES `Proyecto Final - Argentina Programa`.`Persona` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto Final - Argentina Programa`.`Educacion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto Final - Argentina Programa`.`Educacion` ;

CREATE TABLE IF NOT EXISTS `Proyecto Final - Argentina Programa`.`Educacion` (
  `idEducacion` INT NOT NULL AUTO_INCREMENT,
  `Institucion` VARCHAR(45) NOT NULL,
  `Carrera` VARCHAR(45) NOT NULL,
  `Fecha_Inicio` DATE NOT NULL,
  `Fecha_Fin` DATE NOT NULL,
  PRIMARY KEY (`idEducacion`),
  CONSTRAINT `fk_Educacion`
    FOREIGN KEY (`idEducacion`)
    REFERENCES `Proyecto Final - Argentina Programa`.`Persona` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Proyecto Final - Argentina Programa`.`Domicilio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Proyecto Final - Argentina Programa`.`Domicilio` ;

CREATE TABLE IF NOT EXISTS `Proyecto Final - Argentina Programa`.`Domicilio` (
  `idDomicilio` INT NOT NULL AUTO_INCREMENT,
  `Calle` VARCHAR(45) NULL,
  `Numero` INT NULL,
  `Barrio` VARCHAR(60) NULL,
  `Ciudad` VARCHAR(60) NULL,
  `Departamento` VARCHAR(60) NULL,
  `Provincia` VARCHAR(60) NULL,
  `Pais` VARCHAR(56) NULL,
  PRIMARY KEY (`idDomicilio`),
  CONSTRAINT `fk_Domicilio_Educacion`
    FOREIGN KEY (`idDomicilio`)
    REFERENCES `Proyecto Final - Argentina Programa`.`Educacion` (`idEducacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Domicilio_Persona`
    FOREIGN KEY (`idDomicilio`)
    REFERENCES `Proyecto Final - Argentina Programa`.`Persona` (`DNI`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Domicilio_Experiencia`
    FOREIGN KEY (`idDomicilio`)
    REFERENCES `Proyecto Final - Argentina Programa`.`Experiencia_Laboral` (`idExperiencia_Laboral`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
