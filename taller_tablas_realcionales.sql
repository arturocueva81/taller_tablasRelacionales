-- Parte 1. crear la base de datos
CREATE DATABASE biblioteca_db;

SELECT current_database();

-- parte 2. Crear tablas
-- tabla libros
CREATE TABLE libros (
	codigo VARCHAR(5),
	titulo VARCHAR(50) NOT NULL,
	paginas INT NOT NULL,
	CONSTRAINT libros_pk PRIMARY KEY (codigo)
);

-- tabla autores
CREATE TABLE autores (
    id INT,
    nombre VARCHAR(50) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    CONSTRAINT autores_pk PRIMARY KEY (id)
);

SELECT * FROM libros;
SELECT * FROM autores;

-- parte 3, la tabla de rompimiento
CREATE TABLE libro_autor (
    la_libro_codigo_fk VARCHAR(5) NOT NULL,
    la_autor_id_fk INT NOT NULL,
    anio_publicacion INT NOT NULL,

    CONSTRAINT libro_autor_pk
        PRIMARY KEY (la_libro_codigo_fk, la_autor_id_fk),

    CONSTRAINT libro_autor_libro_fk
        FOREIGN KEY (la_libro_codigo_fk)
        REFERENCES libros (codigo),

    CONSTRAINT libro_autor_autor_fk
        FOREIGN KEY (la_autor_id_fk)
        REFERENCES autores (id)
);

SELECT * FROM libro_autor;

-- parte 4 insertar datos
-- libros, 4 registros
INSERT INTO libros (codigo, titulo, paginas) VALUES
    ('L0001', 'Cien anios de soledad', 471),
    ('L0002', 'El amor en los tiempos del colera', 368),
    ('L0003', 'La casa de los espiritus', 433),
    ('L0004', 'Rayuela', 635);

--  autores, 3 registros
INSERT INTO autores (id, nombre, pais) VALUES
    (1, 'Gabriel Garcia Marquez', 'Colombia'),
    (2, 'Isabel Allende', 'Chile'),
    (3, 'Julio Cortazar', 'Argentina');

-- libro_autor,5 relaciones
INSERT INTO libro_autor (la_libro_codigo_fk, la_autor_id_fk, anio_publicacion) VALUES
    ('L0001', 1, 2021),
    ('L0002', 1, 2022),
    ('L0003', 2, 2019),
    ('L0004', 3, 2023),
    ('L0001', 3, 2020);

SELECT * FROM libros;
SELECT * FROM autores;
SELECT * FROM libro_autor;

-- 5. consultas SQL
-- Consulta 1 Mostrar: título del libro, nombre del autor, país, año de publicación
-- Utilizando INNER JOIN.
SELECT l.titulo, a.nombre, a.pais, la.anio_publicacion
FROM libro_autor la
INNER JOIN libros l ON la.la_libro_codigo_fk = l.codigo
INNER JOIN autores a ON la.la_autor_id_fk = a.id;

--Consulta 2: Mostrar únicamente libros publicados después del año 2020.
SELECT l.titulo, la.anio_publicacion
FROM libro_autor la
INNER JOIN libros l ON la.la_libro_codigo_fk = l.codigo
WHERE la.anio_publicacion > 2020;

-- Consulta 3: Mostrar únicamente autores de un país específico usando WHERE.
SELECT id, nombre, pais
FROM autores
WHERE pais = 'Colombia';

--Consulta 4: Ordenar los libros por año de publicación descendente.
SELECT l.titulo, la.anio_publicacion
FROM libro_autor la
INNER JOIN libros l ON la.la_libro_codigo_fk = l.codigo
ORDER BY la.anio_publicacion DESC;

-- Consulta 5: Contar cuántos libros tiene cada autor utilizando:COUNT(),GROUP BY
SELECT a.nombre, COUNT(la.la_libro_codigo_fk) AS total_libros
FROM autores a
INNER JOIN libro_autor la ON a.id = la.la_autor_id_fk
GROUP BY a.nombre
ORDER BY total_libros DESC;

-- parte 6 modificacion de la tabla: agregar la columna precio a libros
ALTER TABLE libros
ADD COLUMN precio DOUBLE PRECISION;

SELECT * FROM libros

--actualizar precios
UPDATE libros SET precio = 25.50 
WHERE codigo = 'L0001';

UPDATE libros SET precio = 19.99 
WHERE codigo = 'L0002';

UPDATE libros SET precio = 22.75 
WHERE codigo = 'L0003';

UPDATE libros SET precio = 30.00 
WHERE codigo = 'L0004';

-- consulta que muestre titulo y precio
SELECT titulo, precio
FROM libros;
