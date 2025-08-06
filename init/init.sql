-- Tabla Administrador
CREATE TABLE administrador (
    id_admin INT AUTO_INCREMENT PRIMARY KEY,
    nombre_admin VARCHAR(100),
    usuario_admin VARCHAR(50) UNIQUE,
    password_admin VARCHAR(225),
    fecha_creacion_admin DATETIME DEFAULT CURRENT_TIMESTAMP,
    ultimo_login_admin DATATIME
);