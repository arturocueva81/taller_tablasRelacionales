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