-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2018 a las 22:08:00
-- Versión del servidor: 10.1.32-MariaDB
-- Versión de PHP: 7.2.5

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectofinal`
--
CREATE DATABASE IF NOT EXISTS `proyectofinal` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `proyectofinal`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(10) NOT NULL,
  `APELLIDO` varchar(20) NOT NULL,
  `SUBAPELLIDO` varchar(20) NOT NULL,
  `DNI` varchar(10) NOT NULL,
  `SEXO` varchar(20) DEFAULT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `DIRECCION` varchar(50) DEFAULT NULL,
  `CONTACTO` int(11) DEFAULT NULL,
  `FECHA_INGRESO` date NOT NULL,
  `IMPORTE` int(11) NOT NULL,
  `ESTADO` varchar(10) DEFAULT NULL,
  `USUARIO` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicios`
--

DROP TABLE IF EXISTS `ejercicios`;
CREATE TABLE `ejercicios` (
  `ID_EJERCICIO` int(11) NOT NULL,
  `EJERCICIO` varchar(30) DEFAULT NULL,
  `LUNES` tinyint(1) DEFAULT NULL,
  `MARTES` tinyint(1) DEFAULT NULL,
  `MIERCOLES` tinyint(1) DEFAULT NULL,
  `JUEVES` tinyint(1) DEFAULT NULL,
  `VIERNES` tinyint(1) DEFAULT NULL,
  `OBSERVACIONES` varchar(50) DEFAULT NULL,
  `ID_NIVEL` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ejercicios`
--

INSERT INTO `ejercicios` (`ID_EJERCICIO`, `EJERCICIO`, `LUNES`, `MARTES`, `MIERCOLES`, `JUEVES`, `VIERNES`, `OBSERVACIONES`, `ID_NIVEL`) VALUES
(2, 'sentadillas', 1, 0, 1, 0, 1, '4 series de 15 repeticiones', 1),
(3, 'press de banca', 1, 0, 1, 0, 1, '4 series de 12 repeticiones', 1),
(4, 'Extensiones en maquina \r\n', 1, 1, 1, 0, 1, '5 sesiones de 15 rpes', 1),
(6, 'Curl de Femoral\r\n\r\n\r\n', 1, 1, 1, 1, 1, '5 sesiones de 10 rpes', 1),
(7, 'Pullover con mancuerna\r\n\r\n\r\n', 1, 1, 1, 0, 0, '5 sesiones de 15 rpes', 1),
(8, 'Press tras nuca con barra\r\n\r\n\r', 1, 0, 1, 0, 1, '3 sesiones de 15 rpes', 2),
(9, 'Remo sentado en maquina\r\n\r\n\r\n', 1, 0, 1, 0, 1, '5 sesiones de 15 rpes', 2),
(10, 'Press de banca\r\n\r\n\r\n', 1, 1, 1, 0, 1, '5 sesiones de 15 rpes', 2),
(11, 'Curl de Bicep con barra\r\n\r\n\r\n', 1, 1, 1, 1, 1, '3 sesiones de 15 rpes', 2),
(12, 'Extensiones de Triceps con man', 1, 1, 1, 1, 1, '5 sesiones de 15 rpes', 2),
(13, 'Dominadas en barra fija\r\n\r\n\r\n', 1, 0, 1, 0, 1, '5 sesiones de 15 rpes', 2),
(14, 'Fondos en barras paralelas\r\n\r\n', 0, 1, 0, 1, 0, '5 sesiones de 15 rpes', 2),
(15, 'Levantamiento de pantorrilas d', 0, 1, 0, 1, 0, '5 sesiones de 15 rpes', 2),
(16, 'Crunch declinado\r\n\r\n\r\n', 1, 1, 1, 1, 1, '5 sesiones de 10 rpes', 2),
(17, 'sentadillas', 1, 1, 1, 1, 1, '5 series de 15 rpes', 3),
(19, 'press de banca', 1, 1, 1, 1, 1, '4 series de 15 rpes', 3),
(20, 'Press tras nuca con barra\r\n\r\n\r', 1, 1, 1, 1, 1, '5 sesiones de 15 rpes', 3),
(21, 'Remo sentado en maquina\r\n\r\n\r\n', 1, 1, 1, 1, 1, '5 sesiones de 15 rpes', 3),
(22, 'Remo sentado en maquina\r\n\r\n\r\n', 1, 1, 1, 1, 1, '5 sesiones de 15 rpes', 3),
(23, 'cinta', 1, 1, 1, 1, 1, '30 min en cinta de cardio', 1),
(24, 'cinta', 1, 1, 1, 1, 1, '40 min en cinta de cardio', 2),
(25, 'cinta', 1, 1, 1, 1, 1, '40 min en cinta de cardio', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `USUARIO` varchar(20) NOT NULL,
  `PASSWORD` varchar(20) NOT NULL,
  `ID_NIVEL` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`USUARIO`, `PASSWORD`, `ID_NIVEL`) VALUES
('sandy', '0101', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nivel`
--

DROP TABLE IF EXISTS `nivel`;
CREATE TABLE `nivel` (
  `ID_NIVEL` int(1) NOT NULL,
  `NIVEL` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nivel`
--

INSERT INTO `nivel` (`ID_NIVEL`, `NIVEL`) VALUES
(1, 'INICIAL'),
(2, 'INTERMEDIO'),
(3, 'AVANZADO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_CLIENTE`),
  ADD KEY `FK_USUARIO` (`USUARIO`);

--
-- Indices de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  ADD PRIMARY KEY (`ID_EJERCICIO`),
  ADD KEY `ID_NIVEL` (`ID_NIVEL`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`USUARIO`),
  ADD KEY `ID_NIVEL` (`ID_NIVEL`);

--
-- Indices de la tabla `nivel`
--
ALTER TABLE `nivel`
  ADD PRIMARY KEY (`ID_NIVEL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `FK_USUARIO` FOREIGN KEY (`USUARIO`) REFERENCES `login` (`USUARIO`);

--
-- Filtros para la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  ADD CONSTRAINT `FK_NIVEL` FOREIGN KEY (`ID_NIVEL`) REFERENCES `nivel` (`ID_NIVEL`);

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `FK_LOGIN` FOREIGN KEY (`ID_NIVEL`) REFERENCES `nivel` (`ID_NIVEL`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
