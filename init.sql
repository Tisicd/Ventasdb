-- Crear tablas básicas para panel de ventas y colorimetría

CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    rol VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    direccion TEXT
);

CREATE TABLE IF NOT EXISTS productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio NUMERIC(10, 2),
    stock INTEGER
);

CREATE TABLE IF NOT EXISTS ventas (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    fecha TIMESTAMP DEFAULT NOW(),
    total NUMERIC(10, 2)
);

CREATE TABLE IF NOT EXISTS detalles_venta (
    id SERIAL PRIMARY KEY,
    venta_id INTEGER REFERENCES ventas(id),
    producto_id INTEGER REFERENCES productos(id),
    cantidad INTEGER,
    precio_unitario NUMERIC(10, 2)
);

-- Futuro uso en colorimetría
CREATE TABLE IF NOT EXISTS colorimetrias (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    tono_piel VARCHAR(50),
    color_cabello VARCHAR(50),
    colores_recomendados TEXT
);
