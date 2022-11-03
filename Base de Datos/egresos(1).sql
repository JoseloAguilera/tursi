-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2022 a las 00:55:26
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_tursi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `id_egreso` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cuenta_contable` int(100) NOT NULL,
  `proveedor` int(11) NOT NULL DEFAULT 0,
  `concepto` varchar(150) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `nro_comprobante` varchar(50) NOT NULL DEFAULT '',
  `medio_pago` varchar(100) NOT NULL DEFAULT '',
  `importe` double NOT NULL DEFAULT 0,
  `fecha_added` datetime NOT NULL DEFAULT current_timestamp(),
  `estado` int(11) NOT NULL DEFAULT 1,
  `users` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`id_egreso`, `fecha`, `cuenta_contable`, `proveedor`, `concepto`, `nro_comprobante`, `medio_pago`, `importe`, `fecha_added`, `estado`, `users`) VALUES
(5, '2022-10-10', 1, 9, 'test2', '1234', 'efectivo', 60000, '2022-10-30 16:40:53', 1, 0),
(6, '1969-12-31', 1, 9, 'test3', '4561', 'efectivo', 40000, '2022-10-30 16:41:16', 1, 0),
(7, '1969-12-31', 1, 9, 't', '15', 'efectivo', 10000, '2022-10-30 16:42:32', 1, 0),
(8, '2022-10-21', 1, 8, 'dasdasds', '000215641', 'efectivo', 154564, '2022-10-30 16:43:51', 1, 0),
(9, '2022-10-23', 1, 7, 'test', '6541', 'efectivo', 23000, '2022-10-31 20:48:32', 1, 0),
(10, '2022-10-19', 1, 7, 'test fechs', '654', 'efectivo', 25000, '2022-10-31 20:49:19', 1, 0),
(11, '2022-10-31', 1, 7, 'test fecha2', '951', 'efectivo', 56000, '2022-10-31 20:49:44', 1, 0),
(12, '2021-10-14', 1, 9, 'test fecha 4', '654123', 'efectivo', 54100, '2022-10-31 20:50:36', 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`id_egreso`),
  ADD KEY `users` (`users`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `id_egreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
