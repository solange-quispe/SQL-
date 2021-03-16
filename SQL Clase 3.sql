CREATE DATABASE Laboratorio;
USE Laboratorio;
CREATE TABLE Facturas(
letra char not null,
numero int,
clienteId int, #esto significa que es entero
articuloId int,
fecha date,
monto double,
PRIMARY KEY(letra,numero) 
);
DESCRIBE Facturas;
INSERT INTO Facturas(
letra,numero,clienteId,articuloId,fecha,monto
)VALUES(
'M',123,1,9,'2020-07-16',20.2 #en fecha puse comillas simples por los guiones
);
CREATE TABLE Articulos(
articuloId int,
nombre varchar(50),
precio double,
stock int,
PRIMARY KEY(articuloId)
);
DESCRIBE Articulos;
CREATE TABLE Clientes(
clienteId int,
nombre varchar(50),
apellido varchar(50),
cuil char(16),
direccion varchar(50),
comentarios varchar(50),
PRIMARY KEY(clienteId) 
);
SHOW TABLES;
DESCRIBE Clientes;
SELECT *FROM Facturas; #con este comando  puedo ir viendo como va quedando la tabla hasta el momento
INSERT INTO Facturas(
letra,numero,clienteId,articuloId,fecha,monto
)VALUES(
'M',123,1,9,'2020-07-16',20.2 #en fecha puse comillas simples por los guiones
); #podemos copiar y pegar tambien si queremnos
INSERT INTO Clientes (
clientesId, nombre, apellido, direccion, comentarios, cuil,
)
VALUES (
'Giovani', 
)
SELECT *FROM articulos; #ESTE COMANDO ME MUESTRA TODAS LAS COLUMNAS DE LA TABLA ARTICULOS
SELECT nombre FROM articulos; #SI YO QUIERO MOSTRAR LOS DATOS DE SOLO UNA COLUMNA USO ESTE COMANDO
SELECT nombre, precio FROM articulos; #SI YO QUIERO MOSTRAR LOS DATOS DE 2 COLUMNAS USO ESTE COMANDO
#ORDER BY por defecto siempre me lo ordena de manera ascendente
SELECT nombre, precio FROM articulos ORDER BY nombre;
SELECT nombre, precio FROM articulos ORDER BY nombre DESC; #CON ESTE COMANDO ME LO ORDENA DE MANERA DESCENDENTE
SELECT nombre, precio FROM articulos ORDER BY precio DESC;
SELECT nombre, precio FROM articulos ORDER BY precio DESC LIMIT 3; #CON ESTE COMANDO LIMITO LA CANTIDAD DE REGISTROS
SELECT nombre, precio FROM articulos ORDER BY precio ASC LIMIT 1; #ASI LO CAMBIO A MANERA ASCENDENTE
SELECT nombre, precio FROM articulos ORDER BY precio ASC LIMIT 2 OFFSET 2; #LE ESTARIA DICIENDO QUE ME LIMITE A 2 EMPEZANDO POR EL 2º
SELECT nombre, precio FROM articulos ORDER BY precio DESC LIMIT 2 OFFSET 2;
SELECT nombre, precio FROM articulos ORDER BY articulos ASC LIMIT 2 OFFSET 2;
SELECT nombre, precio FROM articulos LIMIT 2 OFFSET 2;
SELECT nombre, precio FROM articulos ORDER BY precio ASC LIMIT 2 OFFSET 2;
SELECT nombre, precio FROM articulos ORDER BY precio DESC LIMIT 2 OFFSET 2;
#OPERADOR DE COMPARACION =, <, >, >=, <=, <> SIGNIFICA NO ES IGUAL
SELECT *FROM articulos WHERE articuloId=555; #le estoy diciendo que me seleccione todos los datos de la tabla articulo donde articuloId sea = a 555
SELECT nombre, precio FROM articulos WHERE precio > 150; #otro ejemplo
#OPERADORES LOGICOS, la tabla de la verdad. Me sirve para preguntar 2 cosas a la vez por ejemplo
SELECT *FROM articulos WHERE nombre = 'shampoo' AND stock > 2000; #&& = AND
SELECT *FROM articulos WHERE nombre = 'Shampoo' AND stock > 10000; #|| = OR
SELECT *FROM articulos WHERE nombre <> 'Shampoo' OR articuloId <> 555; #!= = <>
SELECT *FROM articulos WHERE nombre <> 'Shampoo' AND articuloId <> 555; #!= = <>
#BETWEEN minimo AND maximo
#NOT BETWEEN minimo AND maximo
SELECT *FROM articulos WHERE precio NOT BETWEEN 100 AND 300; #EJEMPLO
SELECT *FROM articulos WHERE articuloId IN (222, 333); #con esta clausula le pido que me traiga esos datos
SELECT *FROM articulos WHERE articuloId NOT IN (222, 333); #NOT IN es como decir "no los encuentres"
SELECT *FROM articulos WHERE nombre LIKE '%cond%'; #me va a traer la informacion que este contenido entre '% %', podria ser una letra, una palabra.Esto se usa mucho en los buscadores
SELECT *FROM articulos WHERE nombre LIKE 'c%'; #si yo pongo el % al final me busca todas las palabras que empiezan con 'c'
SELECT *FROM articulos WHERE nombre LIKE '%m'; #si yo pongo el % al principio me busca todas las palabras que terminan en 'm'
SELECT *FROM articulos WHERE nombre LIKE 'a%r'; #si escribo asi solo busca las palabras que terminan en 'a' y terminan en 'r'
SELECT *FROM articulos WHERE nombre LIKE 'a%r';

