
CREATE TABLE Mesas (
    id_mesa SERIAL PRIMARY KEY,
    numero INTEGER UNIQUE NOT NULL,
    capacidad INTEGER NOT NULL
);


CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
	cedula VARCHAR (15)NOT NULL UNIQUE,
    telefono VARCHAR(20),
	correo VARCHAR (100)
	
);


CREATE TABLE Empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    puesto VARCHAR(50) CHECK (puesto IN ('Mesero','Cajero','Administrador'))
);


CREATE TABLE Categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT
);


CREATE TABLE Productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    id_categoria INT REFERENCES Categorias(id_categoria)
);



CREATE TABLE Comandas (
    id_comanda SERIAL PRIMARY KEY,
    id_mesa INTEGER REFERENCES Mesas(id_mesa) ON UPDATE CASCADE,
    id_cliente INTEGER REFERENCES Clientes(id_cliente) ON UPDATE CASCADE,
    id_empleado INTEGER REFERENCES Empleados(id_empleado) ON UPDATE CASCADE,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado VARCHAR(20) CHECK (estado IN ('Pendiente','Servida','Pagada'))
);


CREATE TABLE DetalleComanda (
    id_detalle SERIAL PRIMARY KEY,
    id_comanda INT REFERENCES Comandas(id_comanda) ON DELETE CASCADE,
    id_producto INT REFERENCES Productos(id_producto),
    cantidad INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) NOT NULL
);

CREATE TABLE Pagos (
    id_pago SERIAL PRIMARY KEY,
    id_comanda INT REFERENCES Comandas(id_comanda) ON DELETE CASCADE,
    metodo VARCHAR(20) CHECK (metodo IN ('Efectivo','Tarjeta','Transferencia')),
    monto NUMERIC(10,2) NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Reservas (
    id_reserva SERIAL PRIMARY KEY,
    id_mesa INT REFERENCES Mesas(id_mesa),
    id_cliente INT REFERENCES Clientes(id_cliente),
    fecha TIMESTAMP NOT NULL,
    estado VARCHAR(20) CHECK (estado IN ('Activa','Cancelada','Cumplida'))
);

CREATE TABLE Inventario (
    id_inventario SERIAL PRIMARY KEY,
    id_producto INT REFERENCES Productos(id_producto),
    stock_actual INT NOT NULL,
    stock_minimo INT NOT NULL
);

