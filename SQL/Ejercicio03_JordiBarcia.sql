create database tienda_ropa;
use tienda_ropa;

CREATe TABLE Prendas (
Id_Prenda INT NOT NULL AUTO_INCREMENT,
Descripcion VARCHAR(200),
Talla VARCHAR(4),
Precio DECIMAL(8,2),
PRIMARY KEY (id_Prenda)
);

CREATE TABLE Compras(
Id_Compra INT NOT NULL AUTO_INCREMENT,
Id_Cliente INT,
Id_Prenda INT,
Fecha_Compra DATE,
PRIMARY KEY (Id_Compra),
FOREIGN KEY (Id_Cliente) REFERENCES Clientes(Id_Cliente),
FOREIGN KEY (Id_Prenda) REFERENCES Prendas(Id_Prenda)
);

CREATE TABLE Clientes (
Id_Cliente INT NOT NULL AUTO_INCREMENT,
Nombre VARCHAR(100),
email VARCHAR(100),
Fecha_nac DATE,
PRIMARY KEY (Id_Cliente)
);

INSERT INTO Prendas (Descripcion, Talla, Precio) VALUES ('Camiseta Roja', 'M', 15.00);
INSERT INTO Prendas (Descripcion, Talla, Precio) VALUES ('Jeans Azules', 'L', 40.00);
INSERT INTO Prendas (Descripcion, Talla, Precio) VALUES ('Blusa Floral', 'S', 25.00);
INSERT INTO Prendas (Descripcion, Talla, Precio) VALUES ('Vestido Negro', 'M', 50.00);
INSERT INTO Prendas (Descripcion, Talla, Precio) VALUES ('Zapatos Deportivos', '42', 60.00);
INSERT INTO Prendas (Descripcion, Talla, Precio) VALUES ('Gorra Negra', 'U', 10.00);
INSERT INTO Prendas (Descripcion, Talla, Precio) VALUES ('Bufanda a Rayas', 'U', 12.00);
INSERT INTO Prendas (Descripcion, Talla, Precio) VALUES ('Pantalones de Vestir', 'M', 35.00);
INSERT INTO Prendas (Descripcion, Talla, Precio) VALUES ('Chaqueta de Cuero', 'L', 90.00);
INSERT INTO Prendas (Descripcion, Talla, Precio) VALUES ('Sudadera Gris', 'M', 30.00);
INSERT INTO Clientes (Nombre, email, Fecha_nac) VALUES ('Juan Pérez',
'juan.perez@email.com', '1990-05-10');
INSERT INTO Clientes (Nombre, email, Fecha_nac) VALUES ('Ana González',
'ana.gonzalez@email.com', '1985-04-15');
INSERT INTO Clientes (Nombre, email, Fecha_nac) VALUES ('Luis Torres',
'luis.torres@email.com', '1998-02-20');
INSERT INTO Clientes (Nombre, email, Fecha_nac) VALUES ('Marta Rodríguez',
'marta.rodriguez@email.com', '2000-06-30');
INSERT INTO Clientes (Nombre, email, Fecha_nac) VALUES ('David Ruiz',
'david.ruiz@email.com', '1975-10-15');
INSERT INTO Clientes (Nombre, email, Fecha_nac) VALUES ('Sara López',
'sara.lopez@email.com', '2002-12-12');
INSERT INTO Clientes (Nombre, email, Fecha_nac) VALUES ('Miguel Fernández',
'miguel.fernandez@email.com', '1989-03-01');
INSERT INTO Clientes (Nombre, email, Fecha_nac) VALUES ('Lucía Morales',
'lucia.morales@email.com', '1992-09-05');
INSERT INTO Clientes (Nombre, email, Fecha_nac) VALUES ('Daniel Ortega',
'daniel.ortega@email.com', '1982-01-25');
INSERT INTO Clientes (Nombre, email, Fecha_nac) VALUES ('María Castro',
'maria.castro@email.com', '2001-08-17');
INSERT INTO Compras (Id_Cliente, Id_Prenda, Fecha_Compra) VALUES (1, 1, '2023-10-10');
INSERT INTO Compras (Id_Cliente, Id_Prenda, Fecha_Compra) VALUES (2, 3, '2023-10-15');
INSERT INTO Compras (Id_Cliente, Id_Prenda, Fecha_Compra) VALUES (3, 2, '2023-10-20');
INSERT INTO Compras (Id_Cliente, Id_Prenda, Fecha_Compra) VALUES (4, 4, '2023-10-22');
INSERT INTO Compras (Id_Cliente, Id_Prenda, Fecha_Compra) VALUES (5, 5, '2023-10-25');
INSERT INTO Compras (Id_Cliente, Id_Prenda, Fecha_Compra) VALUES (6, 6, '2023-10-26');
INSERT INTO Compras (Id_Cliente, Id_Prenda, Fecha_Compra) VALUES (7, 7, '2023-10-27');
INSERT INTO Compras (Id_Cliente, Id_Prenda, Fecha_Compra) VALUES (8, 8, '2023-10-28');
INSERT INTO Compras (Id_Cliente, Id_Prenda, Fecha_Compra) VALUES (9, 9, '2023-10-29');
INSERT INTO Compras (Id_Cliente, Id_Prenda, Fecha_Compra) VALUES (10, 10, '2023-10-30');


