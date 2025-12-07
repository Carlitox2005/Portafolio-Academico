create table especialidades(
id serial primary key,
especialidad varchar (60) not null,
descripcion text,
estado varchar (15) not null default 'activa',
fecha_creacion timestamptz not null default now(),
constraint check_especialidades_estado check (estado in ('activa','inactiva')),
constraint check_especialidades_nombre check (char_length(especialidad) >= 3),
constraint check_especialidades_desc check (descripcion is null or char_length(descripcion) >= 3)


);


create table doctores(
id_doctor serial primary key,
nombre varchar (120) not null,
apellido varchar  (120)not null,
telefono varchar (20) not null,
cedula varchar (20) not null unique,
email varchar (100),
activo BOOLEAN not null default TRUE,
especialidad_id integer references especialidades(id)on update cascade on delete restrict,
fecha_ingreso DATE not null default current_date,
fecha_creacion timestamptz not null default now(),
constraint chk_doctores_nombre check (char_length(nombre) >= 2),
constraint chk_doctores_apellido check (char_length(apellido) >= 2),
constraint chk_doctores_email check (email is null or position('@' in email) > 1)
);




create table pacientes (
id_paciente serial primary key,
cedula varchar(20) not null unique,
nombre varchar(80) not null,
apellido varchar(80) not null,
genero char(1), 
fecha_nacimiento date not null,
email varchar(100),
telefono varchar(20),
direccion text,
estado varchar(20) not null default 'activo',
fecha_registro date not null default current_date,
fecha_creacion timestamptz not null default now(),
constraint check_pacientes_genero check (genero in ('m','f')),
constraint check_pacientes_fnac check (fecha_nacimiento <= current_date),
constraint check_pacientes_email check (email is null or position('@' in email) > 1),
constraint check_pacientes_estado check (estado in ('activo','inactivo','fallecido'))
);

create table habitaciones (
id_habitacion serial primary key,
codigo_habitacion varchar(20) not null unique,
tipo varchar(20) not null,
piso integer not null,
estado varchar(20) not null default 'operativa',
fecha_creacion timestamptz not null default now(),
constraint check_habitaciones_tipo check (tipo in ('individual','doble','multiple')),
constraint check_habitaciones_piso check (piso >= 0 and piso <= 50),
constraint check_habitaciones_estado check (estado in ('operativa','mantenimiento','fuera_de_servicio'))
);

create table camas (
id_camas serial primary key,
habitacion_id integer references habitaciones(id_habitacion) on update cascade on delete cascade,
numero varchar(10) not null,
tipo varchar(20) not null default 'estándar',
estado varchar(20) not null default 'disponible',
ocupada_por_cita_id integer,
fecha_creacion timestamptz not null default now(),
constraint check_camas_tipo check (tipo in ('estándar','uci','intermedia')),
constraint check_camas_estado check (estado in ('disponible','ocupada','reservada','mantenimiento')),
constraint cama_unica unique (habitacion_id, numero)
);

create table citas (
id_citas serial primary key,
paciente_id integer references pacientes(id_paciente) on update cascade on delete restrict,
doctor_id integer references doctores(id_doctor) on update cascade on delete restrict,
fecha_hora timestamptz not null,
estado varchar(20) not null default 'programada',
motivo varchar(200) not null,
habitacion_id integer references habitaciones(id_habitacion) on update cascade on delete set null,
cama_id integer references camas(id_camas) on update cascade on delete set null,
fecha_creacion timestamptz not null default now(),
constraint check_citas_estado check (estado in ('programada','confirmada','cancelada','completada','no_asistio')),
constraint check_citas_motivo check (char_length(motivo) >= 3),
constraint check_citas_fecha check (fecha_hora > '2005-01-01'::timestamptz)
);


create table diagnosticos (
id_diagnostico serial primary key,
cita_id integer references citas(id_citas) on update cascade on delete cascade,
codigo_cie10 varchar(10) not null,
descripcion text not null,
gravedad varchar(20) not null,
creado_en timestamptz not null default now(),
constraint check_diagosticos_codigo check (char_length(codigo_cie10) >= 3),
constraint check_diagnosticos_gravedad check (gravedad in ('leve','moderada','grave','crítica')),
constraint check_diagnosticos_descripcion check (char_length(descripcion) >= 5)
);

create table tratamientos (
id_tratamiento serial primary key,
diagnostico_id integer references diagnosticos(id_diagnostico) on update cascade on delete cascade,
descripcion text not null,
fecha_inicio date not null,
fecha_fin date,
estado varchar(20) not null default 'activo',
constraint check_tratamientos_descripcion check (char_length(descripcion) >= 15),
constraint check_tratamientos_fechas check (fecha_fin is null or fecha_fin >= fecha_inicio),
constraint check_tratamientos_estado check (estado in ('activo','suspendido','finalizado'))
);

create table medicamentos (
id_medicamento serial primary key,
nombre varchar(120) not null unique,
presentacion varchar(50) not null,
unidad varchar(20) not null,
stock_actual integer not null default 0,
stock_minimo integer not null default 0,
precio numeric(12,2) not null default 0,
activo boolean not null default true,
created_at timestamptz not null default now(),
constraint chec_med_stock check (stock_actual >= 0 and stock_minimo >= 0),
constraint check_med_precio check (precio >= 0),
constraint check_med_unidad check (unidad in ('mg','ml','unidades'))
);

create table tratamiento_medicamento (
id serial primary key,
tratamiento_id integer references tratamientos(id_tratamiento) on update cascade on delete cascade,
medicamento_id integer references medicamentos(id_medicamento) on update cascade on delete restrict,
dosis numeric(10,2) not null,
frecuencia varchar(50) not null,
duracion_dias int not null,
constraint medicamento_unico unique (tratamiento_id, medicamento_id),
constraint check_tm_dosis check (dosis > 0),
constraint check_tm_duracion check (duracion_dias > 0 and duracion_dias <= 365),
constraint check_tm_frecuencia check (char_length(frecuencia) >= 3)
);
