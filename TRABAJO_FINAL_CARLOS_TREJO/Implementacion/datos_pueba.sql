
insert into especialidades (especialidad, descripcion, estado) values
('cardiología','tratamiento del sistema cardiovascular','activa'),
('pediatría','atención de niños y adolescentes','activa'),
('neurología','trastornos del sistema nervioso','activa'),
('dermatología','enfermedades de la piel','inactiva');

insert into doctores (nombre, apellido, telefono, cedula, email, activo, especialidad_id, fecha_ingreso) values
('ana','salazar','04121234567','v-12345678','ana.salazar@hospital.com',true,1,'2020-05-10'),
('luis','contreras','04121234568','v-23456789','luis.contreras@hospital.com',true,2,'2019-03-15'),
('maría','rodríguez','04121234569','v-34567890','maria.rodriguez@hospital.com',true,3,'2021-07-01'),
('carlos','pérez','04121234570','v-45678901','carlos.perez@hospital.com',false,4,'2018-11-20');

insert into pacientes (cedula, nombre, apellido, genero, fecha_nacimiento, email, telefono, direccion, estado) values
('v-11111111','jose','gonzález','m','1985-02-14','jose.gonzalez@mail.com','04141234567','av. principal #123','activo'),
('v-22222222','marta','fernández','f','1990-06-30','marta.fernandez@mail.com','04141234568','calle los cedros','activo'),
('v-33333333','pedro','ramírez','m','1975-09-20','pedro.ramirez@mail.com','04141234569','urb. el centro','inactivo'),
('v-44444444','lucía','torres','f','2000-01-05','lucia.torres@mail.com','04141234570','sector la esperanza','activo');

insert into habitaciones (codigo_habitacion, tipo, piso, estado) values
('h101','individual',1,'operativa'),
('h102','doble',1,'operativa'),
('h201','multiple',2,'mantenimiento');

insert into camas (habitacion_id, numero, tipo, estado) values
(1,'1','estándar','disponible'),
(1,'2','estándar','ocupada'),
(2,'1','uci','disponible'),
(2,'2','uci','reservada'),
(3,'1','intermedia','mantenimiento');

insert into citas (paciente_id, doctor_id, fecha_hora, estado, motivo, habitacion_id, cama_id) values
(1,1,'2025-12-10 09:00:00','programada','control de hipertensión',1,1),
(2,2,'2025-12-11 10:30:00','confirmada','consulta pediátrica',2,3),
(3,3,'2025-12-12 14:00:00','cancelada','evaluación neurológica',null,null),
(4,1,'2025-12-13 08:00:00','programada','chequeo general',1,2);

insert into diagnosticos (cita_id, codigo_cie10, descripcion, gravedad) values
(1,'i10','hipertensión esencial','moderada'),
(2,'j45','asma infantil','leve'),
(4,'e11','diabetes mellitus tipo 2','grave');

insert into tratamientos (diagnostico_id, descripcion, fecha_inicio, fecha_fin, estado) values
(1,'tratamiento con antihipertensivos y dieta baja en sal','2025-12-10',null,'activo'),
(2,'uso de inhaladores y control ambiental','2025-12-11',null,'activo'),
(3,'insulina y control glucémico','2025-12-13',null,'activo');

insert into medicamentos (nombre, presentacion, unidad, stock_actual, stock_minimo, precio, activo) values
('enalapril','tabletas','mg',100,20,5.50,true),
('salbutamol','inhalador','ml',50,10,12.00,true),
('insulina','ampollas','ml',200,50,25.00,true),
('paracetamol','tabletas','mg',500,100,2.00,true);

insert into tratamiento_medicamento (tratamiento_id, medicamento_id, dosis, frecuencia, duracion_dias) values
(1,1,10,'cada 12h',30),
(2,2,2,'cada 8h',15),
(3,3,20,'cada 24h',60);


insert into medicamentos (nombre, presentacion, unidad, stock_actual, stock_minimo, precio, activo) values
('omeprazol','capsulas','mg',5,20,8.00,true),
('amoxicilina','tabletas','mg',2,15,3.50,true),
('ibuprofeno','tabletas','mg',0,10,4.00,true);

insert into citas (paciente_id, doctor_id, fecha_hora, estado, motivo, habitacion_id, cama_id) values
(1,1,'2025-12-02 09:00:00','programada','control de presión',1,1),
(1,1,'2025-12-15 09:00:00','confirmada','seguimiento hipertensión',1,1),
(1,1,'2025-12-20 09:00:00','programada','ajuste de tratamiento',1,1),
(1,1,'2025-12-25 09:00:00','programada','chequeo general',1,1);

