CREATE DATABASE IF NOT EXISTS biblioteca_untec;
USE biblioteca_untec;

CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    clave VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    disponible BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS prestamos (
    id_prestamo INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_libro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    estado VARCHAR(20) NOT NULL DEFAULT 'PRESTADO',

    FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario),

    FOREIGN KEY (id_libro)
        REFERENCES libros(id_libro)
);

INSERT IGNORE INTO usuarios
(id_usuario, nombre, correo, clave)
VALUES
(1, 'Administrador UNTEC', 'admin@untec.cl', '1234');

INSERT IGNORE INTO libros
(id_libro, titulo, autor, disponible)
VALUES
(1, 'El Principito', 'Antoine de Saint-Exupery', TRUE),
(2, 'Cien años de soledad', 'Gabriel Garcia Marquez', TRUE),
(3, 'Don Quijote de la Mancha', 'Miguel de Cervantes', TRUE),
(4, 'Harry Potter y la piedra filosofal', 'J. K. Rowling', TRUE),
(5, 'Papelucho', 'Marcela Paz', TRUE);