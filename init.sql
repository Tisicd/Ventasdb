-- Crear tabla de usuarios
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
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    tipo_documento VARCHAR(20) CHECK (tipo_documento IN ('Cédula', 'RUC')) NOT NULL,
    numero_documento VARCHAR(20) UNIQUE NOT NULL,
    tipo_cliente VARCHAR(20) CHECK (tipo_cliente IN ('Natural', 'Jurídico')) NOT NULL,
    razon_social VARCHAR(150), -- solo si es Jurídico
    correo_electronico VARCHAR(100),
    telefono VARCHAR(20),
    fecha_registro DATE DEFAULT CURRENT_DATE,
    estado VARCHAR(20) CHECK (estado IN ('Activo', 'Inactivo')) DEFAULT 'Activo'
);

-- Detalle 1: Direcciones asociadas al cliente
CREATE TABLE IF NOT EXISTS direcciones (
    id SERIAL PRIMARY KEY,
    codigo_direccion VARCHAR(20) UNIQUE NOT NULL,
    calle_principal VARCHAR(150) NOT NULL,
    calle_secundaria VARCHAR(150),
    numero_casa VARCHAR(20),
    barrio VARCHAR(100),
    ciudad VARCHAR(100),
    provincia VARCHAR(100),
    zona VARCHAR(20) CHECK (zona IN ('Urbana', 'Rural')),
    tipo_direccion VARCHAR(50), -- Ej: Principal, Facturación, Envío, Oficina
    cliente_id INTEGER NOT NULL REFERENCES clientes(id) ON DELETE CASCADE
);

-- Detalle 2: Información adicional de direcciones
CREATE TABLE IF NOT EXISTS detalles_direccion (
    id SERIAL PRIMARY KEY,
    direccion_id INTEGER NOT NULL REFERENCES direcciones(id) ON DELETE CASCADE,
    referencia TEXT,
    codigo_postal VARCHAR(20),
    instrucciones_envio TEXT,
    observaciones TEXT,
    fecha_registro_direccion DATE DEFAULT CURRENT_DATE,
    cliente_id INTEGER NOT NULL REFERENCES clientes(id) ON DELETE CASCADE
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
