-- Usuarios
INSERT INTO usuarios (nombre, email, password, rol) VALUES
('Christian Tisalema', 'ctisalema@example.com', 'admin123', 'admin'),
('María López', 'mlopez@example.com', 'vendedor123', 'vendedor');

-- Productos
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Shampoo Color', 'Shampoo para cabello teñido', 9.99, 30),
('Tintura Capilar', 'Tintura permanente para el cabello', 15.00, 20);

-- Clientes
INSERT INTO clientes (codigo, nombre, contacto, estado) VALUES
('CLI001', 'Ana Torres', 'ana.torres@example.com', 'Activo'),
('CLI002', 'Carlos Pérez', '0987654321', 'Activo'),
('CLI003', 'Luisa Méndez', 'luisa.mendez@example.com', 'Inactivo');

-- Direcciones asociadas
INSERT INTO direcciones (codigo, calle, ciudad, provincia, tipo, cliente_id) VALUES
('DIR001', 'Av. de los Shyris', 'Quito', 'Pichincha', 'Principal', 1),
('DIR002', 'Calle 12 de Octubre', 'Quito', 'Pichincha', 'Facturación', 1),
('DIR003', 'Av. del Ejército', 'Guayaquil', 'Guayas', 'Secundaria', 2),
('DIR004', 'Calle Bolívar', 'Cuenca', 'Azuay', 'Principal', 3);

-- Detalles extendidos de las direcciones
INSERT INTO detalles_direccion (direccion_id, referencia, codigo_postal, latitud, longitud, es_predeterminada) VALUES
(1, 'Frente al centro comercial Quicentro', '170518', -0.175634, -78.480221, TRUE),
(2, 'Junto al parque La Carolina', '170143', -0.185987, -78.484375, FALSE),
(3, 'Edificio Torres del Norte, piso 4', '090101', -2.189412, -79.889067, TRUE),
(4, 'Esquina con la Av. Remigio Crespo', '010203', -2.898116, -79.004254, TRUE);
