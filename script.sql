-- MySQL Script generated by MySQL Workbench
-- Sat Dec 12 13:29:45 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema heroku_6d4806f4a1447f9
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Usuario` (
  `usuario` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `nombre` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NOT NULL,
  `contrasena` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `direccion` VARCHAR(45) NULL,
  `rol` TINYINT NOT NULL,
  PRIMARY KEY (`usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Categoria` (
  `categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Producto` (
  `producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `cantidad` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  `proveedor` INT NOT NULL,
  `categoria` INT NOT NULL,
  PRIMARY KEY (`producto`),
  INDEX `fk_Producto_Usuario_idx` (`proveedor` ASC) VISIBLE,
  INDEX `fk_Producto_Categoria1_idx` (`categoria` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Usuario`
    FOREIGN KEY (`proveedor`)
    REFERENCES `Usuario` (`usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_Categoria1`
    FOREIGN KEY (`categoria`)
    REFERENCES `Categoria` (`categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Carrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Carrito` (
  `usuario` INT NOT NULL,
  `producto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`usuario`, `producto`),
  INDEX `fk_Usuario_has_Producto_Producto1_idx` (`producto` ASC) VISIBLE,
  INDEX `fk_Usuario_has_Producto_Usuario1_idx` (`usuario` ASC) VISIBLE,
  CONSTRAINT `fk_Usuario_has_Producto_Usuario1`
    FOREIGN KEY (`usuario`)
    REFERENCES `Usuario` (`usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Producto_Producto1`
    FOREIGN KEY (`producto`)
    REFERENCES `Producto` (`producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
