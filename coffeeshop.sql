--1.Selecciona todos los clientes que han realizado pedidos.
USE coffeeshop;
SELECT DISTINCT c.*
FROM cliente c
JOIN pedido p ON c.id_cliente = p.id_cliente;
--2. Selecciona todos los pedidos que han sido realizados entre dos fechas
SELECT *
FROM pedido
WHERE fecha_registro BETWEEN '' AND '';

--3. Selecciona a todos los clientes y ordénalos según su fecha de nacimiento de forma descendente.
SELECT *
FROM cliente
ORDER BY nacimiento_cliente DESC;
--4. Selecciona los productos que se encuentran dentro de un pedido.
SELECT p.id_pedido, 
       pr.id_producto, 
       pr.nombre_producto, 
       dp.cantidad_producto, 
       dp.precio_producto
FROM pedido p
JOIN detalle_pedido dp ON p.id_pedido = dp.id_pedido
JOIN producto pr ON dp.id_producto = pr.id_producto;

--5. Selecciona el producto con el mayor precio.
SELECT id_producto, nombre_producto, precio_producto
FROM producto
WHERE precio_producto = (SELECT MAX(precio_producto) FROM producto);

--6. Selecciona el promedio de precios de los productos ingresados.
SELECT AVG(precio_producto) AS promedio_precios
FROM producto;

--7. Haz una consulta que te permita ver la información de cuantos pedidos se encuentran en estado: Pendiente, Finalizado, Entregado, Anulado
SELECT estado_pedido, COUNT(*) AS cantidad_pedidos
FROM pedido
GROUP BY estado_pedido;

--8. Seleccionaa todos los clientes que su nombre empiece por la letra D.
SELECT * FROM cliente WHERE nombre_cliente LIKE 'D%';

--9. Plantear una consulta donde se calculen la cantidad de órdenes agrupadas por cliente, filtradas por fechay se ordenen los registros de mayor a menor
SELECT cliente.nombre_cliente, cliente.apellido_cliente, COUNT(pedido.id_pedido) AS cantidad_ordenes
FROM cliente
JOIN pedido ON cliente.id_cliente = pedido.id_cliente
WHERE pedido.fecha_registro = '2024-02-06'
GROUP BY cliente.id_cliente
ORDER BY cantidad_ordenes DESC;


--10. Haz una consulta que muestre los 3 productos más vendidos.
SELECT
    p.id_producto,
    p.nombre_producto,
    SUM(dp.cantidad_producto) AS total_vendido
FROM
    detalle_pedido dp
JOIN
    producto p ON dp.id_producto = p.id_producto
GROUP BY
    p.id_producto, p.nombre_producto
ORDER BY
    total_vendido DESC
LIMIT 3;
--11. Haz una consulta que muestre al cliente que más pedidos ha realizado y cuantos pedidos ha realizado.
SELECT
    id_cliente,
    COUNT(*) AS total_pedidos
FROM
    pedido
GROUP BY
    id_cliente
ORDER BY
    total_pedidos DESC
LIMIT 1;


--12.Haz una consulta que muestre la información de la tabla, cliente, pedido, detalle pedido, producto. Utiliza lSELECT
    c.*,
    p.*,
    dp.*,
    pr.*
FROM
    cliente c
INNER JOIN
    pedido p ON c.id_cliente = p.id_cliente
INNER JOIN
    detalle_pedido dp ON p.id_pedido = dp.id_pedido
INNER JOIN
    producto pr ON dp.id_producto = pr.id_producto;a sentencia inner join.  
