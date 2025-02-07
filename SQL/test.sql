CREATE DATABASE mi_base_de_datos;

USE mi_base_de_datos;

SHOW databases;

CREATE TABLE empleados ( #Creas la tabla con las columnas pertinentes y el tipo de variables que son
id INT primary key auto_increment, #Indicas el key element
nombre VARCHAR(50) NOT NULL, 
puesto VARCHAR(50), 
salario DECIMAL(7,2),
fecha_contratacion DATE
);

SHOW tables; # Enseña las tablas dentro de mi base de datos creada

describe empleados; # Muestra las columnas de mi tabla


INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion, departamento_id) VALUES 
('Oscar', 'Fullstack', 3000.50, '2025-01-26', 1);
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion, departamento_id) VALUES 
('Aitor Tilla', 'Frontend', 2800.50, '2025-01-26', 1);
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion, departamento_id) VALUES 
('Felipe', 'BAckend', 1500.50, '2025-01-26', 1);




SELECT * FROM empleados; # Muestra los elementos registrados en la base de datos

SELECT nombre,salario FROM empleados; # Muestra solo el nombre y el salario

SELECT * FROM empleados WHERE salario > 3000; # Aplica un filtro donde busca personas con un salario superior a 3000
SELECT nombre,salario FROM empleados WHERE puesto = 'Backend';
SELECT nombre,salario FROM empleados WHERE puesto = 'Fullstack' and salario > 3000;

SELECT * FROM empleados ORDER BY salario DESC; # Ordena la tabla por el salario de forma decendente, por defecto siempre es ascendente

SELECT * FROM empleados WHERE id = 1;

UPDATE empleados SET salario = 3100 WHERE id = 1; # Actualiza el salario de un empleado en concreto

DELETE FROM empleados WHERE id = 1; # Elimina un empleado en concreto 


CREATE TABLE departamento(
id INT auto_increment primary key, 
nombre VARCHAR(50)
);

SHOW tables;

INSERT INTO departamento (nombre) VALUE ('desarrollo');
INSERT INTO departamento (nombre) VALUE ('QA');

DROP TABLE empleados; # Borra la tabla entera

CREATE TABLE empleados ( 
id INT primary key auto_increment, 
nombre VARCHAR(50) NOT NULL, 
puesto VARCHAR(50), 
salario DECIMAL(7,2),
fecha_contratacion DATE,
departamento_id INT,
FOREIGN KEY (departamento_id) REFERENCES departamento(id) #Conectamos tablas
);

INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion, departamento_id) VALUES 
('Oscar', 'Fullstack', 3000.50, '2025-01-26', 1);
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion, departamento_id) VALUES 
('Aitor Tilla', 'Frontend', 2800.50, '2025-01-26', 2);
INSERT INTO empleados (nombre, puesto, salario, fecha_contratacion, departamento_id) VALUES 
('Felipe', 'BAckend', 1500.50, '2025-01-26', 1);

SELECT * FROM departamento;



