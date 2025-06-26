-- Crear tablas básicas para panel de ventas y colorimetría

CREATE TABLE IF NOT EXISTS usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    rol VARCHAR(50)
);

-- Tabla Maestro: Clientes
CREATE TABLE IF NOT EXISTS clientes (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    estado VARCHAR(20) CHECK (estado IN ('Activo', 'Inactivo')) DEFAULT 'Activo'
);

-- Tabla Detalle: Direcciones asociadas a clientes
CREATE TABLE IF NOT EXISTS direcciones (
    id SERIAL PRIMARY KEY,
    codigo VARCHAR(20) UNIQUE NOT NULL,
    calle VARCHAR(150) NOT NULL,
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    tipo VARCHAR(50), -- Ej: Principal, Secundaria, Facturación
    cliente_id INTEGER NOT NULL REFERENCES clientes(id) ON DELETE CASCADE
);

-- Tercer nivel de detalle: información extendida para direcciones
CREATE TABLE IF NOT EXISTS detalles_direccion (
    id SERIAL PRIMARY KEY,
    direccion_id INTEGER NOT NULL REFERENCES direcciones(id) ON DELETE CASCADE,
    referencia TEXT,
    codigo_postal VARCHAR(20),
    latitud DECIMAL(10, 8),
    longitud DECIMAL(11, 8),
    es_predeterminada BOOLEAN DEFAULT FALSE
);

-- Productos
CREATE TABLE IF NOT EXISTS productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    precio NUMERIC(10, 2),
    stock INTEGER
);

-- Ventas
CREATE TABLE IF NOT EXISTS ventas (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    fecha TIMESTAMP DEFAULT NOW(),
    total NUMERIC(10, 2)
);

-- Detalles de cada venta
CREATE TABLE IF NOT EXISTS detalles_venta (
    id SERIAL PRIMARY KEY,
    venta_id INTEGER REFERENCES ventas(id),
    producto_id INTEGER REFERENCES productos(id),
    cantidad INTEGER,
    precio_unitario NUMERIC(10, 2)
);

-- Colorimetría
CREATE TABLE IF NOT EXISTS colorimetrias (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    tono_piel VARCHAR(50),
    color_cabello VARCHAR(50),
    colores_recomendados TEXT
);
