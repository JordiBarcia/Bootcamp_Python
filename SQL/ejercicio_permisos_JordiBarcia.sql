DROP DATABASE IF EXISTS empresa_db;

create database empresa_db;

use empresa_db;

create table empleados(
id integer primary key,
nombre varchar(100),
salario decimal(10,2)
);

create user 'analista_datos'@'localhost' identified by 'contrasena123';
create user 'gerente'@'localhost' identified by 'contrasena123';
create user 'admin_rh'@'localhost' identified by 'contrasena123';

GRANT ALL PRIVILEGES ON empresa_db.* TO 'admin_rh'@'localhost';
GRANT SELECT, INSERT, UPDATE ON empresa_db.* TO 'analista_datos'@'localhost';
GRANT SELECT ON empresa_db.* TO 'gerente'@'localhost';

FLUSH PRIVILEGES;


