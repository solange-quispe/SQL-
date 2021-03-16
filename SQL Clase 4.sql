create database tiendaInformatica;
show databases;
use tiendaInformatica;
create table fabricantes (
codigo int not null,
nombre varchar(20), #ctrl + enter, me ejecutantambien
primary key(codigo)
);
describe fabricantes;
create table articulos (
codigo int not null,
nombre varchar(20),
precio int,
fabricantes int, #tiene que tener mismo tipo de datos que codigo de la tabla fabricantes
primary key(codigo), # Los PRIMARY KEY  no se pueden repetir
foreign key(fabricantes) references fabricantes(codigo)
); # Los FOREIGN KEY si lo podemops repetir
describe articulos;
insert into fabricantes values(
666, 'hyundai' 
);
select *from fabricantes;
insert into articulos values(1, 'toro', 20, 444),(3, 'mustang', 80, 555),(10, 'K', 95, 555);
select *from articulos;
select *from fabricantes inner join articulos on fabricantes.codigo=articulos.fabricante; #este comando es para vincular las tablas
select *from fabricantes, articulos where fabricantes.codigo = articulos.fabricante; #este comando hace lo mismo que el de arriba, sirve para vincular las tablas
select fabricantes.nombre, articulos.nombre, articulos.precio from fabricantes inner join articulos on fabricantes.codigo=articulos.fabricante; #este comando es para que me traiga solamente los datos que estoy pidiendo
select fabricantes.nombre as NOMBRE_FABRICANTE, articulos.nombre as NOMBRE_ARTICULOS, articulos.precio from fabricantes inner join articulos on fabricantes.codigo=articulos.fabricante; #con este comando cambio el nombre de las columnas para que no me quede igual
select f.nombre as NOMBRE_FABRICANTE, a.nombre as NOMBRE_ARTICULOS, a.precio from fabricantes f inner join articulos a on f.codigo=a.fabricante; #asi lo abrevio; en "from fabricantes f inner join articulos a" 
#obtener los nombres de los productos de la tienda
select nombre from articulos;
#obtener los productos cuyo precio sea mayor a 100
select * from articulos where precio > 150; #reemplazo nombre por * para que me muestre todo
select * from articulos where precio between 100 and 800; #aca lo mismo
# mostrar el precio en dolares
select nombre, (precio / 120) as 'PRECIO EN DOLARES' from articulos;
#mostrar el promedio de precio de todos esos productos
select AVG(precio) PROMEDIO from articulos;
#obtener el numero o la cantidad de articulos que tengo
select count(*) from articulos;
#mostrar nombre y precio y ordenar de manera descendiente los precios
select nombre, precio from articulos order by precio desc;
#mostrar nombre de articulos solamente nombre de articulos y fabricantes, mostrar las 2 tablas. Una con el inner join y otra sin el inner join
select m.nombre as MARCA, a.nombre as MODELO, a.precio from marca m inner join articulos a on m.codigo=a.marca;
select marca.nombre as MARCA, articulos.nombre as MODELO, precio as PRECIO from marca, articulos where marca.codigo=articulos.marca;
# añade un nuevo producto
insert into articulos values(100,'mustang',1500000,222);
# edita el nombre de kangoo 
select * from articulos where codigo=2;
# cambiar el nombre de 'toro' por 'chasis'
update articulos set nombre='CHASIS' where codigo=1;
# sacar el 10% de descuento de 'chasis'
select (precio-precio*0.10) as DESCUENTO from articulos where codigo=1;
# informar todos los datos completos del articulo mas caro
select codigo,nombre,max(precio) from articulos;
# no es necesario poner 'inner join' con poner solo 'join' alcanza
# Hay como 5 tipos de relaciones:
# FULL JOIN me traeria todo 
# TABLAS = 'ENTIDADES'
# COLUMNAS = 'ATRIBUTOS'
create database empleados;
use empleados;
create table departamentos(
codigo int,
nombre varchar(50),
presupuesto int,
primary key(codigo)
);
create table empleados(
dni varchar(8),
nombre varchar(50),
apellidos varchar(50),
departamento int,
primary key (dni),
foreign key (departamento) references departamentos(codigo) 
);
# hacer el laboratorio de modificacion de estructura
# tambien hacer el laboratorio de consultas relacionadas
#como se seleccionan todos los registros de una tabla??
select *from table_name;
# a que se denomina join??
#cuando queres unir 2 tablas. Permite cruzar 2 o mas tablas y se clasifican en:
#INNER JOIN
#LEFT JOIN
#RIGHT JOIN
#como agregar registros a una tabla??
insert into table_name values ('alex', 33, 'm'); #ejemplo
#como agregar columnas a una tabla??
#alter table table_name add column_name datatype

