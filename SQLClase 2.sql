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

