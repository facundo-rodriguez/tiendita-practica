-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-08-2021 a las 22:41:35
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `productos_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `id_color` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `colores`
--

INSERT INTO `colores` (`id_color`, `descripcion`) VALUES
(1, 'Azul'),
(2, 'Roja'),
(3, 'Marrón'),
(4, 'Negra'),
(5, 'Blanca'),
(6, 'Verde'),
(7, 'Amarillo'),
(8, 'Gris');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores_zapatillas`
--

CREATE TABLE `colores_zapatillas` (
  `id_color` int(11) NOT NULL,
  `id_zapatilla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `discplina`
--

CREATE TABLE `discplina` (
  `descripcion` varchar(32) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `discplina`
--

INSERT INTO `discplina` (`descripcion`, `id_disciplina`) VALUES
('running', 1),
('futbol', 2),
('tennis', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `descripcion`) VALUES
(1, 'Nike'),
(2, 'Adidas'),
(3, 'Converse'),
(4, 'Fila'),
(5, 'Lacoste'),
(6, 'New Balance');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zapatillas`
--

CREATE TABLE `zapatillas` (
  `id_zapatilla` int(11) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `precio` decimal(7,2) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `id_marca` int(11) NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imagen` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `zapatillas`
--

INSERT INTO `zapatillas` (`id_zapatilla`, `modelo`, `precio`, `genero`, `id_marca`, `fecha_alta`, `imagen`, `descripcion`, `id_disciplina`) VALUES
(21, 'la adidas re piola', '5668.00', 'hombre', 2, '2021-08-08 07:52:45', 'images/', 'las de lio ;)', 2),
(22, 'la fila 2020', '6900.00', 'niÃ±o', 4, '2021-08-08 08:32:08', 'images/Fila_Revolution.jpg', ' jaja', 3),
(23, 'le revolucion', '9021.00', 'mujer', 5, '2021-08-08 09:11:23', 'images/', 'hola q tal', 2),
(24, 'le revolucion', '7523.00', 'mujer', 6, '2021-08-08 19:59:16', 'images/', 'lala', 2),
(25, 'la fila 2020', '4500.00', 'mujer', 4, '2021-08-08 20:02:31', 'images/', 'gga', 3),
(26, 'la nike re piola', '9021.00', 'niÃ±os', 1, '2021-08-08 20:26:19', 'images/', 'tata', 2),
(27, 'la nike re piola', '4500.00', 'niÃ±os', 1, '2021-08-08 20:40:44', 'images/', 'niÃ±os de la niÃ±ez', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`id_color`);

--
-- Indices de la tabla `colores_zapatillas`
--
ALTER TABLE `colores_zapatillas`
  ADD PRIMARY KEY (`id_color`,`id_zapatilla`),
  ADD KEY `colores_zapatillas` (`id_zapatilla`);

--
-- Indices de la tabla `discplina`
--
ALTER TABLE `discplina`
  ADD PRIMARY KEY (`id_disciplina`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id_marca`);

--
-- Indices de la tabla `zapatillas`
--
ALTER TABLE `zapatillas`
  ADD PRIMARY KEY (`id_zapatilla`),
  ADD KEY `zapatillas_marcas` (`id_marca`),
  ADD KEY `fk_disciplina` (`id_disciplina`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `colores`
--
ALTER TABLE `colores`
  MODIFY `id_color` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `discplina`
--
ALTER TABLE `discplina`
  MODIFY `id_disciplina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `zapatillas`
--
ALTER TABLE `zapatillas`
  MODIFY `id_zapatilla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `colores_zapatillas`
--
ALTER TABLE `colores_zapatillas`
  ADD CONSTRAINT `colores_zapatillas` FOREIGN KEY (`id_zapatilla`) REFERENCES `zapatillas` (`id_zapatilla`),
  ADD CONSTRAINT `zapatillas_colores` FOREIGN KEY (`id_color`) REFERENCES `colores` (`id_color`);

--
-- Filtros para la tabla `zapatillas`
--
ALTER TABLE `zapatillas`
  ADD CONSTRAINT `fk_disciplina` FOREIGN KEY (`id_disciplina`) REFERENCES `discplina` (`id_disciplina`),
  ADD CONSTRAINT `zapatillas_marcas` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id_marca`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
