create database tienda;
use tienda;

create table productos(
id smallint primary key auto_increment,
nombre varchar(50) NOT NULL,
descripcion varchar(100),
price decimal(5,2),
stock integer NOT NULL
);

alter table productos
add column isAvailable bool;

alter table productos
modify column isAvailable varchar(50);

alter table productos
drop isAvailable;

describe productos;

truncate table productos;

select * from productos;

INSERT INTO productos (nombre, descripcion, price, stock)
VALUES 
('Laptop', 'Laptop de 14 pulgadas, Intel i5', 799.99, 25),
('Smartphone', 'Smartphone Android con pantalla de 6.5 pulgadas', 399.99, 50),
('Teclado Mecánico', 'Teclado con interruptores mecánicos y retroiluminación', 89.99, 40),
('Monitor', 'Monitor Full HD de 24 pulgadas', 149.99, 30),
('Auriculares', 'Auriculares Bluetooth con cancelación de ruido', 59.99, 60);

update productos 
	set price = 699.99 
		where id = 1;

delete from productos 
	where id = 2;

select * from productos;

select nombre, price 
	from productos;