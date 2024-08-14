CREATE DATABASE gestion_peliculas;

USE gestion_peliculas;

CREATE TABLE Peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    anio_estreno YEAR NOT NULL,
    duracion INT,
    id_genero INT,
    id_director INT,
    cantidad_disponible INT DEFAULT 0,
    FOREIGN KEY (id_genero) REFERENCES Generos(id_genero),
    FOREIGN KEY (id_director) REFERENCES Directores(id_director)
);

CREATE TABLE Directores (
    id_director INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    pais_origen VARCHAR(100)
);

CREATE TABLE Actores (
    id_actor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    pais_origen VARCHAR(100)
);

CREATE TABLE Actuado_Por (
    id_pelicula INT,
    id_actor INT,
    PRIMARY KEY (id_pelicula, id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula) ON DELETE CASCADE,
    FOREIGN KEY (id_actor) REFERENCES Actores(id_actor) ON DELETE CASCADE
);

CREATE TABLE Generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

CREATE TABLE Alquileres (
    id_alquiler INT AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT,
    id_cliente INT,
    fecha_alquiler DATE NOT NULL,
    fecha_devolucion DATE,
    FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);