INSERT INTO Facturas(
letra,numero,clienteId
)VALUES(
'X',988,8 #en fecha puse comillas simples por los guiones
);
SELECT *FROM facturas WHERE fecha IS NULL; #me muestra los campos donde no puse nada, es decir esta vacio, no tiene nada, no fue creado
SELECT *FROM articulos WHERE precio > 100; #LABORATORIO 2
SELECT *FROM articulos WHERE precio >= 100 AND precio < 150; 
SELECT *FROM articulos WHERE precio BETWEEN 100 AND 150; #con between
SELECT *FROM articulos WHERE precio = 100 AND stock > 150; 
SELECT *FROM articulos WHERE precio = 100 OR precio = 150 OR precio = 200; #va con OR 
SELECT *FROM articulos WHERE precio IN (100, 150, 200); #con esta clausula le pido que me traiga esos datos
SELECT *FROM articulos WHERE precio NOT IN (100, 150, 200); #con esta clausula le pido que me traiga esos datos
# HACER PUNTO 3,4 Y 5
# Y HACER EL LABORATORIO BONUS

SELECT *FROM articulos ORDER BY precio, nombre DESC; 
SELECT nombre, precio, (precio * 1.21) AS iva FROM articulos; #NO ESTA EDITANDO NADA EN LA BASE DE DATOS SOLAMENTE ES PARA MOSTRARLO EN UN SELEC
SELECT nombre AS identificador, precio, (precio * 1.21) AS iva FROM articulos; # El AS me permite ponerle nombre a una columna
SELECT precio, 3 AS cuotas, (precio/3) * 1.05 AS valorcuota FROM articulos;
# Lenguaje de Definicion de Datos DDL, nos permiten modificar datos de manera externa, es decir, crear una base de datos, eliminarla, crear tablas, eliminar tablas, pero a la vez puedo modificar ciertas cosas de las tablas, agregar columnas nuevas en una base de datos ya creada
# Lenguaje de Manipulacion de Datos, me permite manejar la parte interna, nos permiten guardar informacion dentro de la tabla, podemos eliminar esos datos, pero tambien vamso a poder modificarlos 
# Las 4 operaciones fundamentales para manipular datos dentro de una base, INSERTAR, BORRAR, SELECCIONAR, MODIFICAR
#UPDATE nombre de la tabla SET nombre del campo (nombre del campo, nombre de la columna) = valor. Podriamos modificar varios campos a la vez no necesariamente debe ser uno
# UPDATE personas SET nombre = 'Maria'; con UPDATE me va a modificar a todos los registros que se llamen Maria 
SELECT *FROM articulos; 
UPDATE articulos SET nombre = 'shampoo vegano' WHERE articuloId = 222; # ASI MODIFICO SOLO UN DATO
DELETE FROM articulos WHERE precio > 150; #con DELETE puedo eliminar, filas, columnas y tablas completas
DELETE FROM articulos; # asi elimino una tabla completa
CREATE TABLE ejemplo (    #int = entero, auto_incremento = me incrementa automaticamente el valor de Id de manera creciente
id int auto_increment,
nombre varchar(20),
precio double,
primary key (id)
);
DESCRIBE ejemplo;
INSERT INTO ejemplo (nombre, precio) VALUES ( 'lapiz', 100);
SELECT *FROM ejemplo;
DELETE FROM ejemplo; # con DELETE el Id se sigue contabilizando a partir del ultimo que ingrese, no se borra
TRUNCATE TABLE ejemplo; # es como si se reiniciara, el Id comenzo nuevamente en el 1, esa es la diferencia con el DELETE
