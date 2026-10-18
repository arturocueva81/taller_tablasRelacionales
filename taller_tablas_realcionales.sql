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