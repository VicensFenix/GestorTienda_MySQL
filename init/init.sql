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

-- Tabla FORMAS DE PAGO
CREATE TABLE formas_de_pago (
    id_forma_pago INT AUTO_INCREMENT PRIMARY KEY,
    tipo_pago ENUM('Efectivo', 'Transferencia', 'Tarjeta') NOT NULL
);

-- Tabla CAJA
CREATE TABLE caja(
    id_caja INT AUTO_INCREMENT PRIMARY KEY,
    fecha_apertura_caja DATE,
    hora_apertura_caja TIME,
    monto_inicial_caja DECIMAL(10,2) NOT NULL,
    fecha_cierre_caja DECIMAL(10,2),
    fecha_cierre_caja DATE,
    hora_cierre_caja TIME,
    monto_final_caja DECIMAL(10,2) NOT NULL,
    total_ventas_caja DECIMAL(10,2) NOT NULL,
    diferencia_cuadre DECIMAL(10,2) NOT NULL,
    estado_caja ENUM('Abierta', 'Cerrada'),
    caja_abierta_por ENUM('admin', 'empleado'),
    id_admin INT NOT NULL,
    id_empleado INT,
    FOREIGN KEY (id_admin) REFERENCES administrador(id_admin),
    FOREIGN KEY (id_empleo) REFERENCES empleado(id_empleado)
);

-- Tabla VENTA
CREATE TABLE venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    fecha_venta DATE,
    hora_venta TIME,
    id_caja INT,
    total_venta DECIMAL(10,2),
    monto_entregado DECIMAL(10,2),
    metodo_pago INT,
    FOREIGN KEY (id_caja) REFERENCES caja(id_caja),
    FOREIGN KEY (metodo_pago) REFERENCES formas_de_pago(id_forma_pago)
);

-- Tabla DETALLEVENTA
CREATE TABLE detalle_venta (
    id_venta_detallada INT AUTO_INCREMENT PRIMARY KEY,
    id_venta INT,
    id_producto INT,
    cantidad_venta INT,
    precio_unitario DECIMAL(10,2),
    total_final_venta DECIMAL(10,2),
    FOREIGN KEY (id_venta) REFERENCES venta(id_venta),
    FOREIGN KEY (id_producto) REFERENCES producto(id_producto)
);
