-- DML

-- cliente

update cliente SET direccion = 'Corrientes 1200' WHERE id_cliente = 5;
update cliente SET direccion = 'AV. Belgrano, 470', telefono = '213232343' WHERE id_cliente = 8;


-- empleado

update empleado SET telefono = '42131032' WHERE id_empleado = 4;
update empleado SET telefono = '40302032', correo = 'Sofia.G@gmail.com' WHERE id_empleado = 1;


-- inmueble

update inmueble SET precio = 400000 WHERE id_inmueble = 1;
update inmueble SET precio = 300000, lavadero = 0 WHERE id_inmueble = 3;


-- contrato

update contrato SET descripcion = 'Contrato de Venta de monoambiente en recoleta' WHERE id_contrato = 14;
update contrato SET descripcion = 'Contrato de Alquiler de departamento 3 ambientes en Caballito', tipo_contrato = '2' WHERE id_contrato = 15;


-- alquiler

update alquiler SET monto_total = '5000' WHERE id_alquiler = 11;
update alquiler SET monto_total = '9500', fecha = '2024-08-15' WHERE id_alquiler = 13;


-- venta

update venta SET fecha = '2024-05-15' WHERE id_venta = 1;
update venta SET monto_total = '200000', fecha = '2024-05-23' WHERE id_venta = 4;


-- garante

update garante SET correo = 'sofiaGonzalez2024@gmail.com' WHERE id_garante = 1;
update garante SET correo = 'anamartinez@gmail.com', telefono = '434567223' WHERE id_garante = 3;


-- Indices
CREATE INDEX idx_nombre_barrio ON barrio (nombre_barrio);
CREATE INDEX idx_dni_empleado ON empleado (dni);


-- Cantidad de clientes totales
select count(*)  cantidad_clientes from cliente;


-- Filtrar las ventas realizadas por agentes
select e.*, t.tipo, v.id_venta 
from empleado as e 
inner join tipo_empleado as t on e.tipo_empleado = t.id_tipo_empleado 
inner join venta as v on v.fk_empleado = e.id_empleado 
where t.tipo = 'Agente';


-- Cantidad de inmuebles vendidos en los distintos barrios
select count(v.id_venta) ventas, b.nombre_barrio 
from venta as v 
inner join inmueble as i on v.fk_inmueble = i.id_inmueble 
inner join barrio as b on i.id_barrio = b.id_barrio 
group by nombre_barrio 
order by ventas desc;


-- Cantidad de alquileres realizados desde enero de 2023 hasta julio de 2023
select count(id_alquiler) Cantidad_de_alquileres 
from alquiler 
where year(fecha) = 2023 and month(fecha) between 1 and 7;


-- Promedio del monto total de ventas realizado a partir de agosto de 2023
select avg(monto_total) as Promedio_Venta 
from venta 
where year(fecha) = 2023 and month(fecha) between 8 and 12;


-- Promedio de los precios de alquiler
select avg(monto_total) as promedio_alquileres 
from alquiler;


-- Promedio del monto total de ventas para cada año
select year(fecha) as Año, avg(monto_total) as Promedio_Venta_Anual 
from venta 
group by year(fecha);


-- Promedio de antigüedad de los inmuebles por tipo de inmueble
select tipo_inmueble, avg(anios_antiguedad) as Promedio_Antiguedad 
from inmueble 
where tipo_inmueble is not null 
group by tipo_inmueble;


-- Sumar monto de ventas, para calcular el total de dinero que recauda por mes en alquiler
select sum(monto_total) as recaudacion_mes_alquileres 
from alquiler;

select sum(monto_total) as recaudacion_venta 
from venta;

select sum(precio) as suma_precio_inmuebles 
from inmueble;


-- Inmueble más caro en ventas
Select i.* 
From inmueble i inner join venta v on i.id_inmueble = v.fk_inmueble Where v.monto_total = (Select max(monto_total) From venta);



-- Venta más barata
select min(monto_total) as venta_mas_barata 
from venta;


-- Alquiler más barato
select min(monto_total) as alquiler_mas_barato 
from alquiler;


-- Inmueble más barato
select min(precio) as inmueble_mas_barato 
from inmueble;


-- Venta más cara
select max(monto_total) as venta_mas_cara 
from venta;

-- inmueble más caro
select max(precio) as inmueble_mas_caro 
from inmueble;

-- alquiler más caro
select max(monto_total) as alquiler_mas_caro 
from alquiler;



-- Cantidad de empleados que realizaron ventas en 2023
select count(distinct fk_empleado) as empleados_ventas 
from venta 
where year(fecha) = 2023;


-- Cantidad de empleados actuales en la inmobiliaria
select count(*) cantidad_empleados
from empleado;


