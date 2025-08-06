-- Tabla Administrador
CREATE TABLE administrador (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    nombre_admin VARCHAR(100) NOT NULL,
    usuario_admin VARCHAR(50) UNIQUE,
    password_admin VARCHAR(225) NOT NULL,
    fecha_creacion_admin DATETIME DEFAULT CURRENT_TIMESTAMP,
    ultimo_login_admin DATATIME
);

-- Tabla Empleado
CREATE TABLE empleado(
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre_empleado VARCHAR(100) NOT NULL,
    usuario_empleado VARCHAR(50) UNIQUE,
    password_empleado VARCHAR(225) NOT NULL,
    fecha_creacion_empleado DATETIME DEFAULT CURRENT_TIMESTAMP,
    ultimo_login_empleado DATATIME
);


-- Tabla CATEGORIA
CREATE TABLE categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(100) NOT NULL,
    descripcion_categoria TEXT,
    categoria_activa BOOLEAN DEFAULT TRUE
);

-- Tabla PRODUCTO
CREATE TABLE producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio_producto DECIMAL(10,2) NOT NULL,
    stock_producto INT DEFAULT 0,
    stockmin_producto INT,
    codigo_barra_producto VARCHAR(50) NOT NULL,
    fecha_creacion_prod DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion DATETIME,
    activo_producto BOOLEAN DEFAULT TRUE,
    categoria_producto INT NOT NULL,
    FOREIGN KEY (categoria_producto) REFERENCES categoria(id_categoria)
);
