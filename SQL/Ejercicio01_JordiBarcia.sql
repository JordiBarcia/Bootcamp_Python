create database oficina;
use oficina;

create table empleados(
empleado_id INT primary key auto_increment,
fecha_asitencia date, 
estado_asistencia enum('Presente', 'Ausente', 'Vacaciones', 'Enfermedad'),
hora_entrada time,
hora_salida time, 
trabajo_remoto boolean,
comentarios text,
documento_adjunto blob,
modo_transporte enum('Coche','Transporte public','Bicicleta', 'A pie'),
tareas_completadas set('Emails', 'Reuniones', 'Desarrollo', 'Diseño')
);

