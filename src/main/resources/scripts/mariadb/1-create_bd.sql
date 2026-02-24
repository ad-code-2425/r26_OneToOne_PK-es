CREATE DATABASE IF NOT EXISTS instituto_121_PKiguales;

-- Switch to the 'instituto_121_PKiguales' database
USE instituto_121_PKiguales;

-- Create 'profesor' table if it does not exist
CREATE TABLE IF NOT EXISTS profesor (
   Id INT AUTO_INCREMENT NOT NULL,
   nombre VARCHAR(255) NOT NULL,
   ape1 VARCHAR(255) NOT NULL,
   ape2 VARCHAR(255) NOT NULL,
   tipoFuncionario VARCHAR(100) DEFAULT NULL,
   PRIMARY KEY (Id)
);


CREATE TABLE contactInfo (
    profesorId INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    tlf_movil VARCHAR(15),
    PRIMARY KEY (profesorId),
    CONSTRAINT fk_contact_profesor
        FOREIGN KEY (profesorId)
        REFERENCES profesor(Id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Switch to the 'instituto_121_PKiguales' database
USE instituto_121_PKiguales;

-- Insert data into 'profesor' table if it is empty
INSERT INTO profesor (nombre, ape1, ape2, tipoFuncionario)
SELECT nombre, ape1, ape2, tipoFuncionario
FROM (
    SELECT 'Juan' AS nombre, 'Perez' AS ape1, 'García' AS ape2, NULL AS tipoFuncionario UNION ALL
    SELECT 'Carlos', 'González', 'Oltra', NULL UNION ALL
    SELECT 'Sergio', 'Mateo', 'Ramis', NULL UNION ALL
    SELECT 'Paco', 'Moreno', 'Díaz', NULL UNION ALL
    SELECT 'Ana', 'Morales', 'Ortega', NULL UNION ALL
    SELECT 'Marcos', 'Tortosa', 'Martínez', NULL UNION ALL
    SELECT 'Sara', 'Barrrera', 'Salas', NULL UNION ALL
    SELECT 'Raquel', 'Peqrez', 'Izquierdo', NULL UNION ALL
    SELECT 'Rosa', 'Díaz', 'Del Toro', NULL UNION ALL
    SELECT 'Laura', 'Vivó', 'López', NULL UNION ALL
    SELECT 'Emilio', 'Perez', 'García', NULL UNION ALL
    SELECT 'Alfredo', 'González', 'Oltra', NULL UNION ALL
    SELECT 'Eduardo', 'Grau', 'Aroca', NULL UNION ALL
    SELECT 'Pau', 'Ayala', 'Fuentes', NULL UNION ALL
    SELECT 'Gabriel', 'Sáez', 'Izquierdo', NULL UNION ALL
    SELECT 'Javier', 'Ramírez', 'Olmo', NULL UNION ALL
    SELECT 'Elias', 'Rubio', 'Sánchez', '0' UNION ALL
    SELECT 'Juan Manuel', 'Campos', 'Alierta', '1' UNION ALL
    SELECT 'Anabel', 'Marco', 'Izquierdo', '2' UNION ALL
    SELECT 'Ricardo', 'Acosta', 'Soler', '0' UNION ALL
    SELECT 'Laura', 'Vallés', 'Muñoz', '1' UNION ALL
    SELECT 'Elisa', 'Amador', 'Serra', '2'
) AS temp
WHERE NOT EXISTS (SELECT 1 FROM profesor);

-- Insert data into 'contactInfo' table if it is empty
INSERT INTO contactInfo (profesorId, email, tlf_movil)
SELECT p.Id,
       CONCAT(
           LOWER(REPLACE(p.nombre, ' ', '')), '.',
           LOWER(REPLACE(p.ape1, ' ', '')),
           '@instituto.com'
       ) AS email,
       CONCAT('600', LPAD(p.Id, 6, '0')) AS tlf_movil
FROM profesor p
WHERE NOT EXISTS (SELECT 1 FROM contactInfo);