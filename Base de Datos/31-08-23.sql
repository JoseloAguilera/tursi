-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.21 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para bd_tursi
CREATE DATABASE IF NOT EXISTS `bd_tursi` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_tursi`;

-- Volcando estructura para tabla bd_tursi.caja_chica
CREATE TABLE IF NOT EXISTS `caja_chica` (
  `id_caja` int NOT NULL AUTO_INCREMENT,
  `referencia_caja` varchar(255) NOT NULL,
  `monto_caja` double NOT NULL,
  `descripcion_caja` varchar(255) NOT NULL,
  `tipo_caja` tinyint NOT NULL,
  `users_caja` int NOT NULL,
  `date_added_caja` datetime NOT NULL,
  PRIMARY KEY (`id_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.caja_chica: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_tursi.cargo
CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nombre_cargo` varchar(255) NOT NULL,
  `estado_cargo` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.cargo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_tursi.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(255) NOT NULL,
  `fiscal_cliente` varchar(255) NOT NULL,
  `telefono_cliente` char(30) NOT NULL,
  `email_cliente` varchar(64) NOT NULL,
  `direccion_cliente` varchar(255) NOT NULL,
  `status_cliente` tinyint NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.clientes: 2 rows
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `fiscal_cliente`, `telefono_cliente`, `email_cliente`, `direccion_cliente`, `status_cliente`, `date_added`) VALUES
	(12, 'JOSE AGUILERA', '5971557-0', '5451', 'ASDASDA@OSDHNCOASN.COM', 'ASDASDS', 1, '2022-10-19 07:34:54'),
	(13, 'Luz Yanina ', '4664205', '0973152516', 'joseaguilera1709@gmail.com', 'Av Pablo Neruda', 1, '2022-11-27 18:16:22');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.comprobantes
CREATE TABLE IF NOT EXISTS `comprobantes` (
  `id_comp` int NOT NULL AUTO_INCREMENT,
  `nombre_comp` varchar(100) NOT NULL,
  `serie_comp` varchar(100) NOT NULL,
  `desde_comp` int NOT NULL,
  `hasta_comp` int NOT NULL,
  `long_comp` int NOT NULL,
  `actual_comp` int NOT NULL,
  `vencimiento_comp` date NOT NULL,
  `estado_comp` int NOT NULL,
  PRIMARY KEY (`id_comp`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.comprobantes: ~1 rows (aproximadamente)
INSERT INTO `comprobantes` (`id_comp`, `nombre_comp`, `serie_comp`, `desde_comp`, `hasta_comp`, `long_comp`, `actual_comp`, `vencimiento_comp`, `estado_comp`) VALUES
	(3, 'PRUEBA', '001-001-', 0, 99999999, 15, 0, '2022-10-19', 1);

-- Volcando estructura para tabla bd_tursi.cotizaciones
CREATE TABLE IF NOT EXISTS `cotizaciones` (
  `id_presupuesto` int NOT NULL AUTO_INCREMENT,
  `numero_presupuesto` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_cliente` int NOT NULL,
  `id_users_factura` int NOT NULL,
  PRIMARY KEY (`id_presupuesto`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.cotizaciones: 57 rows
/*!40000 ALTER TABLE `cotizaciones` DISABLE KEYS */;
INSERT INTO `cotizaciones` (`id_presupuesto`, `numero_presupuesto`, `id_cliente`, `id_users_factura`) VALUES
	(1, 'COT-000001', 12, 1),
	(10, 'COT-000002', 12, 1),
	(11, 'COT-000003', 13, 1),
	(12, 'COT-000004', 13, 1),
	(13, 'COT-000005', 13, 1),
	(14, 'COT-000006', 13, 1),
	(15, 'COT-000007', 12, 1),
	(16, 'COT-000008', 12, 1),
	(17, 'COT-000009', 12, 1),
	(18, 'COT-000010', 12, 1),
	(19, 'COT-000011', 12, 1),
	(20, 'COT-000012', 13, 1),
	(21, 'COT-000013', 12, 1),
	(22, 'COT-000014', 13, 1),
	(23, 'COT-000015', 12, 1),
	(24, 'COT-000016', 12, 1),
	(25, 'COT-000017', 12, 1),
	(26, 'COT-000018', 12, 1),
	(27, 'COT-000019', 12, 1),
	(28, 'COT-000020', 12, 1),
	(29, 'COT-000021', 12, 1),
	(30, 'COT-000022', 12, 1),
	(31, 'COT-000023', 13, 1),
	(32, 'COT-000024', 12, 1),
	(33, 'COT-000025', 13, 1),
	(34, 'COT-000026', 12, 1),
	(35, 'COT-000027', 13, 1),
	(36, 'COT-000028', 13, 1),
	(37, 'COT-000029', 13, 1),
	(38, 'COT-000030', 12, 1),
	(39, 'COT-000031', 12, 1),
	(40, 'COT-000032', 12, 1),
	(41, 'COT-000033', 12, 1),
	(42, 'COT-000034', 13, 1),
	(43, 'COT-000035', 13, 1),
	(44, 'COT-000036', 13, 1),
	(45, 'COT-000037', 12, 1),
	(46, 'COT-000038', 13, 1),
	(47, 'COT-000039', 13, 1),
	(48, 'COT-000040', 12, 1),
	(49, 'COT-000041', 12, 1),
	(50, 'COT-000042', 12, 1),
	(51, 'COT-000043', 13, 1),
	(52, 'COT-000044', 13, 1),
	(53, 'COT-000045', 12, 1),
	(54, 'COT-000046', 12, 1),
	(55, 'COT-000047', 12, 1),
	(56, 'COT-000048', 12, 1),
	(57, 'COT-000049', 12, 1),
	(58, 'COT-000050', 12, 1),
	(59, 'COT-000051', 13, 1),
	(60, 'COT-000052', 12, 1),
	(61, 'COT-000053', 12, 1),
	(62, 'COT-000054', 12, 1),
	(63, 'COT-000055', 12, 1),
	(64, 'COT-000056', 12, 1),
	(65, 'COT-000057', 12, 1);
/*!40000 ALTER TABLE `cotizaciones` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.creditos
CREATE TABLE IF NOT EXISTS `creditos` (
  `id_credito` int NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(20) NOT NULL,
  `fecha_credito` datetime NOT NULL,
  `id_cliente` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `monto_credito` double NOT NULL,
  `saldo_credito` double NOT NULL,
  `estado_credito` tinyint(1) NOT NULL,
  `id_users_credito` int NOT NULL,
  `id_sucursal` int NOT NULL,
  PRIMARY KEY (`id_credito`),
  UNIQUE KEY `numero_cotizacion` (`numero_factura`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.creditos: 1 rows
/*!40000 ALTER TABLE `creditos` DISABLE KEYS */;
INSERT INTO `creditos` (`id_credito`, `numero_factura`, `fecha_credito`, `id_cliente`, `id_vendedor`, `monto_credito`, `saldo_credito`, `estado_credito`, `id_users_credito`, `id_sucursal`) VALUES
	(29, '001-001-000000000000', '2022-10-19 07:35:03', 12, 1, 22000, 22000, 1, 1, 1);
/*!40000 ALTER TABLE `creditos` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.creditos_abonos
CREATE TABLE IF NOT EXISTS `creditos_abonos` (
  `id_abono` int NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(20) NOT NULL,
  `fecha_abono` datetime NOT NULL,
  `id_cliente` int NOT NULL,
  `monto_abono` double NOT NULL,
  `abono` double NOT NULL,
  `saldo_abono` double NOT NULL,
  `id_users_abono` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `concepto_abono` varchar(255) NOT NULL,
  `id_credito` int NOT NULL,
  `estado` int NOT NULL,
  PRIMARY KEY (`id_abono`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.creditos_abonos: 0 rows
/*!40000 ALTER TABLE `creditos_abonos` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditos_abonos` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.creditos_abonos_prov
CREATE TABLE IF NOT EXISTS `creditos_abonos_prov` (
  `id_abono` int NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(20) NOT NULL,
  `fecha_abono` datetime NOT NULL,
  `id_proveedor` int NOT NULL,
  `monto_abono` double NOT NULL,
  `abono` double NOT NULL,
  `saldo_abono` double NOT NULL,
  `id_users_abono` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `concepto_abono` varchar(255) NOT NULL,
  PRIMARY KEY (`id_abono`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.creditos_abonos_prov: 0 rows
/*!40000 ALTER TABLE `creditos_abonos_prov` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditos_abonos_prov` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.credito_proveedor
CREATE TABLE IF NOT EXISTS `credito_proveedor` (
  `id_credito` int NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(20) NOT NULL,
  `fecha_credito` datetime NOT NULL,
  `id_proveedor` int NOT NULL,
  `monto_credito` double NOT NULL,
  `saldo_credito` double NOT NULL,
  `estado_credito` tinyint(1) NOT NULL,
  `id_users_credito` int NOT NULL,
  `id_sucursal` int NOT NULL,
  PRIMARY KEY (`id_credito`),
  UNIQUE KEY `numero_cotizacion` (`numero_factura`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.credito_proveedor: 0 rows
/*!40000 ALTER TABLE `credito_proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito_proveedor` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.currencies
CREATE TABLE IF NOT EXISTS `currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `symbol` varchar(255) NOT NULL,
  `precision` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `thousand_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `decimal_separator` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.currencies: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_tursi.detalle_fact_alquileres
CREATE TABLE IF NOT EXISTS `detalle_fact_alquileres` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_factura` int NOT NULL,
  `numero_factura` varchar(25) NOT NULL,
  `id_producto` int NOT NULL,
  `jornadas` int DEFAULT NULL,
  `cantidad` int NOT NULL,
  `desc_venta` int NOT NULL,
  `precio_venta` double NOT NULL,
  `importe_venta` double NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `numero_cotizacion` (`numero_factura`,`id_producto`),
  KEY `id_factura` (`id_factura`),
  KEY `numero_factura` (`numero_factura`)
) ENGINE=MyISAM AUTO_INCREMENT=145 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.detalle_fact_alquileres: 0 rows
/*!40000 ALTER TABLE `detalle_fact_alquileres` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_fact_alquileres` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.detalle_fact_compra
CREATE TABLE IF NOT EXISTS `detalle_fact_compra` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_factura` int NOT NULL,
  `numero_factura` varchar(50) NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` double NOT NULL,
  `precio_costo` double NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `numero_cotizacion` (`numero_factura`,`id_producto`),
  KEY `id_factura` (`id_factura`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.detalle_fact_compra: 3 rows
/*!40000 ALTER TABLE `detalle_fact_compra` DISABLE KEYS */;
INSERT INTO `detalle_fact_compra` (`id_detalle`, `id_factura`, `numero_factura`, `id_producto`, `cantidad`, `precio_costo`) VALUES
	(20, 1, 'FC-000001', 35, 2, 10000),
	(21, 15, 'FC-000002', 41, 2, 500000),
	(22, 16, 'FC-000003', 35, 4, 50000);
/*!40000 ALTER TABLE `detalle_fact_compra` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.detalle_fact_cot
CREATE TABLE IF NOT EXISTS `detalle_fact_cot` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_version` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `jornada` int NOT NULL,
  `desc_venta` int NOT NULL,
  `precio_venta` double NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `numero_cotizacion` (`id_producto`)
) ENGINE=MyISAM AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.detalle_fact_cot: 104 rows
/*!40000 ALTER TABLE `detalle_fact_cot` DISABLE KEYS */;
INSERT INTO `detalle_fact_cot` (`id_detalle`, `id_version`, `id_producto`, `cantidad`, `jornada`, `desc_venta`, `precio_venta`) VALUES
	(20, 1, 35, 1, 1, 0, 11000),
	(22, 1, 41, 1, 1, 0, 50000),
	(23, 1, 41, 1, 1, 0, 50000),
	(24, 12, 35, 1, 1, 0, 10000),
	(25, 13, 37, 1, 1, 0, 10000),
	(26, 14, 41, 2, 1, 0, 50000),
	(27, 14, 40, 2, 1, 0, 25000),
	(28, 27, 41, 2, 1, 0, 50000),
	(29, 27, 40, 2, 1, 0, 25000),
	(30, 2, 41, 2, 1, 0, 50000),
	(31, 30, 41, 2, 1, 0, 50000),
	(32, 25, 35, 2, 2, 0, 10000),
	(33, 25, 36, 2, 2, 0, 20000),
	(34, 25, 39, 2, 2, 0, 25000),
	(35, 26, 37, 1, 1, 0, 10000),
	(36, 26, 38, 1, 1, 0, 100000),
	(37, 26, 36, 1, 1, 0, 20000),
	(38, 27, 36, 6, 6, 0, 20000),
	(39, 27, 35, 26, 26, 0, 10000),
	(40, 27, 37, 3, 3, 0, 10000),
	(41, 27, 38, 3, 3, 0, 100000),
	(42, 27, 36, 2, 2, 0, 20000),
	(43, 42, 41, 2, 1, 0, 50000),
	(44, 42, 40, 2, 1, 0, 25000),
	(45, 42, 36, 6, 6, 0, 20000),
	(46, 42, 35, 26, 26, 0, 10000),
	(47, 42, 37, 3, 3, 0, 10000),
	(48, 42, 38, 3, 3, 0, 100000),
	(49, 42, 36, 2, 2, 0, 20000),
	(50, 29, 39, 1, 1, 0, 25000),
	(51, 29, 38, 1, 1, 0, 100000),
	(52, 29, 35, 1, 1, 0, 10000),
	(53, 30, 35, 2, 2, 0, 10000),
	(54, 31, 35, 3, 3, 0, 10000),
	(55, 32, 38, 1, 1, 0, 100000),
	(56, 32, 37, 1, 1, 0, 10000),
	(57, 32, 36, 1, 1, 0, 20000),
	(58, 32, 35, 1, 1, 0, 10000),
	(59, 34, 39, 1, 1, 0, 25000),
	(60, 34, 38, 1, 1, 0, 100000),
	(61, 34, 37, 1, 1, 0, 10000),
	(62, 34, 36, 1, 1, 0, 20000),
	(63, 34, 35, 1, 1, 0, 10000),
	(64, 63, 39, 1, 1, 0, 25000),
	(65, 63, 38, 1, 1, 0, 100000),
	(66, 63, 37, 1, 1, 0, 10000),
	(67, 63, 36, 1, 1, 0, 20000),
	(68, 63, 35, 1, 1, 0, 10000),
	(69, 36, 36, 2, 2, 0, 20000),
	(71, 37, 36, 4, 1, 0, 20000),
	(72, 71, 36, 4, 1, 0, 20000),
	(73, 39, 36, 10, 1, 0, 50000),
	(74, 73, 36, 10, 1, 0, 50000),
	(75, 41, 36, 2, 1, 0, 20000),
	(76, 75, 36, 2, 1, 0, 20000),
	(77, 43, 36, 1, 1, 0, 20000),
	(78, 77, 36, 1, 1, 0, 20000),
	(79, 51, 36, 2, 1, 0, 20000),
	(80, 54, 36, 1, 1, 0, 20000),
	(81, 80, 36, 1, 1, 0, 20000),
	(82, 56, 36, 2, 1, 0, 20000),
	(83, 59, 38, 2, 1, 0, 100000),
	(84, 61, 39, 1, 1, 0, 25000),
	(85, 2, 39, 1, 1, 0, 25000),
	(86, 63, 35, 2, 1, 0, 10000),
	(87, 64, 35, 1, 1, 0, 10000),
	(88, 65, 35, 1, 1, 0, 10000),
	(89, 66, 35, 6, 20, 0, 10000),
	(90, 66, 36, 6, 5, 0, 20000),
	(91, 67, 35, 6, 20, 0, 10000),
	(92, 67, 36, 6, 5, 0, 20000),
	(93, 68, 35, 5, 1, 0, 10000),
	(94, 69, 35, 3, 1, 0, 10000),
	(95, 69, 36, 1, 1, 0, 20000),
	(96, 70, 35, 3, 1, 0, 10000),
	(97, 70, 36, 1, 1, 0, 20000),
	(98, 71, 36, 3, 1, 0, 20000),
	(99, 72, 35, 1, 1, 0, 10000),
	(100, 73, 35, 2, 1, 0, 10000),
	(101, 74, 36, 3, 1, 0, 20000),
	(102, 75, 38, 3, 1, 0, 100000),
	(103, 76, 38, 4, 1, 0, 100000),
	(104, 76, 39, 2, 1, 0, 25000),
	(105, 77, 36, 4, 1, 0, 20000),
	(106, 77, 35, 1, 1, 0, 10000),
	(107, 78, 37, 1, 1, 0, 10000),
	(108, 78, 36, 2, 1, 0, 20000),
	(109, 79, 35, 1, 1, 0, 10000),
	(110, 80, 35, 3, 1, 0, 10000),
	(111, 81, 36, 2, 1, 0, 20000),
	(112, 82, 36, 4, 1, 0, 20000),
	(113, 83, 35, 2, 1, 0, 10000),
	(114, 84, 35, 4, 1, 0, 10000),
	(115, 85, 35, 2, 1, 0, 10000),
	(116, 85, 35, 3, 1, 0, 10000),
	(117, 85, 35, 1, 1, 0, 10000),
	(118, 86, 35, 2, 1, 0, 10000),
	(119, 86, 35, 2, 1, 0, 10000),
	(120, 86, 35, 2, 1, 0, 10000),
	(121, 87, 35, 3, 1, 0, 10000),
	(122, 88, 36, 2, 1, 0, 20000),
	(123, 89, 39, 1, 1, 0, 25000),
	(124, 89, 38, 1, 1, 0, 100000),
	(125, 89, 36, 1, 1, 0, 20000);
/*!40000 ALTER TABLE `detalle_fact_cot` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.detalle_fact_ventas
CREATE TABLE IF NOT EXISTS `detalle_fact_ventas` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_factura` int NOT NULL,
  `numero_factura` varchar(25) NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `desc_venta` int NOT NULL,
  `precio_venta` double NOT NULL,
  `importe_venta` double NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `numero_cotizacion` (`numero_factura`,`id_producto`),
  KEY `id_factura` (`id_factura`),
  KEY `numero_factura` (`numero_factura`)
) ENGINE=MyISAM AUTO_INCREMENT=146 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.detalle_fact_ventas: 1 rows
/*!40000 ALTER TABLE `detalle_fact_ventas` DISABLE KEYS */;
INSERT INTO `detalle_fact_ventas` (`id_detalle`, `id_factura`, `numero_factura`, `id_producto`, `cantidad`, `desc_venta`, `precio_venta`, `importe_venta`) VALUES
	(145, 1, '001-001-000000000000000', 35, 2, 0, 11000, 22000);
/*!40000 ALTER TABLE `detalle_fact_ventas` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.detalle_traslado
CREATE TABLE IF NOT EXISTS `detalle_traslado` (
  `id_detalle_traslado` int NOT NULL AUTO_INCREMENT,
  `id_traslado` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_venta` double NOT NULL,
  `num_transaccion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_detalle_traslado`),
  KEY `id_traslado` (`id_traslado`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.detalle_traslado: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_tursi.egresos
CREATE TABLE IF NOT EXISTS `egresos` (
  `id_egreso` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `cuenta_contable` int NOT NULL,
  `proveedor` int NOT NULL DEFAULT '0',
  `concepto` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `nro_comprobante` varchar(50) NOT NULL DEFAULT '',
  `medio_pago` varchar(100) NOT NULL DEFAULT '',
  `importe` double NOT NULL DEFAULT '0',
  `fecha_added` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` int NOT NULL DEFAULT '1',
  `users` int NOT NULL,
  PRIMARY KEY (`id_egreso`),
  KEY `users` (`users`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.egresos: ~8 rows (aproximadamente)
INSERT INTO `egresos` (`id_egreso`, `fecha`, `cuenta_contable`, `proveedor`, `concepto`, `nro_comprobante`, `medio_pago`, `importe`, `fecha_added`, `estado`, `users`) VALUES
	(5, '2022-10-10', 1, 9, 'test2', '1234', 'efectivo', 60000, '2022-10-30 16:40:53', 1, 0),
	(6, '1969-12-31', 1, 9, 'test3', '4561', 'efectivo', 40000, '2022-10-30 16:41:16', 1, 0),
	(7, '1969-12-31', 1, 9, 't', '15', 'efectivo', 10000, '2022-10-30 16:42:32', 0, 0),
	(8, '2022-10-21', 1, 8, 'dasdasds', '000215641', 'efectivo', 154564, '2022-10-30 16:43:51', 0, 0),
	(9, '2022-10-23', 1, 7, 'test', '6541', 'efectivo', 23000, '2022-10-31 20:48:32', 0, 0),
	(10, '2022-10-19', 1, 7, 'test fechs', '654', 'efectivo', 25000, '2022-10-31 20:49:19', 1, 0),
	(11, '2022-10-31', 1, 7, 'test fecha2', '951', 'efectivo', 56000, '2022-10-31 20:49:44', 1, 0),
	(12, '2021-10-14', 1, 9, 'test fecha 4', '654123', 'efectivo', 54100, '2022-10-31 20:50:36', 1, 0);

-- Volcando estructura para tabla bd_tursi.facturas_alquileres
CREATE TABLE IF NOT EXISTS `facturas_alquileres` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(20) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `id_cliente` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `condiciones` varchar(30) NOT NULL,
  `monto_factura` double NOT NULL,
  `estado_factura` tinyint(1) NOT NULL,
  `id_users_factura` int NOT NULL,
  `dinero_resibido_fac` double NOT NULL,
  `id_sucursal` int NOT NULL,
  `id_comp_factura` int NOT NULL,
  `num_trans_factura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `numero_cotizacion` (`numero_factura`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.facturas_alquileres: 0 rows
/*!40000 ALTER TABLE `facturas_alquileres` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas_alquileres` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.facturas_compras
CREATE TABLE IF NOT EXISTS `facturas_compras` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(50) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `condiciones` int NOT NULL,
  `monto_factura` double NOT NULL,
  `estado_factura` tinyint NOT NULL,
  `id_users_factura` int NOT NULL,
  `id_sucursal` int NOT NULL,
  `ref_factura` varchar(50) NOT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `numero_cotizacion` (`numero_factura`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_vendedor` (`id_vendedor`),
  KEY `id_users_factura` (`id_users_factura`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.facturas_compras: 3 rows
/*!40000 ALTER TABLE `facturas_compras` DISABLE KEYS */;
INSERT INTO `facturas_compras` (`id_factura`, `numero_factura`, `fecha_factura`, `id_proveedor`, `id_vendedor`, `condiciones`, `monto_factura`, `estado_factura`, `id_users_factura`, `id_sucursal`, `ref_factura`) VALUES
	(14, 'FC-000001', '2023-09-17 00:00:00', 7, 1, 1, 20000, 1, 1, 1, '05522'),
	(15, 'FC-000002', '2022-11-28 00:00:00', 7, 1, 3, 1000000, 1, 1, 1, 'asdasda'),
	(16, 'FC-000003', '2023-01-04 00:00:00', 7, 1, 1, 200000, 1, 1, 1, 'compra de amazon');
/*!40000 ALTER TABLE `facturas_compras` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.facturas_cot
CREATE TABLE IF NOT EXISTS `facturas_cot` (
  `id_version` int NOT NULL AUTO_INCREMENT,
  `id_presupuesto` int NOT NULL DEFAULT '0',
  `fecha_version` date DEFAULT NULL,
  `fecha_reserva` date DEFAULT NULL,
  `condiciones` int NOT NULL DEFAULT '0',
  `monto_factura` double NOT NULL,
  `version` int DEFAULT NULL,
  `validez` int DEFAULT NULL,
  `user` int NOT NULL DEFAULT '0',
  `confirmado` int DEFAULT '0',
  `id_cliente` int DEFAULT NULL,
  `pie1` varchar(200) DEFAULT NULL,
  `pie2` varchar(200) DEFAULT NULL,
  `pie3` varchar(200) DEFAULT NULL,
  `obs` varchar(200) DEFAULT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  PRIMARY KEY (`id_version`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.facturas_cot: ~82 rows (aproximadamente)
INSERT INTO `facturas_cot` (`id_version`, `id_presupuesto`, `fecha_version`, `fecha_reserva`, `condiciones`, `monto_factura`, `version`, `validez`, `user`, `confirmado`, `id_cliente`, `pie1`, `pie2`, `pie3`, `obs`, `fecha_modificacion`) VALUES
	(1, 1, '2022-12-16', NULL, 1, 25000, 1, 4, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(2, 1, '2022-12-16', NULL, 4, 25000, 2, 4, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(10, 10, '2022-12-16', NULL, 4, 50000, 1, 4, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(11, 12, '2022-12-16', NULL, 1, 50000, 1, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(12, 14, '2022-12-16', NULL, 1, 10000, 1, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(13, 15, '2022-12-16', '2022-12-16', 4, 10000, 1, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(14, 16, '2022-12-16', NULL, 1, 100000, 1, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(15, 17, '2022-12-10', '2022-12-23', 1, 150000, 1, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(16, 17, '2022-12-16', '2022-12-23', 1, 250000, 2, 1, 2, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(17, 12, '0000-00-00', NULL, 1, 50000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(18, 12, '2022-12-29', NULL, 1, 50000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(19, 18, '2022-12-29', '2023-01-01', 1, 33000, 1, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(20, 14, '2022-12-29', NULL, 1, 10000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(21, 14, '2022-12-29', NULL, 1, 10000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(22, 14, '2022-12-29', NULL, 1, 10000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(23, 1, '2022-12-29', NULL, 4, 25000, 3, 4, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(24, 1, '2022-12-29', NULL, 4, 25000, 4, 4, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(25, 19, '2022-12-30', '0000-00-00', 1, 220000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', '', '', '', NULL),
	(26, 20, '2022-12-30', '2023-01-10', 4, 130000, 1, 4, 1, 0, 13, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', '', '', 'asdasdasd', NULL),
	(27, 22, '2022-12-30', '0000-00-00', 1, 1070000, 1, 1, 1, 0, 13, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'asdadasd', '2022-12-30'),
	(28, 22, '2022-12-30', NULL, 1, 1070000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(29, 23, '2022-12-30', '0000-00-00', 1, 135000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'asdasds', '2022-12-30'),
	(30, 24, '2022-12-30', '0000-00-00', 1, 40000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', '', '', '2022-12-30'),
	(31, 25, '2022-12-30', '0000-00-00', 1, 90000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'asadsd', '2022-12-30'),
	(32, 23, '2022-12-30', '0000-00-00', 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(33, 23, '2022-12-30', NULL, 1, 250000, 3, 4, 1, 0, NULL, NULL, NULL, NULL, NULL, '2022-12-30'),
	(34, 27, '2022-12-30', '0000-00-00', 1, 165000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'asdasdsa', '2022-12-30'),
	(35, 27, '2022-12-30', NULL, 1, 165000, 2, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(36, 28, '2022-12-30', '0000-00-00', 1, 120000, 1, 4, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'adasda', '2022-12-30'),
	(37, 29, '2023-01-06', '0000-00-00', 1, 80000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', '', 'ASDDASDasdasd', '2023-01-06'),
	(38, 29, '2023-01-06', NULL, 1, 80000, 2, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(39, 30, '2023-01-06', '0000-00-00', 1, 500000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'ASDASD', '2023-01-06'),
	(40, 30, '2023-01-06', NULL, 1, 500000, 2, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(41, 31, '2023-01-06', '0000-00-00', 1, 40000, 1, 1, 1, 0, 13, '', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'asdas', '2023-01-06'),
	(42, 31, '2023-01-06', NULL, 1, 40000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(43, 32, '2023-01-06', '0000-00-00', 1, 20000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'asdasds', '2023-01-06'),
	(44, 32, '2023-01-06', NULL, 1, 20000, 2, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(45, 32, '2023-01-06', NULL, 1, 20000, 3, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(46, 32, '2023-01-06', NULL, 1, 20000, 4, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(47, 32, '2023-01-06', NULL, 1, 20000, 5, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(48, 32, '2023-01-06', NULL, 1, 20000, 6, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(49, 32, '2023-01-06', NULL, 1, 20000, 7, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(50, 32, '2023-01-06', NULL, 1, 20000, 8, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(51, 33, '2023-01-06', '0000-00-00', 1, 40000, 1, 1, 1, 0, 13, '', '', '', '', '2023-01-06'),
	(52, 33, '2023-01-06', NULL, 1, 40000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(53, 33, '2023-01-06', NULL, 1, 40000, 3, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(54, 34, '2023-01-06', '0000-00-00', 1, 20000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', '', '', '2023-01-06'),
	(55, 34, '2023-01-06', NULL, 1, 20000, 2, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(56, 35, '2023-01-06', '0000-00-00', 1, 40000, 1, 1, 1, 0, 13, '', '', '', '', '2023-01-06'),
	(57, 35, '2023-01-06', NULL, 1, 40000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(58, 35, '2023-01-06', NULL, 1, 40000, 3, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(59, 36, '2023-01-06', '0000-00-00', 1, 200000, 1, 1, 1, 0, 13, '', '', '', '', '2023-01-06'),
	(60, 36, '2023-01-06', NULL, 1, 200000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(61, 37, '2023-01-06', '0000-00-00', 1, 25000, 1, 1, 1, 0, 13, '', '', '', '', '2023-01-06'),
	(62, 37, '2023-01-06', NULL, 1, 25000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(63, 38, '2023-01-06', '0000-00-00', 1, 20000, 1, 1, 1, 0, 12, '', '', '', '', '2023-01-06'),
	(64, 39, '2023-01-06', '0000-00-00', 1, 10000, 1, 1, 1, 0, 12, '', '', '', '', '2023-01-06'),
	(65, 39, '2023-01-06', NULL, 1, 10000, 2, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(66, 40, '2023-01-16', '0000-00-00', 1, 1800000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'asdasd', '2023-01-16'),
	(67, 40, '2023-01-16', NULL, 1, 1800000, 2, 1, 1, 0, 12, NULL, NULL, NULL, NULL, NULL),
	(68, 41, '2023-02-12', '0000-00-00', 1, 50000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', '', '2023-02-12'),
	(69, 42, '2023-02-12', '0000-00-00', 1, 50000, 1, 1, 1, 0, 13, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'asdadasdasd', '2023-02-12'),
	(70, 42, '2023-02-12', NULL, 1, 50000, 2, 1, 1, 0, 13, NULL, NULL, NULL, NULL, NULL),
	(71, 43, '2023-02-12', '0000-00-00', 1, 60000, 1, 1, 1, 0, 13, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', '', '', '', '2023-02-12'),
	(72, 44, '2023-02-12', '0000-00-00', 1, 10000, 1, 1, 1, 0, 13, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', '', '', '2023-02-12'),
	(73, 45, '2023-02-12', '0000-00-00', 1, 20000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', '', '', '2023-02-12'),
	(74, 46, '2023-02-13', '0000-00-00', 1, 60000, 1, 1, 1, 0, 13, '', '', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', '', '2023-02-13'),
	(75, 47, '2023-02-13', '0000-00-00', 1, 300000, 1, 1, 1, 0, 13, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', '', '', '2023-02-13'),
	(76, 48, '2023-02-13', '0000-00-00', 1, 450000, 1, 1, 1, 0, 12, '', '', '', '', '2023-02-13'),
	(77, 49, '2023-02-13', '0000-00-00', 1, 90000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', '', '2023-02-13'),
	(78, 50, '2023-02-13', '0000-00-00', 1, 50000, 1, 1, 1, 0, 12, '', '', '', '', '2023-02-13'),
	(79, 51, '2023-02-13', '0000-00-00', 1, 10000, 1, 1, 1, 0, 13, '', '', '', '', '2023-02-13'),
	(80, 52, '2023-02-13', '0000-00-00', 1, 30000, 1, 1, 1, 0, 13, '', '', '', '', '2023-02-13'),
	(81, 53, '2023-02-13', '0000-00-00', 1, 40000, 1, 1, 1, 0, 12, '', '', '', '', '2023-02-13'),
	(82, 54, '2023-03-13', '0000-00-00', 1, 80000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', '', '', '2023-03-13'),
	(83, 55, '2023-03-13', '0000-00-00', 1, 20000, 1, 1, 1, 0, 12, '', '', '', '', '2023-03-13'),
	(84, 56, '2023-03-13', '0000-00-00', 1, 40000, 1, 1, 1, 0, 12, '', '', '', '', '2023-03-13'),
	(85, 59, '2023-03-21', '0000-00-00', 1, 10000, 1, 1, 1, 0, 13, '', '', '', '', '2023-03-21'),
	(86, 62, '2023-03-21', '2025-08-29', 1, 20000, 1, 1, 1, 0, 12, '', '', '', '', '2023-03-21'),
	(87, 63, '2023-03-21', '2025-09-28', 1, 30000, 1, 1, 1, 0, 12, '', '', '', '', '2023-03-21'),
	(88, 64, '2023-03-29', '1998-09-17', 4, 40000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', '', '2023-03-29'),
	(89, 65, '2023-03-30', '2023-09-25', 1, 145000, 1, 1, 1, 0, 12, 'En caso de modificar la/s fecha/s estarán sujetas según disponibilidad de TURSI PRODUCCIONES.', 'Las horas extras inician a partir de contados 16 (dieciséis) minutos de retraso desde la hora de devolución pactada, y así sucesivamente.', 'LOS EQUIPOS NO CUENTAN CON SEGURO Y EL CLIENTE SE HACE RESPONSABLE POR DAÑOS Y/O EXTRAVIOS.', 'Esta es una observacion', '2023-03-30');

-- Volcando estructura para tabla bd_tursi.facturas_ventas
CREATE TABLE IF NOT EXISTS `facturas_ventas` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(20) NOT NULL,
  `fecha_factura` datetime NOT NULL,
  `id_cliente` int NOT NULL,
  `id_vendedor` int NOT NULL,
  `condiciones` varchar(30) NOT NULL,
  `monto_factura` double NOT NULL,
  `estado_factura` tinyint(1) NOT NULL,
  `id_users_factura` int NOT NULL,
  `dinero_resibido_fac` double NOT NULL,
  `id_sucursal` int NOT NULL,
  `id_comp_factura` int NOT NULL,
  `num_trans_factura` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  UNIQUE KEY `numero_cotizacion` (`numero_factura`)
) ENGINE=MyISAM AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.facturas_ventas: 1 rows
/*!40000 ALTER TABLE `facturas_ventas` DISABLE KEYS */;
INSERT INTO `facturas_ventas` (`id_factura`, `numero_factura`, `fecha_factura`, `id_cliente`, `id_vendedor`, `condiciones`, `monto_factura`, `estado_factura`, `id_users_factura`, `dinero_resibido_fac`, `id_sucursal`, `id_comp_factura`, `num_trans_factura`) VALUES
	(108, '001-001-000000000000', '2022-10-19 07:35:03', 12, 1, '4', 0, 2, 1, 0, 1, 3, '');
/*!40000 ALTER TABLE `facturas_ventas` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.historial_productos
CREATE TABLE IF NOT EXISTS `historial_productos` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `id_users` int NOT NULL,
  `fecha_historial` datetime NOT NULL,
  `nota_historial` varchar(255) NOT NULL,
  `referencia_historial` varchar(100) NOT NULL,
  `cantidad_historial` double NOT NULL,
  `tipo_historial` int NOT NULL,
  PRIMARY KEY (`id_historial`),
  KEY `id_producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_tursi.historial_productos: ~2 rows (aproximadamente)
INSERT INTO `historial_productos` (`id_historial`, `id_producto`, `id_users`, `fecha_historial`, `nota_historial`, `referencia_historial`, `cantidad_historial`, `tipo_historial`) VALUES
	(24, 35, 1, '2023-01-04 08:32:49', 'eliminó 1 producto(s) al inventario', 'informe 05', 1, 2),
	(25, 41, 1, '2023-01-04 08:38:15', 'eliminó 1 producto(s) al inventario', 'aqsd', 1, 2);

-- Volcando estructura para tabla bd_tursi.ingresos
CREATE TABLE IF NOT EXISTS `ingresos` (
  `id_ingreso` int NOT NULL AUTO_INCREMENT,
  `id_consulta` int NOT NULL,
  `id_paciente` int NOT NULL,
  `monto` double NOT NULL,
  `fecha_added` datetime NOT NULL,
  `users` int NOT NULL,
  PRIMARY KEY (`id_ingreso`),
  KEY `id_consulta` (`id_consulta`),
  KEY `id_paciente` (`id_paciente`),
  KEY `users` (`users`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.ingresos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_tursi.kardex
CREATE TABLE IF NOT EXISTS `kardex` (
  `id_kardex` int NOT NULL AUTO_INCREMENT,
  `fecha_kardex` date NOT NULL,
  `cant_entrada` double NOT NULL,
  `producto_kardex` int NOT NULL,
  `costo_entrada` double NOT NULL,
  `total_entrada` double NOT NULL,
  `cant_salida` double NOT NULL DEFAULT '0',
  `costo_salida` double NOT NULL DEFAULT '0',
  `total_salida` double NOT NULL DEFAULT '0',
  `cant_saldo` double NOT NULL,
  `costo_saldo` double NOT NULL,
  `total_saldo` double NOT NULL,
  `added_kardex` datetime NOT NULL,
  `users_kardex` int NOT NULL,
  `tipo_movimiento` int NOT NULL,
  PRIMARY KEY (`id_kardex`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.kardex: ~32 rows (aproximadamente)
INSERT INTO `kardex` (`id_kardex`, `fecha_kardex`, `cant_entrada`, `producto_kardex`, `costo_entrada`, `total_entrada`, `cant_salida`, `costo_salida`, `total_salida`, `cant_saldo`, `costo_saldo`, `total_saldo`, `added_kardex`, `users_kardex`, `tipo_movimiento`) VALUES
	(192, '2022-10-18', 2, 34, 10000, 20000, 0, 0, 0, 2, 10000, 20000, '2022-10-18 11:29:08', 1, 5),
	(193, '2022-10-18', 1, 35, 10000, 10000, 0, 0, 0, 1, 10000, 10000, '2022-10-18 11:31:29', 1, 5),
	(194, '2022-10-18', 1, 36, 10000, 10000, 0, 0, 0, 1, 10000, 10000, '2022-10-18 11:32:27', 1, 5),
	(195, '2023-09-17', 2, 35, 10000, 20000, 0, 0, 0, 3, 10000, 30000, '2023-09-17 00:00:00', 1, 1),
	(196, '2022-10-19', 0, 35, 0, 0, 2, 10000, 20000, 1, 10000, 10000, '2022-10-19 07:35:03', 1, 2),
	(197, '2022-10-19', 1, 37, 1000, 1000, 0, 0, 0, 1, 1000, 1000, '2022-10-19 08:31:34', 1, 5),
	(198, '2022-10-24', 1, 38, 10000, 10000, 0, 0, 0, 1, 10000, 10000, '2022-10-24 09:08:58', 1, 5),
	(199, '2022-10-24', 1, 39, 100000, 100000, 0, 0, 0, 1, 100000, 100000, '2022-10-24 11:17:58', 1, 5),
	(200, '2022-10-24', 1, 40, 20000, 20000, 0, 0, 0, 1, 20000, 20000, '2022-10-24 11:28:09', 1, 5),
	(201, '2022-11-27', 2, 41, 500000, 1000000, 0, 0, 0, 2, 500000, 1000000, '2022-11-27 08:23:09', 1, 5),
	(202, '2022-11-28', 2, 41, 500000, 1000000, 0, 0, 0, 4, 500000, 2000000, '2022-11-28 00:00:00', 1, 1),
	(203, '2023-01-03', 1, 42, 312312, 312312, 0, 0, 0, 1, 312312, 312312, '2023-01-03 09:20:55', 1, 5),
	(204, '2023-01-04', 1, 43, 123123, 123123, 0, 0, 0, 1, 123123, 123123, '2023-01-04 03:10:28', 1, 5),
	(205, '2023-01-04', 6, 45, 1111, 6666, 0, 0, 0, 6, 1111, 6666, '2023-01-04 03:11:19', 1, 5),
	(206, '2023-01-04', 1, 46, 250, 250, 0, 0, 0, 1, 250, 250, '2023-01-04 05:07:34', 1, 5),
	(207, '2023-01-04', 1, 47, 111, 111, 0, 0, 0, 1, 111, 111, '2023-01-04 05:11:07', 1, 5),
	(208, '2023-01-04', 1, 48, 111, 111, 0, 0, 0, 1, 111, 111, '2023-01-04 05:12:27', 1, 5),
	(209, '2023-01-04', 123, 49, 111, 13653, 0, 0, 0, 123, 111, 13653, '2023-01-04 05:14:26', 1, 5),
	(210, '2023-01-04', 1, 50, 111, 111, 0, 0, 0, 1, 111, 111, '2023-01-04 05:18:17', 1, 5),
	(211, '2023-01-04', 1, 51, 111, 111, 0, 0, 0, 1, 111, 111, '2023-01-04 05:20:07', 1, 5),
	(212, '2023-01-04', 1, 52, 111, 111, 0, 0, 0, 1, 111, 111, '2023-01-04 05:33:34', 1, 5),
	(213, '2023-01-04', 1, 53, 111, 111, 0, 0, 0, 1, 111, 111, '2023-01-04 05:43:58', 1, 5),
	(214, '2023-01-04', 2, 54, 222, 444, 0, 0, 0, 2, 222, 444, '2023-01-04 06:54:05', 1, 5),
	(215, '2023-01-04', 45, 55, 111, 4995, 0, 0, 0, 45, 111, 4995, '2023-01-04 07:04:17', 1, 5),
	(216, '2023-01-04', 45, 56, 111, 4995, 0, 0, 0, 45, 111, 4995, '2023-01-04 07:06:39', 1, 5),
	(217, '2023-01-04', 45, 57, 111, 4995, 0, 0, 0, 45, 111, 4995, '2023-01-04 07:08:56', 1, 5),
	(218, '2023-01-04', 15, 58, 111, 1665, 0, 0, 0, 15, 111, 1665, '2023-01-04 07:10:35', 1, 5),
	(219, '2023-01-04', 12, 59, 123, 1476, 0, 0, 0, 12, 123, 1476, '2023-01-04 07:37:27', 1, 5),
	(220, '2023-01-04', 4, 35, 50000, 200000, 0, 0, 0, 5, 42000, 210000, '2023-01-04 00:00:00', 1, 1),
	(221, '2023-01-04', 0, 35, 0, 0, 1, 42000, 42000, 4, 42000, 168000, '2023-01-04 08:32:49', 1, 4),
	(222, '2023-01-04', 0, 41, 0, 0, 1, 500000, 500000, 3, 500000, 1500000, '2023-01-04 08:38:15', 1, 4),
	(223, '2023-01-04', 1, 60, 0, 0, 0, 0, 0, 1, 0, 0, '2023-01-04 09:04:20', 1, 5);

-- Volcando estructura para tabla bd_tursi.lineas
CREATE TABLE IF NOT EXISTS `lineas` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `nombre_linea` varchar(255) NOT NULL,
  `descripcion_linea` text NOT NULL,
  `estado_linea` int NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id_linea`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.lineas: ~1 rows (aproximadamente)
INSERT INTO `lineas` (`id_linea`, `nombre_linea`, `descripcion_linea`, `estado_linea`, `date_added`) VALUES
	(4, 'CÁMARA', 'CAMARAS', 1, '2022-10-18 11:14:47');

-- Volcando estructura para tabla bd_tursi.modulos
CREATE TABLE IF NOT EXISTS `modulos` (
  `id_modulo` int NOT NULL AUTO_INCREMENT,
  `nombre_modulo` varchar(30) NOT NULL,
  PRIMARY KEY (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.modulos: ~13 rows (aproximadamente)
INSERT INTO `modulos` (`id_modulo`, `nombre_modulo`) VALUES
	(1, 'Inicio'),
	(2, 'Productos'),
	(3, 'Proveedores'),
	(4, 'Clientes'),
	(5, 'Reportes'),
	(6, 'Configuracion'),
	(7, 'Usuarios'),
	(8, 'Permisos'),
	(9, 'Categorias'),
	(10, 'Ventas'),
	(11, 'Compras'),
	(12, 'Alquiler'),
	(13, 'Gastos');

-- Volcando estructura para tabla bd_tursi.perfil
CREATE TABLE IF NOT EXISTS `perfil` (
  `id_perfil` int NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `giro_empresa` text NOT NULL,
  `fiscal_empresa` varchar(25) NOT NULL,
  `direccion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ciudad` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `codigo_postal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `impuesto` int NOT NULL,
  `nom_impuesto` varchar(50) NOT NULL,
  `moneda` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `logo_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.perfil: ~1 rows (aproximadamente)
INSERT INTO `perfil` (`id_perfil`, `nombre_empresa`, `giro_empresa`, `fiscal_empresa`, `direccion`, `ciudad`, `codigo_postal`, `estado`, `telefono`, `email`, `impuesto`, `nom_impuesto`, `moneda`, `logo_url`) VALUES
	(1, 'TURSI', 'SISTEMA DE FACTURACION', '5971557-0', 'AV. SAN BLAS', 'CIUDAD DEL ESTE', '7000', 'ALTO PARANA', '0973 118 404', 'info@softys.com', 10, 'IVA', 'Gs', '../../img/1666140689_logo.png');

-- Volcando estructura para tabla bd_tursi.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `codigo_producto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `descripcion_producto` text NOT NULL,
  `id_linea_producto` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `inv_producto` tinyint DEFAULT NULL,
  `iva_producto` tinyint DEFAULT NULL,
  `estado_producto` tinyint DEFAULT NULL,
  `costo_producto` double DEFAULT NULL,
  `utilidad_producto` double DEFAULT NULL,
  `moneda_producto` int DEFAULT NULL,
  `valor_venta` double DEFAULT NULL,
  `valor_alquiler` double DEFAULT NULL,
  `valor3_producto` double DEFAULT NULL,
  `stock_producto` double DEFAULT NULL,
  `stock_min_producto` double DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `image_path` varchar(300) DEFAULT NULL,
  `id_imp_producto` int DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_cat_producto` (`id_linea_producto`),
  KEY `id_proveedor` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- Volcando datos para la tabla bd_tursi.productos: ~12 rows (aproximadamente)
INSERT INTO `productos` (`id_producto`, `codigo_producto`, `nombre_producto`, `descripcion_producto`, `id_linea_producto`, `id_proveedor`, `inv_producto`, `iva_producto`, `estado_producto`, `costo_producto`, `utilidad_producto`, `moneda_producto`, `valor_venta`, `valor_alquiler`, `valor3_producto`, `stock_producto`, `stock_min_producto`, `date_added`, `image_path`, `id_imp_producto`) VALUES
	(35, '10000', 'CODIGO', '0000000', 4, 7, 0, 10, 1, 50000, 10, NULL, 11000, 10000, 0, 4, 1, '2022-10-18 11:31:29', '../../img/productos/1672823383_---logo.png', 0),
	(36, '010', 'BLACKMAGIC POCKET 6K RAW + CAGE + DISCO SÓLIDO 1TB + MANGO SUPERIOR + RODS + 4 BATERÍAS + 1 CARGADOR + LENTE 24 - 105MM	', 'GDFGDF', 4, 7, 0, 10, 1, 15000, 0, NULL, 37500, 20000, 0, 1, 600, '2022-10-18 11:32:27', NULL, 0),
	(37, '00000', 'RECARGO POR MORA', 'SDFSDFSD', 4, 7, 0, 10, 1, 1000, 0, NULL, 1000, 10000, 0, 1, 1, '2022-10-19 08:31:34', '../../img/productos/1672686505_1655304455_Logo-oroty.png', 0),
	(38, 'ffffff', 'FFFFFFFFF', 'FFFF', 4, 7, 0, 10, 1, 1000, 0, NULL, 100000, 100000, 0, 1, 1, '2022-10-24 09:08:58', NULL, 0),
	(39, 'asd', 'ASD', 'ASD', 4, 7, 0, 10, 1, 100000, 0, NULL, 25000, 25000, 0, 1, 1, '2022-10-24 11:17:58', NULL, 0),
	(40, 'eeeeeee', 'EEEEEE', 'EEEEEEEEE', 4, 7, 0, 10, 1, 300000, 0, NULL, 30000000, 30000000, 0, 1, 1, '2022-10-24 11:28:09', NULL, 0),
	(41, '100', 'CAMARA CANON T7', 'CAMARA CANON T7 COLOR NEGRO, CON CARGADOR Y 01 BATERÍA', 4, 7, 0, 10, 1, 500000, 0, NULL, 1500000, 50000, 0, 3, 4, '2022-11-27 08:23:09', NULL, 0),
	(45, 'AAA', 'ASDSAD', 'ASDASAD', 4, 7, 0, 10, 1, 1111, 0, NULL, 1111111, 111111, 0, 6, 1, '2023-01-04 03:11:19', NULL, 0),
	(54, '222', '222', '222', 4, 7, 0, 10, 1, 222, 0, NULL, 222, 222, 0, 2, 1, '2023-01-04 06:54:05', '../../img/productos/1672836844_1654878952_Logo.png', 0),
	(55, 'bbb', 'BBB', 'BBB', 4, 7, 0, 10, 1, 111, 0, NULL, 111, 111, 0, 45, 1, '2023-01-04 07:04:17', '../../img/productos/1672837456_1655304455_Logo-oroty.png', 0),
	(59, 'qqq', 'QQQ', 'QQQ', 4, 7, 0, 10, 1, 123, 0, NULL, 123, 123, 0, 12, 1, '2023-01-04 07:37:27', '', 0),
	(60, 'zzzzz', 'ZZ', 'ZZZZ', 4, 0, 0, 10, 1, 0, 0, NULL, 0, 50000, 0, 1, 1, '2023-01-04 09:04:20', '', 0);

-- Volcando estructura para tabla bd_tursi.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(255) NOT NULL,
  `fiscal_proveedor` varchar(100) NOT NULL,
  `web_proveedor` varchar(255) NOT NULL,
  `direccion_proveedor` text NOT NULL,
  `contacto_proveedor` varchar(255) NOT NULL,
  `email_proveedor` varchar(255) NOT NULL,
  `telefono_proveedor` varchar(100) NOT NULL,
  `date_added` datetime NOT NULL,
  `estado_proveedor` tinyint NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.proveedores: ~1 rows (aproximadamente)
INSERT INTO `proveedores` (`id_proveedor`, `nombre_proveedor`, `fiscal_proveedor`, `web_proveedor`, `direccion_proveedor`, `contacto_proveedor`, `email_proveedor`, `telefono_proveedor`, `date_added`, `estado_proveedor`) VALUES
	(7, 'PROVEEDOR 01', '80081276-0', '', 'ASASKAISUHDS', 'FELIPE', 'asjgbdas@aasds.com', '0973118404', '2022-10-18 11:14:21', 1);

-- Volcando estructura para tabla bd_tursi.stock
CREATE TABLE IF NOT EXISTS `stock` (
  `id_stock` int NOT NULL AUTO_INCREMENT,
  `id_producto_stock` int NOT NULL,
  `id_sucursal_stock` int NOT NULL,
  `cantidad_stock` double NOT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `id_producto_stock` (`id_producto_stock`),
  KEY `id_sucursal_stock` (`id_sucursal_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.stock: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_tursi.sucursales
CREATE TABLE IF NOT EXISTS `sucursales` (
  `id_sucursal` int NOT NULL AUTO_INCREMENT,
  `codigo_sucursal` varchar(50) NOT NULL,
  `nombre_sucursal` varchar(255) NOT NULL,
  `direccion_sucursal` text NOT NULL,
  `limite_sucursal` double NOT NULL,
  `estado_sucursal` tinyint NOT NULL,
  `fecha_added` datetime NOT NULL,
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.sucursales: ~0 rows (aproximadamente)

-- Volcando estructura para tabla bd_tursi.tmp_alquiler
CREATE TABLE IF NOT EXISTS `tmp_alquiler` (
  `id_tmp` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `jornadas_tmp` int DEFAULT NULL,
  `cantidad_tmp` double NOT NULL,
  `precio_tmp` double DEFAULT NULL,
  `desc_tmp` int NOT NULL,
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tmp`)
) ENGINE=MyISAM AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla bd_tursi.tmp_alquiler: 0 rows
/*!40000 ALTER TABLE `tmp_alquiler` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_alquiler` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.tmp_compra
CREATE TABLE IF NOT EXISTS `tmp_compra` (
  `id_tmp` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `cantidad_tmp` double NOT NULL,
  `costo_tmp` double(8,2) DEFAULT NULL,
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tmp`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla bd_tursi.tmp_compra: 0 rows
/*!40000 ALTER TABLE `tmp_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_compra` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.tmp_cotizacion
CREATE TABLE IF NOT EXISTS `tmp_cotizacion` (
  `id_tmp` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `cantidad_tmp` double NOT NULL,
  `jornada_tmp` float NOT NULL,
  `precio_tmp` double NOT NULL,
  `desc_tmp` int NOT NULL,
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tmp`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla bd_tursi.tmp_cotizacion: 0 rows
/*!40000 ALTER TABLE `tmp_cotizacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `tmp_cotizacion` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.tmp_imagen
CREATE TABLE IF NOT EXISTS `tmp_imagen` (
  `id_imagen` int DEFAULT NULL,
  `direccion` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_producto` int DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla bd_tursi.tmp_imagen: 14 rows
/*!40000 ALTER TABLE `tmp_imagen` DISABLE KEYS */;
INSERT INTO `tmp_imagen` (`id_imagen`, `direccion`, `id_producto`) VALUES
	(NULL, '../../img/productos/1672827480_stock.png', 46),
	(NULL, '../../img/productos/1672830452_stock.png', 46),
	(NULL, '../../img/productos/1672830633_stock.png', 47),
	(NULL, '../../img/productos/1672830746_stock.png', 48),
	(NULL, '../../img/productos/1672830865_stock.png', 46),
	(NULL, '../../img/productos/1672831095_stock.png', 46),
	(NULL, '../../img/productos/1672831196_stock.png', 46),
	(NULL, '../../img/productos/1672832013_stock.png', 52),
	(NULL, '../../img/productos/1672836844_1654878952_Logo.png', 54),
	(NULL, '../../img/productos/1672837456_1655304455_Logo-oroty.png', 55),
	(NULL, '../../img/productos/1672837598_1654878952_Logo.png', 56),
	(NULL, '../../img/productos/1672837735_1654878952_Logo.png', 57),
	(NULL, '../../img/productos/1672837834_1655304455_Logo-oroty.png', 58),
	(NULL, '../../img/productos/1672839446_---logo.png', 56);
/*!40000 ALTER TABLE `tmp_imagen` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.tmp_ventas
CREATE TABLE IF NOT EXISTS `tmp_ventas` (
  `id_tmp` int NOT NULL AUTO_INCREMENT,
  `id_producto` int NOT NULL,
  `cantidad_tmp` double NOT NULL,
  `precio_tmp` double DEFAULT NULL,
  `desc_tmp` int NOT NULL,
  `session_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tmp`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla bd_tursi.tmp_ventas: 1 rows
/*!40000 ALTER TABLE `tmp_ventas` DISABLE KEYS */;
INSERT INTO `tmp_ventas` (`id_tmp`, `id_producto`, `cantidad_tmp`, `precio_tmp`, `desc_tmp`, `session_id`) VALUES
	(177, 37, 1, 80000, 0, 'l0d0dkcq039i3ktnjulj1l3l42');
/*!40000 ALTER TABLE `tmp_ventas` ENABLE KEYS */;

-- Volcando estructura para tabla bd_tursi.users
CREATE TABLE IF NOT EXISTS `users` (
  `id_users` int NOT NULL AUTO_INCREMENT COMMENT 'auto incrementing user_id of each user, unique index',
  `nombre_users` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `apellido_users` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `usuario_users` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s name, unique',
  `con_users` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s password in salted and hashed format',
  `email_users` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'user''s email, unique',
  `tipo_users` tinyint NOT NULL,
  `cargo_users` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sucursal_users` tinyint NOT NULL,
  `date_added` datetime NOT NULL,
  `comision_users` double NOT NULL,
  PRIMARY KEY (`id_users`),
  UNIQUE KEY `user_name` (`usuario_users`),
  UNIQUE KEY `user_email` (`email_users`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data';

-- Volcando datos para la tabla bd_tursi.users: ~2 rows (aproximadamente)
INSERT INTO `users` (`id_users`, `nombre_users`, `apellido_users`, `usuario_users`, `con_users`, `email_users`, `tipo_users`, `cargo_users`, `sucursal_users`, `date_added`, `comision_users`) VALUES
	(1, 'SUPERADMIN', '', 'admin', '$2y$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', 'admin@admin.com', 0, '1', 1, '0000-00-00 00:00:00', 0),
	(2, 'JOSE', '', 'jose', '$10$MPVHzZ2ZPOWmtUUGCq3RXu31OTB.jo7M9LZ7PmPQYmgETSNn19ejO', 'jose@jose.com', 0, '1', 1, '0000-00-00 00:00:00', 0);

-- Volcando estructura para tabla bd_tursi.user_group
CREATE TABLE IF NOT EXISTS `user_group` (
  `user_group_id` int NOT NULL,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `permission` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_group_id`),
  KEY `user_group_id` (`user_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_tursi.user_group: ~1 rows (aproximadamente)
INSERT INTO `user_group` (`user_group_id`, `name`, `permission`, `date_added`) VALUES
	(1, 'Super Administrador', 'Inicio,1,1,1;Productos,1,1,1;Proveedores,1,1,1;Clientes,1,1,1;Reportes,1,1,1;Configuracion,1,1,1;Usuarios,1,1,1;Permisos,1,1,1;Categorias,1,1,1;Ventas,1,1,1;Compras,1,1,1;Alquiler,1,1,1; Gastos,1,1,1;', '2017-08-09 10:22:15');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
