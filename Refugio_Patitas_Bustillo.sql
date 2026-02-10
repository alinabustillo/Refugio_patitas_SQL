DROP DATABASE IF EXISTS refugio_patitas;
CREATE DATABASE refugio_patitas;
USE refugio_patitas;

-- ---------------------------------------------------------
-- TABLAS INDEPENDIENTES
-- ---------------------------------------------------------

-- Tabla: RAZAS
-- Define que animal es y su raza.
CREATE TABLE RAZAS (
    id_raza INT AUTO_INCREMENT,
    nombre_raza VARCHAR(50) NOT NULL,
    tipo_animal VARCHAR(20) NOT NULL,
    PRIMARY KEY (id_raza)
);

-- Tabla: VETERINARIOS
-- Datos de los profesionales que atienden.
CREATE TABLE VETERINARIOS (
    id_veterinario INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    telefono VARCHAR(20),
    PRIMARY KEY (id_veterinario)
);

-- Tabla: LABORATORIOS
-- Laboratorio que fabrica las vacunas y teléfono por urgencias/reclamos.
CREATE TABLE LABORATORIOS (
    id_laboratorio INT AUTO_INCREMENT,
    nombre_laboratorio VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    PRIMARY KEY (id_laboratorio)
);

-- Tabla: ADOPTANTES
-- Datos de las personas que quieren adoptar.
CREATE TABLE ADOPTANTES (
    id_adoptante INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(15) NOT NULL,
    edad INT NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    email VARCHAR(100),
    PRIMARY KEY (id_adoptante)
);

-- ---------------------------------------------------------
-- TABLAS CON DEPENDENCIAS
-- ---------------------------------------------------------

-- Tabla: VACUNAS
-- Lista de vacunas. Se conecta con Laboratorio.
CREATE TABLE VACUNAS (
    id_vacuna INT AUTO_INCREMENT,
    nombre_vacuna VARCHAR(50) NOT NULL, -- Nombre comercial
    principio_activo VARCHAR(100),
    lote VARCHAR(50) NOT NULL,
    id_laboratorio INT NOT NULL,
    PRIMARY KEY (id_vacuna),
    FOREIGN KEY (id_laboratorio) REFERENCES LABORATORIOS(id_laboratorio)
);

-- Tabla: ANIMALES
-- Datos de las mascotas. Se conecta con RAZAS.
CREATE TABLE ANIMALES (
    id_animal INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    fecha_ingreso DATE NOT NULL,
    fecha_nacimiento DATE,   
    peso DECIMAL(5,2),
    castrado VARCHAR(2),
    estado VARCHAR(20) NOT NULL,  -- Ej: Disponible, Adoptado, En Tratamiento
    id_raza INT NOT NULL,
    PRIMARY KEY (id_animal),
    FOREIGN KEY (id_raza) REFERENCES RAZAS(id_raza)
);

-- ---------------------------------------------------------
-- TABLAS DE RELACIÓN
-- ---------------------------------------------------------

-- Tabla: ADOPCIONES
-- Registra cuando un Animal se va con un Adoptante.
CREATE TABLE ADOPCIONES (
    id_adopcion INT AUTO_INCREMENT,
    id_animal INT NOT NULL,
    id_adoptante INT NOT NULL,
    fecha_adopcion DATE NOT NULL,
    detalle VARCHAR(500),  -- Comentarios relevantes de la adopcion.
    PRIMARY KEY (id_adopcion),
    FOREIGN KEY (id_animal) REFERENCES ANIMALES(id_animal),
    FOREIGN KEY (id_adoptante) REFERENCES ADOPTANTES(id_adoptante)
);

-- Tabla: HISTORIA_CLINICA
-- Consultas generales y vacunas.
CREATE TABLE HISTORIA_CLINICA (
    id_historia INT AUTO_INCREMENT,
    id_animal INT NOT NULL,
    id_veterinario INT NOT NULL,
    id_vacuna INT,
    fecha_consulta DATE NOT NULL,
    observaciones VARCHAR(500),   -- Espacio para diagnóstico
    PRIMARY KEY (id_historia),
    FOREIGN KEY (id_animal) REFERENCES ANIMALES(id_animal),
    FOREIGN KEY (id_veterinario) REFERENCES VETERINARIOS(id_veterinario),
    FOREIGN KEY (id_vacuna) REFERENCES VACUNAS(id_vacuna)
);


