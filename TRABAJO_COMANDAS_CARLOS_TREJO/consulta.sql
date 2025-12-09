SELECT c.id_comanda, cl.nombre AS cliente, m.numero AS mesa, e.nombre AS empleado, c.estado, c.fecha
FROM Comandas c
JOIN Clientes cl ON c.id_cliente = cl.id_cliente
JOIN Mesas m ON c.id_mesa = m.id_mesa
JOIN Empleados e ON c.id_empleado = e.id_empleado
ORDER BY c.fecha;

SELECT c.id_comanda, p.nombre AS producto, dc.cantidad, dc.precio_unitario,
       (dc.cantidad * dc.precio_unitario) AS subtotal
FROM DetalleComanda dc
JOIN Comandas c ON dc.id_comanda = c.id_comanda
JOIN Productos p ON dc.id_producto = p.id_producto
WHERE c.id_comanda = 1;

SELECT cl.nombre, SUM(dc.cantidad * dc.precio_unitario) AS total_gastado
FROM Clientes cl
JOIN Comandas c ON cl.id_cliente = c.id_cliente
JOIN DetalleComanda dc ON c.id_comanda = dc.id_comanda
GROUP BY cl.nombre
ORDER BY total_gastado DESC;

SELECT p.nombre, SUM(dc.cantidad) AS total_vendidos
FROM Productos p
JOIN DetalleComanda dc ON p.id_producto = dc.id_producto
GROUP BY p.nombre
ORDER BY total_vendidos DESC;

SELECT c.id_comanda, cl.nombre AS cliente, m.numero AS mesa, c.fecha
FROM Comandas c
JOIN Clientes cl ON c.id_cliente = cl.id_cliente
JOIN Mesas m ON c.id_mesa = m.id_mesa
WHERE c.estado = 'Pendiente';

SELECT metodo, SUM(monto) AS total_ingresos
FROM Pagos
GROUP BY metodo;
