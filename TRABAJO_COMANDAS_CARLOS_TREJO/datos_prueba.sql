INSERT INTO Mesas (numero, capacidad) VALUES
(1, 4),
(2, 2),
(3, 6),
(4, 8);

INSERT INTO Categorias (nombre, descripcion) VALUES
('Comida', 'Platos principales'),
('Bebida', 'Refrescos y cervezas'),
('Postre', 'Dulces y tortas');

INSERT INTO Clientes (nombre, cedula, telefono, correo) VALUES
('Maria Alejandra', 'V-30265984', '04141234567', 'mariaale@gmail.com'),
('Alejandro Fernandez', 'V-29998652', '04141234568', 'Alefer29@gmail.com'),
('Luis Rodríguez', 'V-34567890', '04141234569', 'luis.rodriguez@mail.com');

INSERT INTO Empleados (nombre, puesto) VALUES
('Barbara Toro', 'Mesero'),
('Carlos Trejo', 'Cajero'),
('Lucía Ferrera', 'Administrador');

INSERT INTO Productos (nombre, precio, id_categoria VALUES
('Pizza Margarita', 6.50, '1'),
('Hamburguesa Clásica', 4.00, '1'),
('Refresco Cola', 1.50, '2'),
('Cerveza Artesanal', 2.00, '2'),
('Torta de Chocolate', 3.00, '3);


INSERT INTO Comandas (id_mesa, id_cliente, id_empleado, estado) VALUES
(1, 1, 1, 'Pendiente'),
(2, 2, 2, 'Servida'),
(3, 3, 1, 'Pagada');

INSERT INTO DetalleComanda (id_comanda, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 2, 8.50), 
(1, 3, 2, 1.50),   
(2, 2, 1, 6.00),  
(2, 4, 2, 3.00), 
(3, 5, 1, 4.00);   

INSERT INTO Pagos (id_comanda, metodo, monto) VALUES
(1, 'Efectivo', 25.00),
(2, 'Tarjeta', 12.00),
(3, 'Transferencia', 18.50);

INSERT INTO Reservas (id_mesa, id_cliente, fecha, estado) VALUES
(1, 1, '2025-12-20 19:00:00', 'Activa'),
(2, 2, '2025-12-21 20:00:00', 'Cancelada'),
(3, 3, '2025-12-22 18:30:00', 'Cumplida');

INSERT INTO Inventario (id_producto, stock_actual, stock_minimo) VALUES
(1, 20, 5),  
(2, 15, 5),   
(3, 50, 10), 
(4, 30, 10),  
(5, 10, 3);  

