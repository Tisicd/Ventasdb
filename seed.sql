-- Usuarios
INSERT INTO usuarios (nombre, email, password, rol) VALUES
('Christian Tisalema', 'ctisalema@example.com', 'admin123', 'admin'),
('María López', 'mlopez@example.com', 'vendedor123', 'vendedor');

-- Productos
INSERT INTO productos (nombre, descripcion, precio, stock) VALUES
('Shampoo Color', 'Shampoo para cabello teñido', 9.99, 30),
('Tintura Capilar', 'Tintura permanente para el cabello', 15.00, 20);

-- Clientes (Maestro)
INSERT INTO clientes (
    codigo, nombres, apellidos, tipo_documento, numero_documento, tipo_cliente,
    razon_social, correo_electronico, telefono, fecha_registro, estado
) VALUES
('CLI001', 'Ana', 'Torres', 'Cédula', '1728391827', 'Natural', NULL, 'ana.torres@example.com', '0987654321', CURRENT_DATE, 'Activo'),
('CLI002', 'Carlos', 'Pérez', 'RUC', '1790011223001', 'Jurídico', 'Servicios Pérez S.A.', 'carlos.perez@sperez.com', '0998765432', CURRENT_DATE, 'Activo'),
('CLI003', 'Luisa', 'Méndez', 'Cédula', '1804567890', 'Natural', NULL, 'luisa.mendez@example.com', '0987123456', CURRENT_DATE, 'Inactivo');

-- Direcciones (Detalle 1)
INSERT INTO direcciones (
    codigo_direccion, calle_principal, calle_secundaria, numero_casa, barrio,
    ciudad, provincia, zona, tipo_direccion, cliente_id
) VALUES
('DIR001', 'Av. de los Shyris', 'Av. Naciones Unidas', 'N34-56', 'La Carolina', 'Quito', 'Pichincha', 'Urbana', 'Principal', 1),
('DIR002', 'Calle 12 de Octubre', 'Luis Cordero', 'E10-22', 'González Suárez', 'Quito', 'Pichincha', 'Urbana', 'Facturación', 1),
('DIR003', 'Av. del Ejército', 'Av. Quito', 'S25-88', 'Centro', 'Guayaquil', 'Guayas', 'Urbana', 'Secundaria', 2),
('DIR004', 'Calle Bolívar', 'Simón Bolívar', 'C12-14', 'San Sebastián', 'Cuenca', 'Azuay', 'Urbana', 'Principal', 3);

-- Información adicional de direcciones (Detalle 2)
INSERT INTO detalles_direccion (
    direccion_id, referencia, codigo_postal, instrucciones_envio,
    observaciones, fecha_registro_direccion, cliente_id
) VALUES
(1, 'Frente al centro comercial Quicentro', '170518', 'Llamar antes de entregar', 'Cliente recurrente premium', CURRENT_DATE, 1),
(2, 'Junto al parque La Carolina', '170143', 'No dejar con guardia', 'Solicitó entrega exprés', CURRENT_DATE, 1),
(3, 'Edificio Torres del Norte, piso 4', '090101', 'Oficina abierta de 9 a 5', 'Prefiere factura electrónica', CURRENT_DATE, 2),
(4, 'Esquina con la Av. Remigio Crespo', '010203', 'Tocar el timbre azul', 'Cliente inactivo, confirmar antes de entregar', CURRENT_DATE, 3);