#como cambiar el valor del campo??
# update table_name set=campo; ahora se puede usar el WHERE para condicionar que solo se UPDATE en ciertos campos y no en todos 
# que es una "primary key" o clave principal o primaria o clave principal??
# identificar el dato unico de la tabla. Las columna que tiene datos completamente unicos a lo largo de la tabla.
# que son las "foreign keys" o claves externas o foranea??
# para relacionar los datos de las 2 tablas. Las claves externas son campos que vinculan una tabla con la clave primaria o externa de otra tabla.
# cual es la funcion principal de una clave primaria en una tabla??
# identificar como unico cada campo. El papel principal de una clave primaria en una tabla de datos es mantener la integridad interna en la tabla.
# puede una tabla tener mas de una clave externa o foranea definida??
# Si. Una tabla puede tener cualquier numero de claves externas definidas.
# cual es el valor que se puede almacenar en un campo de datos de tipo TINYINT??
# Se puede almacenar desde -128 A 127
# que es la normalizacion??
# Esquematizar las bases de datos para evitar la dedundancia. Es el proceso de diseño de tabla
# Escribir una consulta que solo devuelva la ciudad por cada Alumno de la tabla Students
select city from students;
# que es DML y DDL??
# Son subconjuntos de SQL. DML es un lenguaje para manipular los datos dentro de una tabla (INSERT, UPDATE, SELECT, DELETE) y DDL es un lenguaje para definir la estructura externa de la base de datos y la tabla(CREATE, ALTER, DROP)
# cual es la diferencia entre los comandos DELETE y DROP??
# la diferencia es que DELETE borra tablas y DROP bases de datos
# como se borra toda una base de datos con SQL??
# DROP DATABASE
# en SQL, para ordenar los datos devueltos por una sentencia SELECT se emplea la clausula??
# ORDER BY
# que instruccion se emplea para eliminar todo el contenido de una tabla, pero conservando la tabla??
# TRUNCATE TABLE el DELETE tambien lo hace, la unica diferencia es que el TRUNCATE me reinicia todo el ID tambien me lo reinicia
#una sentencia SELECT sin la clausula WHERE devuelve 
# todos los registros existentes en la table
# en la clausula LIKE, como se obtienen todos los nombres de personas que comienzan con 'Juan'??
# LIKE 'Juan%'
# en SQL; cual de estas sentencias añade una fila a una tabla en una base de datos??
# INSERT 
# en cual de las siguientes sentencias del lenguaje SQL se emplea la clausula SET??
# UPDATE
# que significan las siglas SQL y en que se utiliza??
# Structured Query Language, sirve para manipular bases de datos, se utiliza para consultar y actualizar el contenido de una base de datos.
# como cambiarias 'Carlos' por 'Javier' en la columna "Nombre" de la tabla "Trabajadores"??
# UPDATE Trabajadores SET Nombre = 'Javier' WHERE Nombre = 'Carlos'
# si quisieramos contar el numero de registros de la tabla 'Trabajadores'
# SELECT COUNT(*) FROM Trabajadores
# podrian utilizar: {DELETE FROM usuario}, para eliminar la tabla usuario??
# no, para eliminar el contenido si, pero la tabla no.
# COMO EXPORTAR E IMPORTAR EN SQL
#voy a Data export
# selecciono la base de datos, y me dice la cantidad de tablitas que tengo
# luego marco el redondelito de abajo de exportar "exportar to self ...", el nombre que le voy a poner
# tildo las 2 cajitas que me aparece abajo
# marcarle la ruta, donde la quiero exportar 
# y hacer click en "start export"

 

