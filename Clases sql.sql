create database restaurante;
use restaurante;
CREATE TABLE categorias (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE platos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(255),
  precio DECIMAL(8,2) NOT NULL,
  categoria_id INT,
  FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE mesas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  numero INT NOT NULL,
  capacidad INT NOT NULL
);

CREATE TABLE clientes (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20)
);

CREATE TABLE empleados (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  puesto VARCHAR(50)
);

CREATE TABLE pedidos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  fecha DATETIME NOT NULL,
  cliente_id INT,
  mesa_id INT,
  empleado_id INT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (mesa_id) REFERENCES mesas(id),
  FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);

CREATE TABLE detalle_pedido (
  id INT PRIMARY KEY AUTO_INCREMENT,
  pedido_id INT,
  plato_id INT,
  cantidad INT NOT NULL,
  FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
  FOREIGN KEY (plato_id) REFERENCES platos(id)
);

CREATE TABLE reservas (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  mesa_id INT,
  fecha DATETIME NOT NULL,
  cantidad_personas INT,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id),
  FOREIGN KEY (mesa_id) REFERENCES mesas(id)
);
INSERT INTO categorias (nombre) VALUES
('Entrada'), ('Plato Fuerte'), ('Postre'), ('Bebida');

INSERT INTO platos (nombre, descripcion, precio, categoria_id) VALUES
('Ensalada César', 'Lechuga, pollo, crutones y aderezo César', 8.500, 1),
('Filete de Res', 'Filete de res a la parrilla con papas', 15.000, 2),
('Helado', 'Helado de vainilla y chocolate', 4.000, 3),
('Agua Mineral', 'Botella de agua mineral', 2.000, 4);

INSERT INTO mesas (numero, capacidad) VALUES
(1, 4), (2, 2), (3, 6);

INSERT INTO clientes (nombre, telefono) VALUES
('Juan Pérez', '555-1234'),
('Ana Gómez', '555-5678');

INSERT INTO empleados (nombre, puesto) VALUES
('Joaquin Llanos', 'Cajero'),
('Florencia Aguirre', 'Mesero'),
('Dana Lemos', 'Maitre'),
('German Martinez','Ayudante de Cocina'),
('Damian Vera','Cocinero'),
('Mauro Maidana', 'jefe de cocina');
