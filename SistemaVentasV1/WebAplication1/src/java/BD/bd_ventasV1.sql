-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-06-2023 a las 10:17:18
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `IdCliente` int(11) UNSIGNED NOT NULL,
  `Dni` varchar(8) DEFAULT NULL,
  `Nombres` varchar(244) DEFAULT NULL,
  `Direccion` varchar(244) DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`IdCliente`, `Dni`, `Nombres`, `Direccion`, `Estado`) VALUES
(17, '2', 'Juan Guerrero Solis', 'Los Alamos', '1'),
(18, '1', 'Maria Rosas Villanueva', 'Los Laureles 234', '1'),
(19, '3', 'Andres de Santa Cruz', 'Av. La Frontera 347', '1'),
(20, '4', 'Andres Mendoza', 'Chosica, Lurigancho', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ventas`
--

CREATE TABLE `detalle_ventas` (
  `IdDetalleVentas` int(11) UNSIGNED NOT NULL,
  `IdVentas` int(11) UNSIGNED NOT NULL,
  `IdProducto` int(11) UNSIGNED NOT NULL,
  `Cantidad` int(11) UNSIGNED DEFAULT NULL,
  `PrecioVenta` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalle_ventas`
--

INSERT INTO `detalle_ventas` (`IdDetalleVentas`, `IdVentas`, `IdProducto`, `Cantidad`, `PrecioVenta`) VALUES
(1, 167, 4, 1, 500),
(2, 168, 4, 1, 500),
(3, 169, 4, 1, 500),
(4, 170, 4, 1, 500),
(5, 170, 4, 1, 500),
(6, 170, 2, 1, 20),
(7, 171, 4, 6, 500),
(8, 171, 7, 5, 22),
(9, 172, 4, 1, 500),
(10, 172, 2, 1, 20),
(11, 173, 4, 1, 500),
(12, 173, 4, 1, 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `IdEmpleado` int(10) UNSIGNED NOT NULL,
  `Dni` varchar(8) NOT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Telefono` varchar(9) DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL,
  `User` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`IdEmpleado`, `Dni`, `Nombres`, `Telefono`, `Estado`, `User`) VALUES
(1, '123', 'Ana Guerrero', '988252459', '1', 'emp01'),
(2, '1234', 'Roman Riquelme', '988252459', '1', 'Jo46'),
(3, '123', 'Palermo Suarez', '453536458', '1', 'Em22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `IdProducto` int(11) UNSIGNED NOT NULL,
  `Nombres` varchar(244) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Stock` int(11) UNSIGNED DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`IdProducto`, `Nombres`, `Precio`, `Stock`, `Estado`) VALUES
(1, 'Teclado Logitech 345 Editado', 150, 99, '1'),
(2, 'Mouse Logitech 567', 20, 96, '1'),
(3, 'Laptop Lenovo Ideapad 520', 800, 100, '1'),
(4, 'HeadPhones Sony M333', 500, 87, '1'),
(7, 'Producto Nuevo w', 22, 30, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `IdVentas` int(11) UNSIGNED NOT NULL,
  `IdCliente` int(11) UNSIGNED NOT NULL,
  `IdEmpleado` int(10) UNSIGNED NOT NULL,
  `NumeroSerie` varchar(244) DEFAULT NULL,
  `FechaVentas` date DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`IdVentas`, `IdCliente`, `IdEmpleado`, `NumeroSerie`, `FechaVentas`, `Monto`, `Estado`) VALUES
(1, 17, 2, '000000010', '2023-06-08', 345, '1'),
(95, 17, 2, '00000011', '2019-06-14', 500, '1'),
(96, 17, 2, '00000012', '2019-06-14', 500, '1'),
(97, 17, 2, '00000013', '2019-06-14', 500, '1'),
(98, 17, 2, '00000014', '2019-06-14', 500, '1'),
(99, 17, 2, '00000015', '2019-06-14', 500, '1'),
(100, 17, 2, '00000016', '2019-06-14', 1500, '1'),
(101, 17, 2, '00000017', '2019-06-14', 1000, '1'),
(102, 17, 2, '00000018', '2019-06-14', 1500, '1'),
(104, 17, 2, '00000019', '2019-06-14', 500, '1'),
(105, 17, 2, '00000020', '2019-06-14', 40, '1'),
(106, 17, 2, '00000021', '2019-06-14', 40, '1'),
(107, 17, 2, '00000022', '2019-06-14', 40, '1'),
(108, 17, 2, '00000023', '2019-06-14', 60, '1'),
(109, 17, 2, '00000024', '2019-06-14', 80, '1'),
(110, 17, 2, '00000025', '2019-06-14', 500, '1'),
(111, 17, 2, '00000025', '2019-06-14', 1000, '1'),
(112, 17, 2, '00000026', '2019-06-14', 500, '1'),
(113, 17, 2, '00000026', '2019-06-14', 520, '1'),
(114, 17, 2, '00000027', '2019-06-14', 500, '1'),
(115, 17, 2, '00000028', '2019-06-14', 20, '1'),
(117, 17, 2, '00000029', '2019-06-14', 20, '1'),
(118, 17, 2, '00000030', '2019-06-14', 20, '1'),
(119, 17, 2, '00000031', '2019-06-14', 20, '1'),
(121, 17, 2, '00000032', '2019-06-14', 500, '1'),
(122, 17, 2, '00000033', '2019-06-14', 1000, '1'),
(123, 17, 2, '00000034', '2019-06-14', 500, '1'),
(124, 17, 2, '00000035', '2019-06-14', 500, '1'),
(125, 17, 2, '00000036', '2019-06-14', 1000, '1'),
(126, 17, 2, '00000037', '2019-06-14', 500, '1'),
(127, 17, 2, '00000038', '2019-06-14', 1000, '1'),
(128, 17, 2, '00000039', '2019-06-14', 500, '1'),
(129, 17, 2, '00000039', '2019-06-14', 520, '1'),
(130, 17, 2, '00000040', '2019-06-14', 500, '1'),
(131, 17, 2, '00000041', '2019-06-14', 500, '1'),
(132, 17, 2, '00000042', '2019-06-14', 20, '1'),
(133, 17, 2, '00000043', '2019-06-14', 500, '1'),
(134, 17, 2, '00000044', '2019-06-14', 500, '1'),
(135, 17, 2, '00000045', '2019-06-14', 520, '1'),
(136, 17, 2, '00000046', '2019-06-14', 20, '1'),
(137, 17, 2, '00000047', '2019-06-14', 40, '1'),
(138, 17, 2, '00000048', '2019-06-14', 20, '1'),
(139, 17, 2, '00000049', '2019-06-14', 20, '1'),
(140, 17, 2, '00000050', '2019-06-14', 40, '1'),
(141, 17, 2, '00000051', '2019-06-14', 20, '1'),
(142, 17, 2, '00000052', '2019-06-14', 500, '1'),
(143, 17, 2, '00000053', '2019-06-14', 20, '1'),
(145, 17, 2, '00000054', '2019-06-14', 500, '1'),
(146, 17, 2, '00000054', '2019-06-14', 500, '1'),
(147, 17, 2, '00000055', '2019-06-14', 20, '1'),
(148, 17, 2, '00000055', '2019-06-14', 500, '1'),
(149, 17, 2, '00000055', '2019-06-14', 20, '1'),
(150, 17, 2, '00000055', '2019-06-14', 1000, '1'),
(151, 17, 2, '00000056', '2019-06-14', 800, '1'),
(152, 17, 2, NULL, '2019-06-14', 20, '1'),
(153, 17, 2, '00000057', '2019-06-14', 60, '1'),
(154, 17, 2, '00000058', '2019-06-14', 20, '1'),
(155, 17, 2, '00000059', '2019-06-14', 20, '1'),
(156, 17, 1, '00000060', '2019-06-14', 20, '1'),
(157, 17, 1, '00000061', '2019-06-14', 500, '1'),
(158, 17, 1, '00000062', '2019-06-14', 1500, '1'),
(159, 17, 1, '00000063', '2019-06-14', 1000, '1'),
(160, 17, 1, '00000064', '2019-06-14', 500, '1'),
(161, 17, 1, '00000065', '2019-06-14', 500, '1'),
(162, 17, 1, '00000066', '2019-06-14', 20, '1'),
(163, 17, 1, '00000067', '2019-06-14', 20, '1'),
(164, 17, 1, '00000068', '2019-06-14', 150, '1'),
(165, 17, 1, '00000069', '2019-06-14', 20, '1'),
(166, 17, 1, '00000070', '2019-06-14', 20, '1'),
(167, 17, 1, '00000071', '2019-06-14', 500, '1'),
(168, 17, 1, '00000072', '2019-06-14', 500, '1'),
(169, 20, 1, NULL, '2019-06-14', 500, '1'),
(170, 17, 1, '00000073', '2019-06-14', 1020, '1'),
(171, 17, 1, '00000073', '2019-06-14', 3110, '1'),
(172, 17, 1, '00000074', '2019-06-14', 520, '1'),
(173, 17, 1, '00000075', '2019-06-14', 1000, '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD PRIMARY KEY (`IdDetalleVentas`,`IdVentas`,`IdProducto`),
  ADD KEY `Ventas_has_Producto_FKIndex1` (`IdVentas`),
  ADD KEY `Ventas_has_Producto_FKIndex2` (`IdProducto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`IdEmpleado`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`IdProducto`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`IdVentas`),
  ADD KEY `Ventas_FKIndex1` (`IdEmpleado`),
  ADD KEY `Ventas_FKIndex2` (`IdCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `IdCliente` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  MODIFY `IdDetalleVentas` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `IdEmpleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `IdProducto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `IdVentas` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_ventas`
--
ALTER TABLE `detalle_ventas`
  ADD CONSTRAINT `detalle_ventas_ibfk_1` FOREIGN KEY (`IdVentas`) REFERENCES `ventas` (`IdVentas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_ventas_ibfk_2` FOREIGN KEY (`IdProducto`) REFERENCES `producto` (`IdProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`IdEmpleado`) REFERENCES `empleado` (`IdEmpleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
