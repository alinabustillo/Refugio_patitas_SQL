USE refugio_patitas;

-- 1. FUNCIONES

-- Función 1: Calcular la edad detallada (años o meses)
DROP FUNCTION IF EXISTS f_calcular_edad;
DELIMITER //
CREATE FUNCTION f_calcular_edad(fecha_nac DATE) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE anos INT;
    DECLARE meses INT;
    
    -- Calcular ambos valores
    SET anos = TIMESTAMPDIFF(YEAR, fecha_nac, CURRENT_DATE());
    SET meses = TIMESTAMPDIFF(MONTH, fecha_nac, CURRENT_DATE());
    
    -- Si tiene 1 año o más, se van a mostrar años. 
    -- Si tiene 0 años, se van a mostrar los meses.	
    IF anos > 0 THEN
        RETURN CONCAT(anos, ' años');
    ELSE
        RETURN CONCAT(meses, ' meses');
    END IF;
END //
DELIMITER ;

-- Función 2: Clasificar el tamaño del animal por su peso
DROP FUNCTION IF EXISTS f_tamano_animal;
DELIMITER //
CREATE FUNCTION f_tamano_animal(peso_animal DECIMAL(5,2)) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE tamano VARCHAR(20);
    
    IF peso_animal < 10.00 THEN
        SET tamano = 'Pequeño';
    ELSEIF peso_animal >= 10.00 AND peso_animal <= 20.00 THEN
        SET tamano = 'Mediano';
    ELSE
        SET tamano = 'Grande';
    END IF;
    
    RETURN tamano;
END //
DELIMITER ;

-- 2. VISTAS 

-- Vista 1: Animales disponibles para dar en adopcion 
CREATE OR REPLACE VIEW v_animales_disponibles AS
SELECT 
    an.nombre, 
    ra.tipo_animal AS tipo, 
    an.sexo,
    ra.nombre_raza AS raza,
    CONCAT(an.peso, ' kg') AS peso,
    f_tamano_animal(an.peso) AS tamano,
    f_calcular_edad(an.fecha_nacimiento) AS edad
FROM ANIMALES AS an
JOIN RAZAS AS ra ON an.id_raza = ra.id_raza
WHERE an.estado = 'Disponible';

-- Vista 2: Animales en Tratamiento
CREATE OR REPLACE VIEW v_animales_en_tratamiento AS
SELECT 
    an.nombre, 
    ra.tipo_animal AS tipo, 
    an.sexo,
    ra.nombre_raza AS raza,
    CONCAT(an.peso, ' kg') AS peso,
    f_calcular_edad(an.fecha_nacimiento) AS edad
FROM ANIMALES AS an
JOIN RAZAS AS ra ON an.id_raza = ra.id_raza
WHERE an.estado = 'En Tratamiento';

-- Vista 3: Historial de Adopciones
CREATE OR REPLACE VIEW v_historial_adopciones AS
SELECT 
    ad.fecha_adopcion,
    an.nombre AS mascota,
    ra.tipo_animal AS tipo,
    an.sexo,
    CONCAT(adp.nombre, ' ', adp.apellido) AS adoptante,
	adp.dni,
    adp.telefono,
    ad.detalle
FROM ADOPCIONES AS ad
JOIN ANIMALES AS an ON ad.id_animal = an.id_animal
JOIN RAZAS AS ra ON an.id_raza = ra.id_raza
JOIN ADOPTANTES AS adp ON ad.id_adoptante = adp.id_adoptante;

-- Vista 4: Control de Stock de Vacunas
CREATE OR REPLACE VIEW v_stock_vacunas AS
SELECT 
    v.nombre_vacuna AS vacuna,
    v.principio_activo,
    v.lote,
    v.stock,
    l.nombre_laboratorio AS laboratorio,
    l.telefono
FROM VACUNAS AS v
JOIN LABORATORIOS AS l ON v.id_laboratorio = l.id_laboratorio;

-- 3. PROCEDIMIENTOS 

-- Procedimiento 1: Registra una adopción nueva y actualiza el estado.
DROP PROCEDURE IF EXISTS sp_registrar_adopcion;
DELIMITER //
CREATE PROCEDURE sp_registrar_adopcion(
    IN p_id_animal INT, 
    IN p_id_adoptante INT, 
    IN p_detalle VARCHAR(500)
)
BEGIN
    INSERT INTO ADOPCIONES (id_animal, id_adoptante, fecha_adopcion, detalle)
    VALUES (p_id_animal, p_id_adoptante, CURRENT_DATE(), p_detalle);
    
    UPDATE ANIMALES 
    SET estado = 'Adoptado'
    WHERE id_animal = p_id_animal;
END //
DELIMITER ;

-- Procedimiento 2: Actualizacion del stock de vacunas ( se contempla el ingreso y egreso de stock)
DROP PROCEDURE IF EXISTS sp_actualizar_stock_vacunas;
DELIMITER //
CREATE PROCEDURE sp_actualizar_stock_vacunas(
    IN p_id_vacuna INT, 
    IN p_cantidad INT,
    IN p_tipo_movimiento VARCHAR(10) -- para poder diferenciar si se suma o resta del stock
)
BEGIN
    -- Ingreso de vacunas
    IF p_tipo_movimiento = 'INGRESO' THEN
        UPDATE VACUNAS 
        SET stock = stock + p_cantidad
        WHERE id_vacuna = p_id_vacuna;
        
    -- Egreso de vacunas
    ELSEIF p_tipo_movimiento = 'USO' THEN
        UPDATE VACUNAS 
        SET stock = stock - p_cantidad
        WHERE id_vacuna = p_id_vacuna;
    END IF;
END //
DELIMITER ;

-- 4. TRIGGERS 

-- Trigger 1: Validar edad del adoptante
DROP TRIGGER IF EXISTS tr_validar_edad_adoptante;
DELIMITER //
CREATE TRIGGER tr_validar_edad_adoptante
BEFORE INSERT ON ADOPTANTES
FOR EACH ROW
BEGIN
		IF TIMESTAMPDIFF(YEAR, NEW.fecha_nacimiento, CURRENT_DATE()) < 18 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'ERROR: El adoptante debe ser mayor de 18 años para registrarse en el refugio.';
    END IF;
END //
DELIMITER ;

-- Trigger 2: Estandarizar nombre del animal a mayuscula
DROP TRIGGER IF EXISTS tr_estandarizar_nombre_animal;
DELIMITER //
CREATE TRIGGER tr_estandarizar_nombre_animal
BEFORE INSERT ON ANIMALES
FOR EACH ROW
BEGIN
    SET NEW.nombre = UPPER(NEW.nombre);
END //
DELIMITER ;

-- Trigger 3: Auditoría de nuevos adoptantes , 
DROP TRIGGER IF EXISTS tr_auditoria_nuevos_adoptantes;
DELIMITER //
CREATE TRIGGER tr_auditoria_nuevos_adoptantes
AFTER INSERT ON ADOPTANTES
FOR EACH ROW
BEGIN
    INSERT INTO AUDITORIA_REGISTRO_ADOPTANTES (accion, dni_registrado, fecha_hora, usuario)
    VALUES ('Nuevo Adoptante Cargado', NEW.dni, NOW(), USER());
END //
DELIMITER ;

