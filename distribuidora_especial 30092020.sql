-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 23-09-2020 a las 00:40:55
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `distribuidora_especial`
--
CREATE DATABASE IF NOT EXISTS `distribuidora_especial` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `distribuidora_especial`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idcompra` int(11) NOT NULL,
  `numerocompra` int(11) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `fechacompra` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `preciounitario` decimal(3,2) NOT NULL,
  `unidad` varchar(20) NOT NULL,
  `totaliva` decimal(4,2) NOT NULL,
  `subtotal` decimal(5,2) NOT NULL,
  `totalcompra` decimal(4,2) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallecompra`
--

CREATE TABLE `detallecompra` (
  `iddetallecompra` int(11) NOT NULL,
  `idcompra` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `duiproveedor` varchar(10) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidadcompra` int(11) NOT NULL,
  `preciocompra` decimal(3,2) NOT NULL,
  `descuento` decimal(3,0) NOT NULL,
  `fechacompra` date NOT NULL,
  `totalcompra` decimal(5,2) NOT NULL,
  `idcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalleventa`
--

CREATE TABLE `detalleventa` (
  `iddetalleventa` int(11) NOT NULL,
  `idventa` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `fechaventa` date NOT NULL,
  `cantidadventa` int(11) NOT NULL,
  `precioventa` decimal(3,2) NOT NULL,
  `descuento` decimal(3,2) NOT NULL,
  `totalventa` decimal(4,2) NOT NULL,
  `idcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntasecreta`
--

CREATE TABLE `preguntasecreta` (
  `idpreguntasecreta` tinyint(4) NOT NULL,
  `nombre` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `preguntasecreta`
--

INSERT INTO `preguntasecreta` (`idpreguntasecreta`, `nombre`) VALUES
(1, 'mi nombre'),
(2, 'mi apellido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idproducto` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `preciounitario` decimal(3,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(90) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dui` varchar(10) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `direccionempresa` varchar(100) NOT NULL,
  `nombreempresa` varchar(50) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposusuario`
--

CREATE TABLE `tiposusuario` (
  `idtipousuario` tinyint(4) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `descripcion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tiposusuario`
--

INSERT INTO `tiposusuario` (`idtipousuario`, `nombre`, `descripcion`) VALUES
(1, 'Administrador', 'todos los permisos'),
(2, 'Normal', 'pocos permisos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `clave` varchar(32) NOT NULL,
  `fecha` varchar(100) NOT NULL,
  `idpreguntasecreta` tinyint(4) NOT NULL,
  `respuestasecreta` varchar(32) NOT NULL,
  `idtipousuario` tinyint(4) NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `apellido`, `telefono`, `usuario`, `clave`, `fecha`, `idpreguntasecreta`, `respuestasecreta`, `idtipousuario`, `estado`) VALUES
(1, 'Luis', 'Carranza', '2222-0505', 'usuario1', 'f688ae26e9cfa3ba6235477831d5122e', 'Ultima modificación: 2020-09-20 a las 08:29:08 AM', 1, 'brayan', 1, 1),
(2, 'Brayan', 'Salomon Fuentes Quijano', '7777-7779', 'el brayan', '81dc9bdb52d04dc20036dbd8313ed055', 'Modificación: 2020-09-20 a las 07:21:45 AM', 2, 'andres', 1, 0),
(15, 'Andres', 'Pineda', '2322-4344', 'andrew', '231badb19b93e44f47da1bd64a8147f2', 'Modificación: 2020-09-20 a las 08:28:20 AM', 1, '231badb19b93e44f47da1bd64a8147f2', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idventa` int(11) NOT NULL,
  `numeroventa` int(11) NOT NULL,
  `fechaventa` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `preciounitario` decimal(10,0) NOT NULL,
  `iva` decimal(3,2) NOT NULL,
  `subtotal` decimal(3,2) NOT NULL,
  `total` decimal(4,2) NOT NULL,
  `idusuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idcategoria`),
  ADD KEY `fk_categoria_usuario` (`idusuario`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `fk_compra_proveedor` (`idproveedor`),
  ADD KEY `fk_compra_usuario` (`idusuario`);

--
-- Indices de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD PRIMARY KEY (`iddetallecompra`),
  ADD KEY `fk_detallecompra_categoria` (`idcategoria`),
  ADD KEY `fk_detallecompra_proveedor` (`idproveedor`),
  ADD KEY `fk_detallecompra_producto` (`idproducto`),
  ADD KEY `fk_detallecompra_compra` (`idcompra`);

--
-- Indices de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD PRIMARY KEY (`iddetalleventa`),
  ADD KEY `fk_detalleventa_venta` (`idventa`),
  ADD KEY `fk_detalleventa_categoria` (`idcategoria`),
  ADD KEY `fk_detalleventa_producto` (`idproducto`);

--
-- Indices de la tabla `preguntasecreta`
--
ALTER TABLE `preguntasecreta`
  ADD PRIMARY KEY (`idpreguntasecreta`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idproducto`),
  ADD KEY `fk_producto_categoria` (`idcategoria`),
  ADD KEY `fk_producto_proveedor` (`idproveedor`),
  ADD KEY `fk_producto_usuario` (`idusuario`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idproveedor`),
  ADD KEY `fk_proveedor_usuario` (`idusuario`);

--
-- Indices de la tabla `tiposusuario`
--
ALTER TABLE `tiposusuario`
  ADD PRIMARY KEY (`idtipousuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_usuario_preguntasecreta` (`idpreguntasecreta`),
  ADD KEY `fk_usuario_tipousuario` (`idtipousuario`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idventa`),
  ADD KEY `fk_venta_usuario` (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idcategoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  MODIFY `iddetallecompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  MODIFY `iddetalleventa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntasecreta`
--
ALTER TABLE `preguntasecreta`
  MODIFY `idpreguntasecreta` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idproducto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idproveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tiposusuario`
--
ALTER TABLE `tiposusuario`
  MODIFY `idtipousuario` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idventa` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `fk_categoria_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_compra_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`),
  ADD CONSTRAINT `fk_compra_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `detallecompra`
--
ALTER TABLE `detallecompra`
  ADD CONSTRAINT `fk_detallecompra_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  ADD CONSTRAINT `fk_detallecompra_compra` FOREIGN KEY (`idcompra`) REFERENCES `compra` (`idcompra`),
  ADD CONSTRAINT `fk_detallecompra_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  ADD CONSTRAINT `fk_detallecompra_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`);

--
-- Filtros para la tabla `detalleventa`
--
ALTER TABLE `detalleventa`
  ADD CONSTRAINT `fk_detalleventa_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  ADD CONSTRAINT `fk_detalleventa_producto` FOREIGN KEY (`idproducto`) REFERENCES `producto` (`idproducto`),
  ADD CONSTRAINT `fk_detalleventa_venta` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idventa`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`),
  ADD CONSTRAINT `fk_producto_proveedor` FOREIGN KEY (`idproveedor`) REFERENCES `proveedor` (`idproveedor`),
  ADD CONSTRAINT `fk_producto_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedor_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_preguntasecreta` FOREIGN KEY (`idpreguntasecreta`) REFERENCES `preguntasecreta` (`idpreguntasecreta`),
  ADD CONSTRAINT `fk_usuario_tipousuario` FOREIGN KEY (`idtipousuario`) REFERENCES `tiposusuario` (`idtipousuario`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
