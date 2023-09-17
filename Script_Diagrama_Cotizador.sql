SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE Cotizador; 

use Cotizador; 

-- Creación de tablas

CREATE TABLE `clientes` (
  `id_cliente` int(10) NOT NULL,
  `id_cotizacion` int(10) DEFAULT NULL,
  `razon_social` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `tipo_documento` varchar(50) DEFAULT NULL,
  `nro_documento` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `cotizacion` (
  `id_cotizacion` int(10) NOT NULL,
  `numero_cotizacion` int(10) DEFAULT NULL,
  `id_producto` int(10) DEFAULT NULL,
  `id_cliente` int(10) DEFAULT NULL,
  `cantidad` int(110) DEFAULT NULL,
  `telefono` int(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `precio_venta` int(50) DEFAULT NULL,
  `total_venta` int(50) DEFAULT NULL,
  `validez` varchar(50) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `productos` (
  `id_producto` int(10) NOT NULL,
  `codigo_producto` int(10) DEFAULT NULL,
  `nombre_producto` varchar(150) DEFAULT NULL,
  `modelo_producto` varchar(150) DEFAULT NULL,
  `id_proveedor` int(10) DEFAULT NULL,
  `estado_producto` int(10) DEFAULT NULL,
  `habilitado_producto` int(10) DEFAULT NULL,
  `precio_producto` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `proveedor` (
  `id_proveedor` int(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `tipo_documento` varchar(50) DEFAULT NULL,
  `nro_documento` int(20) DEFAULT NULL,
  `telefono` int(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `estado` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `usuarios` (
  `id_usuario` int(10) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefono` int(20) DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `habilitado` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Índices y auto-incremento

ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`id_cotizacion`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_usuario` (`id_usuario`);

ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_proveedor` (`id_proveedor`);

ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`);

ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

ALTER TABLE `clientes`
  MODIFY `id_cliente` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `cotizacion`
  MODIFY `id_cotizacion` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `productos`
  MODIFY `id_producto` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT;

-- Restricciones de clave foránea

ALTER TABLE `cotizacion`
  ADD CONSTRAINT `cotizacion_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  ADD CONSTRAINT `cotizacion_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `cotizacion_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

-- Fin de la transacción

COMMIT;

SET SQL_MODE = @OLD_SQL_MODE;
