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
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(150) NOT NULL,
    email VARCHAR(100),
    PRIMARY KEY (id_adoptante)
);

-- Tabla: TRIGGER, auditoria de los registros de nuevos adoptantes

CREATE TABLE AUDITORIA_REGISTRO_ADOPTANTES (
    id_auditoria INT AUTO_INCREMENT,
    accion VARCHAR(50) NOT NULL,
    dni_registrado VARCHAR(20) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    usuario VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_auditoria)
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
    stock INT NOT NULL,
    id_laboratorio INT NOT NULL,
    PRIMARY KEY (id_vacuna),
    FOREIGN KEY (id_laboratorio) REFERENCES LABORATORIOS(id_laboratorio)
);

-- Tabla: ANIMALES
-- Datos de las mascotas. Se conecta con RAZAS.
CREATE TABLE ANIMALES (
    id_animal INT AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    sexo VARCHAR(50) NOT NULL,
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

-- INSERCIÓN DE DATOS 
-- Método utilizado: Sentencias DML (INSERT INTO) 

USE refugio_patitas;

-- 1.RAZAS
INSERT INTO RAZAS (nombre_raza, tipo_animal) VALUES 
('Mestizo', 'Perro'),
('Siamés', 'Gato'),
('Labrador', 'Perro'),
('Mestizo', 'Gato'),
('Caniche', 'Perro'),
('Salchicha', 'Perro'),
('Galgo', 'Perro'),
('Persa', 'Gato'),
('Golden', 'Perro'),
('Bulldog', 'Perro'),
('Beagle', 'Perro'),
('Border Collie', 'Perro'),
('Pug', 'Perro'),
('Cocker', 'Perro');

-- 2.VETERINARIOS
INSERT INTO VETERINARIOS (nombre, apellido, matricula, telefono) VALUES 
('Rufina', 'Pereyra', 'MN-1234', '1156728970'),
('Hilario', 'Ferreira', 'MN-5678', '1155443678'),
('Francisca', 'Gomez', 'MN-2534', '1156867789'),
('Diego', 'Bustamante', 'MN-3741', '1124314450'),
('Jeronimo', 'Monserrat', 'MN-4955', '1135475269'),
('Facundo', 'Perez', 'MN-5961', '1143516770'),
('Tomas', 'Juncal', 'MN-5671', '1154267592'),
('Horacio', 'Romero', 'MN-3788', '1161748200'),
('Ines', 'Diaz', 'MN-3891', '1173819215'),
('Joaquin', 'Ruiz', 'MN-5910', '1148921022');

-- 3.LABORATORIOS
INSERT INTO LABORATORIOS (nombre_laboratorio, telefono) VALUES 
('Zoetis', '0800-121-2450'),
('MSD', '0800-333-4000'),
('Boehringer', '0800-555-6080'),
('Bagó', '0800-777-8000'),
('Bayer', '0800-133-5000'),
('Virbac', '0800-133-7000'),
('Pfizer', '0800-155-6700'),
('Tecnovax', '0800-450-7890'),
('Biolab', '0800-570-8901'),
('Elanco', '0800-650-9012');


-- 4.ADOPTANTES
INSERT INTO ADOPTANTES (nombre, apellido, dni, fecha_nacimiento, telefono, direccion, email) VALUES 
('Antonio', 'Ballester', '35065244', '1998-05-18', '1156984275', 'Av. Libertador 1286', 'antonioballester@gmail.com'),
('Justina', 'Miraflores', '28934729', '1981-10-03', '1149506377', 'Aguero 1625', 'justimiraflores@gmail.com'),
('Jaime', 'Portillo', '38735739', '1991-03-10', '1179519374', 'Billinghurst 1724', 'jaimeporti@gmail.com'),
('Francisca', 'Barrionuevo', '36072642', '1985-07-25', '1124506925', 'Juncal 1821', 'franbarrion@gmail.com'),
('Martin', 'Suarez', '31070191', '1988-11-05', '1152934450', 'Av.Callao 5124', 'martin.s@gmail.com'),
('Lucia', 'Fernandez', '32701227', '1993-02-14', '1135845596', 'AV.Santa Fe 1476', 'luciafernandez@gmail.com'),
('Pedro', 'Gonzalez', '23702375', '1983-09-30', '1144556677', 'Cordoba 789', 'pedrogonzalez@hotmail.com'),
('Maria', 'Rooselt', '39065474', '1995-12-01', '1155632788', 'Montevideo 1739', 'maria.rooselt@gmail.com'),
('Justino', 'Alvarez', '24040759', '1978-06-18', '1165378890', 'Guemes 5189', 'justino.a@gmail.com'),
('Ana', 'Grimoldi', '36051369', '1990-08-22', '1157884912', 'Thames 2325', 'ana.grimoldi@gmail.com');

-- 5.VACUNAS
INSERT INTO VACUNAS (nombre_vacuna, principio_activo, lote, stock, id_laboratorio) VALUES 
('Antirrábica', 'Virus inactivado', 'LOTE-A01', 50, 1),
('Quíntuple', 'Parvovirus y otros', 'LOTE-Q99', 30, 2),
('Séxtuple', 'Adenovirus', 'LOTE-S01', 20, 3),
('Triple Felina', 'Herpesvirus', 'LOTE-TF2', 40, 4),
('Leucemia Felina', 'Virus Leucemia', 'LOTE-LF3', 15, 5),
('Tos de las perreras', 'Bordetella', 'LOTE-TP4', 25, 6),
('Moquillo Canino', 'Virus Distemper', 'LOTE-M05', 10, 7),
('Coronavirus Canino', 'Coronavirus', 'LOTE-C06', 35, 8),
('Antitetánica', 'Toxoide tetánico', 'LOTE-AT7', 5, 9),
('Triple Canina', 'Moquillo y otros', 'LOTE-TC8', 50, 10);

-- 6.ANIMALES
INSERT INTO ANIMALES (nombre, sexo, fecha_ingreso, fecha_nacimiento, peso, castrado, estado, id_raza) VALUES 
('Nala','Hembra','2024-01-10','2022-05-10',15.50,'SI','Disponible',1),
('Milo','Macho','2024-02-05','2023-10-05', 4.45,'NO','Disponible',2),
('Toro','Macho','2024-03-01','2019-03-01', 25.00,'SI','En Tratamiento',3),
('Cleo','Hembra','2024-03-15','2023-01-15',3.85,'SI','Adoptado',4),
('Zuma','Hembra','2025-02-10','2020-02-10',5.00,'NO','Disponible',4),
('Roco','Macho','2025-06-07','2023-06-07',28.00,'NO','En Tratamiento',3),
('Zeus','Macho','2025-06-20','2024-06-20',16.00,'SI','Adoptado',1),
('Rumba','Hembra','2025-08-21','2025-05-21',4.00,'NO','Adoptado',1),
('Filipa','Hembra','2025-09-07','2025-03-07',5.00,'SI','Adoptado',4),
('Milanesa','Hembra','2025-10-10','2021-10-10',26.00,'SI','Disponible',3), 
('Lola', 'Hembra', '2023-01-01', '2022-01-01', 6.50, 'SI', 'Adoptado', 5),  
('Simba', 'Macho', '2023-02-01', '2022-02-01', 7.00, 'SI', 'Adoptado', 6), 
('Berta', 'Hembra', '2023-03-01', '2022-03-01', 22.50, 'SI', 'Adoptado', 7),
('Mota', 'Macho', '2023-04-01', '2022-04-01', 4.50, 'SI', 'Adoptado', 8), 
('Mia', 'Hembra', '2023-05-01', '2022-05-01', 21.00, 'SI', 'Adoptado', 9),  
('Rocky', 'Macho', '2023-06-01', '2022-06-01', 22.00, 'SI', 'Adoptado', 10);

-- 7.ADOPCIONES
INSERT INTO ADOPCIONES (id_animal, id_adoptante, fecha_adopcion, detalle) VALUES 
(4, 1, '2024-08-20','Se entregó con libreta sanitaria al día. Viven dos personas, madre e hijo en un departamento. Se verificó balcón con red. Gata tímida, se indicó paciencia los primeros días.'),
(7, 2, '2025-10-15','Se entregó con libreta sanitaria al día. Viven 3 personas, una pareja y su hija adolescente en un departamento. Perro con mucha energía, tira de la correa.'),
(8, 3, '2025-12-10','Se entregó con libreta sanitaria al día. Vive una pareja sin hijos en una casa. Firma compromiso de castración obligatoria para el mes de marzo. Queda agendado turno veterinario para seguimiento.'),
(9, 4, '2025-12-23','Se entregó con libreta sanitaria al día. Vive una sola persona y es un departamento. Se realiza periodo de prueba de 15 días por adaptación. Come alimento ProPlan.'),
(11, 5, '2023-02-15','Se entregó con libreta sanitaria al día. Departamento, balcón con red protectora. Adaptación exitosa.'),
(12, 6, '2023-03-15','Se entregó con libreta sanitaria al día. Casa con patio cerrado. Convive con otro perro sin problemas.'),
(13, 7, '2023-04-15','Se entregó con libreta sanitaria al día. Familia con niños, perra muy dócil y juguetona.'),
(14, 8, '2023-05-15','Se entregó con libreta sanitaria al día. Pareja joven, responsable. Ideal para este gato, muy tranquilo.'), 
(15, 9, '2023-06-15','Se entregó con libreta sanitaria al día. Se lleva bien con otros gatos. Se indicó alimento especial para raza grande.'),
(16, 10, '2023-07-15','Se entregó con libreta sanitaria al día. Casa amplia, necesita ejercicio diario por su energía.');

-- 8.HISTORIA_CLINICA
INSERT INTO HISTORIA_CLINICA (id_animal, id_veterinario, id_vacuna, fecha_consulta, observaciones) VALUES 
(1, 1, 1,'2024-01-15', 'Nala: Control general y vacunación anual. Peso estable.'),
(2, 1, 1,'2024-02-10', 'Milo: Cachorro sano. Se aplica Antirrábica. Sin reacciones.'),
(3, 2, 2,'2024-03-02', 'Toro: Bajo peso y parásitos.'),
(4, 1, 1,'2024-03-16', 'Cleo: Control previo a adopción. Vacuna al día. Muy tranquila.'),
(5, 2, 4,'2025-02-11', 'Zuma: Chequeo de rutina. Se aplica Triple Felina.'),
(6, 2, NULL, '2025-06-08', 'Roco: Consulta por renguera pata trasera. Reposo y control en 7 días.'),
(7, 1, 2,'2025-06-21', 'Zeus: Control de ingreso. Se aplica Quíntuple.'),
(8, 2, NULL, '2025-08-22', 'Rumba: Se desparasita, vacuna pendiente por edad.'),
(9, 1, 1,'2025-09-10', 'Filipa: Control post-castración. Herida sanando perfecto. Antirrábica ok.'),
(10, 2, 2,'2025-10-12', 'Milanesa: Control general. Se aplica Quíntuple.'),
(11, 3, 3, '2023-01-10', 'Luna: Control de ingreso y Séxtuple. Todo en orden.'),
(12, 4, 2, '2023-02-10', 'Simba: Control de ingreso y Quíntuple. Buen estado.'), 
(13, 5, 1, '2023-03-10', 'Berta: Chequeo general y vacuna Antirrábica. Dientes con sarro.'),
(14, 6, 5, '2023-04-10', 'Mota: Control y vacuna Leucemia Felina. Gato muy tranquilo.'),
(15, 7, 7, '2023-05-10', 'Mia: Desparasitación y vacuna Moquillo Canino. Peso ideal.'),
(16, 8, 8, '2023-06-10', 'Rocky: Vacunación Coronavirus Canino. Piel y pelaje sanos.');


