-- Usuarios de prueba (3 en total, 2 originales + 1 nuevo)
INSERT INTO usuarios (nombre, email, password, rol) VALUES
('Christian Tisalema', 'ctisalema@example.com', 'admin123', 'admin'),
('María López', 'mlopez@example.com', 'vendedor123', 'vendedor'),
('Pedro Martínez', 'pmartinez@example.com', 'supervisor123', 'supervisor'),
('Ana Sánchez', 'asanchez@example.com', 'asistente123', 'asistente');

-- Clientes (Maestro) - SIN información de contacto (ahora está en direcciones)
INSERT INTO clientes (
    codigo, nombres, apellidos, tipo_documento, numero_documento, tipo_cliente,
    razon_social, fecha_registro, estado, observaciones
) VALUES
('CLI001', 'Ana', 'Torres', 'Cédula', '1728391827', 'Natural', NULL, CURRENT_DATE, 'Activo', 'Cliente recurrente premium'),
('CLI002', 'Carlos', 'Pérez', 'RUC', '1790011223001', 'Jurídico', 'Servicios Pérez S.A.', CURRENT_DATE, 'Activo', 'Prefiere factura electrónica'),
('CLI003', 'Luisa', 'Méndez', 'Cédula', '1804567890', 'Natural', NULL, CURRENT_DATE, 'Inactivo', 'Cliente inactivo, confirmar antes de contactar');

-- Direcciones (ahora con información de contacto)
INSERT INTO direcciones (
    codigo_direccion, calle_principal, calle_secundaria, numero_casa, barrio,
    ciudad, provincia, zona, codigo_postal,
    correo_electronico, telefono_principal, telefono_secundario,
    referencia, tipo_direccion, instrucciones_envio,
    cliente_id, fecha_registro
) VALUES
-- Direcciones para Ana Torres (CLI001)
('DIR001', 'Av. de los Shyris', 'Av. Naciones Unidas', 'N34-56', 'La Carolina', 
 'Quito', 'Pichincha', 'Urbana', '170518',
 'ana.torres@example.com', '0987654321', '022345678',
 'Frente al centro comercial Quicentro', 'Principal', 'Llamar antes de entregar',
 1, CURRENT_DATE),

('DIR002', 'Calle 12 de Octubre', 'Luis Cordero', 'E10-22', 'González Suárez', 
 'Quito', 'Pichincha', 'Urbana', '170143',
 'ana.torres.oficina@example.com', '022987654', NULL,
 'Junto al parque La Carolina', 'Oficina', 'No dejar con guardia',
 1, CURRENT_DATE),

-- Direcciones para Carlos Pérez (CLI002)
('DIR003', 'Av. del Ejército', 'Av. Quito', 'S25-88', 'Centro', 
 'Guayaquil', 'Guayas', 'Urbana', '090101',
 'carlos.perez@sperez.com', '0998765432', '042567890',
 'Edificio Torres del Norte, piso 4', 'Facturación', 'Oficina abierta de 9 a 5',
 2, CURRENT_DATE),

-- Dirección para Luisa Méndez (CLI003)
('DIR004', 'Calle Bolívar', 'Simón Bolívar', 'C12-14', 'San Sebastián', 
 'Cuenca', 'Azuay', 'Urbana', '010203',
 'luisa.mendez@example.com', '0987123456', NULL,
 'Esquina con la Av. Remigio Crespo', 'Principal', 'Tocar el timbre azul',
 3, CURRENT_DATE);