-- MySQL Script generated by MySQL Workbench
-- Fri Mar 12 03:01:25 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coletaIGTI
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema coletaIGTI
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coletaIGTI` DEFAULT CHARACTER SET utf8 ;
USE `coletaIGTI` ;

-- -----------------------------------------------------
-- Table `coletaIGTI`.`fabricante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coletaIGTI`.`fabricante` (
  `cod_fabricante` INT NOT NULL AUTO_INCREMENT,
  `nome_fabricante` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_fabricante`),
  UNIQUE INDEX `nome_fabricante_UNIQUE` (`nome_fabricante` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coletaIGTI`.`modelo_veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coletaIGTI`.`modelo_veiculo` (
  `cod_modelo` INT NOT NULL AUTO_INCREMENT,
  `descricao_modelo` VARCHAR(45) NULL,
  `cod_fabricante` INT NOT NULL,
  PRIMARY KEY (`cod_modelo`),
  INDEX `fk_modelo_veiculo_fabricante1_idx` (`cod_fabricante` ASC) VISIBLE,
  UNIQUE INDEX `descricao_modelo_UNIQUE` (`descricao_modelo` ASC) VISIBLE,
  CONSTRAINT `fk_modelo_veiculo_fabricante1`
    FOREIGN KEY (`cod_fabricante`)
    REFERENCES `coletaIGTI`.`fabricante` (`cod_fabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coletaIGTI`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coletaIGTI`.`pessoa` (
  `cod_pessoa` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `genero` VARCHAR(45) NULL,
  `data_nascimento` DATE NULL,
  PRIMARY KEY (`cod_pessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `coletaIGTI`.`venda_veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coletaIGTI`.`venda_veiculo` (
  `cod_venda` INT NOT NULL AUTO_INCREMENT,
  `data_venda` DATE NULL,
  `valor_venda` DECIMAL(10,2) NULL,
  `cod_modelo` INT NOT NULL,
  `cod_pessoa` INT NOT NULL,
  PRIMARY KEY (`cod_venda`),
  INDEX `fk_venda_veiculo_modelo_veiculo1_idx` (`cod_modelo` ASC) VISIBLE,
  INDEX `fk_venda_veiculo_pessoa1_idx` (`cod_pessoa` ASC) VISIBLE,
  CONSTRAINT `fk_venda_veiculo_modelo_veiculo1`
    FOREIGN KEY (`cod_modelo`)
    REFERENCES `coletaIGTI`.`modelo_veiculo` (`cod_modelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_veiculo_pessoa1`
    FOREIGN KEY (`cod_pessoa`)
    REFERENCES `coletaIGTI`.`pessoa` (`cod_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
