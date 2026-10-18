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
