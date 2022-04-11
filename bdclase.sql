-- MySQL Script generated by MySQL Workbench
-- lun 11 abr 2022 11:26:35 CEST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema clientes_vip
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema clientes_vip
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `clientes_vip` DEFAULT CHARACTER SET utf8mb4 ;
USE `clientes_vip` ;

-- -----------------------------------------------------
-- Table `clientes_vip`.`clientes potenciales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes_vip`.`clientes potenciales` (
  `idClientes potenciales` INT(11) NOT NULL,
  PRIMARY KEY (`idClientes potenciales`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `clientes_vip`.`operaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes_vip`.`operaciones` (
  `idOperaciones` INT(11) NOT NULL,
  `Fecha` VARCHAR(45) NOT NULL,
  `Cantidad puntos gastados` VARCHAR(45) NOT NULL,
  `OPcliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idOperaciones`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `clientes_vip`.`clientes vip`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes_vip`.`clientes vip` (
  `idclientes vip` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Correo_electronico` VARCHAR(45) NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `Contraseña` VARCHAR(45) NOT NULL,
  `Saldo` INT(11) NOT NULL,
  `Maximo saldo mes` INT(11) NOT NULL,
  `Operaciones_idOperaciones` INT(11) NOT NULL,
  PRIMARY KEY (`idclientes vip`, `Operaciones_idOperaciones`),
  INDEX `fk_clientes vip_Operaciones1_idx` (`Operaciones_idOperaciones` ASC),
  CONSTRAINT `fk_clientes vip_Operaciones1`
    FOREIGN KEY (`Operaciones_idOperaciones`)
    REFERENCES `clientes_vip`.`operaciones` (`idOperaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `clientes_vip`.`gestor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes_vip`.`gestor` (
  `idGestores` INT(11) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Correocontacto` VARCHAR(45) NOT NULL,
  `Años en la empresa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGestores`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `clientes_vip`.`relacion cliente gestor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `clientes_vip`.`relacion cliente gestor` (
  `clientes vip_idclientes vip` INT(11) NOT NULL,
  `clientes vip_Operaciones_idOperaciones` INT(11) NOT NULL,
  `Gestores_idGestores` INT(11) NOT NULL,
  PRIMARY KEY (`clientes vip_idclientes vip`, `clientes vip_Operaciones_idOperaciones`, `Gestores_idGestores`),
  INDEX `fk_clientes vip_has_Gestores_Gestores1_idx` (`Gestores_idGestores` ASC),
  INDEX `fk_clientes vip_has_Gestores_clientes vip1_idx` (`clientes vip_idclientes vip` ASC, `clientes vip_Operaciones_idOperaciones` ASC),
  CONSTRAINT `fk_clientes vip_has_Gestores_Gestores1`
    FOREIGN KEY (`Gestores_idGestores`)
    REFERENCES `clientes_vip`.`gestor` (`idGestores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_clientes vip_has_Gestores_clientes vip1`
    FOREIGN KEY (`clientes vip_idclientes vip` , `clientes vip_Operaciones_idOperaciones`)
    REFERENCES `clientes_vip`.`clientes vip` (`idclientes vip` , `Operaciones_idOperaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
