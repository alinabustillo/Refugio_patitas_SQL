-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema refugio_patitas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema refugio_patitas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `refugio_patitas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `refugio_patitas` ;

-- -----------------------------------------------------
-- Table `refugio_patitas`.`razas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refugio_patitas`.`razas` (
  `id_raza` INT NOT NULL AUTO_INCREMENT,
  `nombre_raza` VARCHAR(50) NOT NULL,
  `tipo_animal` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_raza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refugio_patitas`.`animales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refugio_patitas`.`animales` (
  `id_animal` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `fecha_ingreso` DATE NOT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `peso` DECIMAL(5,2) NULL DEFAULT NULL,
  `castrado` VARCHAR(2) NULL DEFAULT NULL,
  `estado` VARCHAR(20) NOT NULL,
  `id_raza` INT NOT NULL,
  PRIMARY KEY (`id_animal`),
  INDEX `id_raza` (`id_raza` ASC) VISIBLE,
  CONSTRAINT `animales_ibfk_1`
    FOREIGN KEY (`id_raza`)
    REFERENCES `refugio_patitas`.`razas` (`id_raza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refugio_patitas`.`adoptantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refugio_patitas`.`adoptantes` (
  `id_adoptante` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `dni` VARCHAR(15) NOT NULL,
  `edad` INT NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(150) NOT NULL,
  `email` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id_adoptante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refugio_patitas`.`adopciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refugio_patitas`.`adopciones` (
  `id_adopcion` INT NOT NULL AUTO_INCREMENT,
  `id_animal` INT NOT NULL,
  `id_adoptante` INT NOT NULL,
  `fecha_adopcion` DATE NOT NULL,
  `detalle` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id_adopcion`),
  INDEX `id_animal` (`id_animal` ASC) VISIBLE,
  INDEX `id_adoptante` (`id_adoptante` ASC) VISIBLE,
  CONSTRAINT `adopciones_ibfk_1`
    FOREIGN KEY (`id_animal`)
    REFERENCES `refugio_patitas`.`animales` (`id_animal`),
  CONSTRAINT `adopciones_ibfk_2`
    FOREIGN KEY (`id_adoptante`)
    REFERENCES `refugio_patitas`.`adoptantes` (`id_adoptante`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refugio_patitas`.`veterinarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refugio_patitas`.`veterinarios` (
  `id_veterinario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `matricula` VARCHAR(20) NOT NULL,
  `telefono` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_veterinario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refugio_patitas`.`laboratorios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refugio_patitas`.`laboratorios` (
  `id_laboratorio` INT NOT NULL AUTO_INCREMENT,
  `nombre_laboratorio` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id_laboratorio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refugio_patitas`.`vacunas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refugio_patitas`.`vacunas` (
  `id_vacuna` INT NOT NULL AUTO_INCREMENT,
  `nombre_vacuna` VARCHAR(50) NOT NULL,
  `principio_activo` VARCHAR(100) NULL DEFAULT NULL,
  `lote` VARCHAR(50) NOT NULL,
  `id_laboratorio` INT NOT NULL,
  PRIMARY KEY (`id_vacuna`),
  INDEX `id_laboratorio` (`id_laboratorio` ASC) VISIBLE,
  CONSTRAINT `vacunas_ibfk_1`
    FOREIGN KEY (`id_laboratorio`)
    REFERENCES `refugio_patitas`.`laboratorios` (`id_laboratorio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `refugio_patitas`.`historia_clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `refugio_patitas`.`historia_clinica` (
  `id_historia` INT NOT NULL AUTO_INCREMENT,
  `id_animal` INT NOT NULL,
  `id_veterinario` INT NOT NULL,
  `id_vacuna` INT NULL DEFAULT NULL,
  `fecha_consulta` DATE NOT NULL,
  `observaciones` VARCHAR(500) NULL DEFAULT NULL,
  PRIMARY KEY (`id_historia`),
  INDEX `id_animal` (`id_animal` ASC) VISIBLE,
  INDEX `id_veterinario` (`id_veterinario` ASC) VISIBLE,
  INDEX `id_vacuna` (`id_vacuna` ASC) VISIBLE,
  CONSTRAINT `historia_clinica_ibfk_1`
    FOREIGN KEY (`id_animal`)
    REFERENCES `refugio_patitas`.`animales` (`id_animal`),
  CONSTRAINT `historia_clinica_ibfk_2`
    FOREIGN KEY (`id_veterinario`)
    REFERENCES `refugio_patitas`.`veterinarios` (`id_veterinario`),
  CONSTRAINT `historia_clinica_ibfk_3`
    FOREIGN KEY (`id_vacuna`)
    REFERENCES `refugio_patitas`.`vacunas` (`id_vacuna`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