-- Buscar el/los empleados con más ventas del año 2023 pero con sus datos nombre, apellido, etc.
select empleado.nombre, empleado.apellido, empleado.tipo_empleado, count(venta.id_venta) as ventastotales  
from venta 
inner join empleado on empleado.id_empleado = venta.fk_empleado  
where year(venta.fecha) = 2023 
group by empleado.nombre, empleado.apellido, empleado.tipo_empleado 
having count(venta.id_venta) = (
    select max(ventastotales) 
    from (
        select count(id_venta) as ventastotales 
        from venta 
        where year(fecha) = 2023 
        group by fk_empleado
    ) as cantidadVentas
);


-- Listar los inmuebles disponibles en Almagro
select i.descripcion, i.direccion, i.precio 
from inmueble i 
left join barrio b on i.id_barrio = b.id_barrio 
where b.nombre_barrio = 'Almagro';


-- Lista de alquileres que utilizaron transferencia como metodo de pago
select alq.id_alquiler, alq.monto_total, alq.fecha 
from alquiler alq 
inner join forma_pago formp on alq.forma_pago = formp.id_forma_pago 
where formp.forma_pago = 'Transferencia';


-- Cantidad total de inmuebles por tipo de inmueble
select ti.tipo_inmueble, count(*) as total_inmuebles 
from inmueble i 
inner join tipo_inmueble ti on i.tipo_inmueble = ti.id_tipo_inmueble 
group by ti.tipo_inmueble;


-- Lista de alquileres donde el tipo de inmueble son departamentos con sus respectivos barrios y precios
select ti.tipo_inmueble, b.nombre_barrio as barrio, alq.monto_total as precio_alquiler 
from inmueble i 
right join alquiler alq on alq.fk_inmueble = i.id_inmueble 
inner join tipo_inmueble ti on ti.id_tipo_inmueble = i.tipo_inmueble 
inner join barrio b on b.id_barrio = i.id_barrio  
where ti.id_tipo_inmueble = 2;



-- Lista de inmuebles en excelentes condiciones que fueron alquilados
select * 
from inmueble 
where id_inmueble in (select fk_inmueble from alquiler) 
and tipo_condicion in (select id_condicion from condicion where condicion = 'Excelente');



-- Subconsulta con in()

-- Lista de clientes que son inquilinos o propietarios
select nombre, apellido, tipo_cliente 
from cliente 
where tipo_cliente in (select id_tipo_cliente from tipo_cliente where tipo_cliente in ('Propietario','Inquilino'));

-- Venta más cara
Select i.* From inmueble i inner join venta v on i.id_inmueble = v.fk_inmueble Where v.monto_total = (Select max(monto_total) From venta);

-- Lista de inmuebles que han sido alquilados
select * 
from inmueble 
where id_inmueble in (select distinct fk_inmueble from alquiler);


-- Lista de clientes que no realizaron un alquiler
select * 
from cliente 
where id_cliente not in (select distinct fk_cliente from alquiler);

-- Datos de los garantes relacionados a un alquiler junto con el nombre y dni del cliente asociado.
Select g.nombre nombre_garante,  g.apellido apellido_garante,  g.dni dni_garante, g.telefono telefono_garante, g.correo correo_garante, g.direccion direccion_garante,c.id_cliente nro_cliente ,c.nombre cliente_asociado , c.dni dni_cliente
, al.id_alquiler numero_alquiler From garante g Inner join alquiler al on g.fk_alquiler = al.id_alquiler Inner join cliente c on g.fk_cliente = c.id_cliente;



-- Vistas

-- Vista 1: ReporteAlquileresClientesreportealquileresclientes
CREATE VIEW ReporteAlquileresClientes AS
SELECT 
    a.id_alquiler,
    a.monto_total,
    a.fecha,
    a.forma_pago,
    a.tipo_garantia,
    e.nombre AS nombre_empleado,
    e.apellido AS apellido_empleado,
    c.nombre AS nombre_cliente,
    c.apellido AS apellido_cliente,
    c.dni AS dni_cliente,
    c.telefono AS telefono_cliente,
    c.correo AS correo_cliente
FROM 
    alquiler a
JOIN 
    empleado e ON a.fk_empleado = e.id_empleado
JOIN 
    cliente c ON a.fk_cliente = c.id_cliente;



-- Vista 2: ReporteInmueblesDetalle (ReporteInmueblesDetalle)
CREATE VIEW ReporteInmueblesDetalle AS
SELECT 
    i.id_inmueble,
    i.descripcion,
    i.m2cubierto,
    i.m2descubierto,
    i.lavadero,
    i.anios_antiguedad,
    i.precio,
    i.patio,
    i.banyo,
    i.refaccionar,
    i.dormitorio,
    i.cocina,
    i.direccion,
    b.nombre_barrio,
    c.condicion,
    t.tipo_inmueble
FROM 
    inmueble i
JOIN 
    barrio b ON i.id_barrio = b.id_barrio
JOIN 
    condicion c ON i.tipo_condicion = c.id_condicion
JOIN 
    tipo_inmueble t ON i.tipo_inmueble = t.id_tipo_inmueble;