select * from Clientes;
select * from Prendas;
select * from Compras;

## Consulta relacional
select CO.Id_Compra, CL.Nombre
from Compras as CO
JOIN Clientes AS CL
ON CO.Id_Cliente = CL.Id_Cliente
ORDER BY CO.Fecha_Compra DESC;

## Enunciado: Lista los nombres de todos los clientes.
select Nombre from Clientes;

## Enunciado: Encuentra todas las prendas que tengan un precio mayor a $30.
select * from prendas where Precio > 30;

## Enunciado: Muestra todas las compras que se hicieron en octubre de 2023.
select * from Compras where Fecha_Compra between '2023-01-01' and '2023-12-31'; 

## Enunciado:¿Cuál es el precio de la "Camiseta Roja"?
select Precio from Prendas where Descripcion = 'Camiseta Roja';

## Enunciado:Lista todas las prendas que sean de talla "M".
select * from Prendas where Talla = 'M';

## Enunciado:¿Cuántas prendas hay disponibles de cada talla?
select Talla, 
	count(*) as cantidad 
		from Prendas 
			group by Talla;
            
## Enunciado:¿Cuál es el precio promedio de las prendas disponibles?
select AVG(precio) as Precio_Promedio from Prendas;

## Enunciado: Lista los nombres de los clientes junto con las descripciones de las prendas que han
## comprado.

select cl.Nombre, pr.Descripcion
from Clientes as cl
join Prendas as pr
on cl.Id_Cliente = pr.Id_prenda;

## Enunciado:Lista los nombres de los clientes junto con las descripciones de las prendas que han
## comprado y las fechas en que se realizaron dichas compras.

select cl.Nombre, pr.Descripcion, co.Fecha_Compra
from Clientes as cl 
join Prendas as pr on cl.Id_cliente = pr.Id_Prenda 
join Compras as co on cl.Id_Cliente = co.Id_Compra;

## Enunciado: Encuentra al cliente que ha gastado el mayor monto en compras el día '2023-10-
## 15'. Deberás mostrar el nombre del cliente, la fecha y el monto total gastado.

SELECT 
    cl.Nombre, 
    co.Fecha_Compra, 
    SUM(pr.precio) AS total_gastado
FROM Clientes AS cl
JOIN Compras AS co ON cl.Id_Cliente = co.Id_Cliente
JOIN Prendas AS pr ON co.Id_Prenda = pr.Id_Prenda
WHERE co.Fecha_Compra = '2023-10-15'
GROUP BY cl.Nombre, co.Fecha_Compra
ORDER BY total_gastado DESC;
