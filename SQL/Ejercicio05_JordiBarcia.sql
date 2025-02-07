DROP DATABASE IF EXISTS ejercicio_4;

CREATE DATABASE ejercicio_4;

USE ejercicio_4;

create table Localidad(
cod_prov varchar(50) primary key NOT NULL,
nombre varchar(50) NOT NULL
);

create table pub(
cod_pub varchar(50) primary key NOT NULL,
nombre varchar(50) NOT NULL,
licencia varchar(50) NOT NULL,
domicilio varchar(100),
f_apertura date NOT NULL,
horario enum ('HOR1', 'HOR2', 'HOR3') NOT NULL,
cod_prov varchar(50) NOT NULL,
foreign key (cod_prov) references Localidad(cod_prov)
);

create table titular(
dni_titular varchar(50) primary key NOT NULL,
nombre varchar(50) NOT NULL,
domicilio varchar(100),
cod_pub varchar(50) NOT NULL,
foreign key (cod_pub) references pub(cod_pub)
);

create table empleado(
dni_empleado varchar(50) primary key NOT NULL,
nombre varchar(50) NOT NULL,
domicilio varchar(50)
);

create table stock(
cod_prod varchar(50) primary key NOT NULL,
nombre varchar(50) NOT NULL,
cantidad integer check(cantidad <= 0) NULL, 
precio integer check(precio <= 0) NOT NULL,
cod_pub varchar(50) NOT NULL,
foreign key (cod_pub) references pub(cod_pub)
);

create table pub_empleado(
cod_pub varchar(50),
dni_empleado varchar(50),
cargo enum ('CAMARERO','SEGURIDAD','LIMPIEZA'),
primary key (cod_pub, dni_empleado, cargo),
foreign key (cod_pub) references pub(cod_pub),
foreign key (dni_empleado) references empleado(dni_empleado)
);


# Datos de la LOCALIDAD
  insert into localidad values (15002, 'La Coruña');
  insert into localidad values (15165, 'Bergondo');
  insert into localidad values (15160, 'Sada');
  insert into localidad values (15170, 'Betanzos');
  insert into localidad values (15001, 'Ayuntamiento Coruña');
  insert into localidad values (15004, 'Centro Coruña');  
  
  # Datos del PUB
insert into pub values('01','Borges','Homologada1', 'Polvorin','2020-05-15', 'HOR1', '15002');
insert into pub values('02','Agua Mineral','Comprada', 'Orzan','1985-05-15', 'HOR1', '15001'); 
insert into pub values('03','Grietas','Robada', 'Matogrande','2002-02-10', 'HOR2', '15004'); 
insert into pub values('04','OH Coruña','Homologada', 'Orillamar','2020-05-15','HOR1', '15002');  
insert into pub values('05','Borges','Homologada1', 'Polvorin','2020-05-15', 'HOR1', '15002');
#insert into pub values('06','Nueces','No  Homologada', 'Vereda','2010-05-15', 'HOR4', '15002');
  
 # Datos del TITULAR
insert into titular values ('1234567X', 'Manolo','Orillamar','01');
insert into titular values ('2345678c', 'Pepe','Riobao', '02');
insert into titular values ('5649872x', 'Tomas','Cacharrete', '02');
insert into titular values ('7654321X','Antonio','Mandin','01');
 
 # Datos EMPLEADO
insert into empleado values ('1234567X', 'Manuel','Orillamar');
insert into empleado values ('4534567X', 'Lucas','Orzan');
insert into empleado values ('1234886X', 'Luis','Monte Alto');

# DATOS EMPLEADOS DEL PUB
insert into pub_empleado values('01','1234567X','CAMARERO');
insert into pub_empleado values('03','1234567X','SEGURIDAD');
insert into pub_empleado values('04','4534567X','CAMARERO');
#insert into pub_empleado values('05','46345678X','tocada de huevos');
