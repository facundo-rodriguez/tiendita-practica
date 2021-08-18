-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-08-2021 a las 22:45:41
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

--
-- Volcado de datos para la tabla `colores_zapatillas`
--

INSERT INTO `colores_zapatillas` (`id_color`, `id_zapatilla`) VALUES
(1, 25),
(5, 25),
(7, 25),
(7, 26);

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
-- Estructura de tabla para la tabla `talles`
--

CREATE TABLE `talles` (
  `id_talle` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talles_zapatillas`
--

CREATE TABLE `talles_zapatillas` (
  `id_talle` int(11) NOT NULL,
  `id_zapatilla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(25, 'nike 2021', '5668.00', 'mujer', 2, '2021-08-18 20:34:17', 'images/Nike_Downshifter_7.jpg', '', 2),
(26, 'adidas 2021', '6900.00', 'niños', 2, '2021-08-18 20:37:21', 'images/Adidas_10K.jpg', '', 2);

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
-- Indices de la tabla `talles`
--
ALTER TABLE `talles`
  ADD PRIMARY KEY (`id_talle`);

--
-- Indices de la tabla `talles_zapatillas`
--
ALTER TABLE `talles_zapatillas`
  ADD PRIMARY KEY (`id_talle`,`id_zapatilla`),
  ADD KEY `fk_zapatilla` (`id_zapatilla`);

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
-- AUTO_INCREMENT de la tabla `talles`
--
ALTER TABLE `talles`
  MODIFY `id_talle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `zapatillas`
--
ALTER TABLE `zapatillas`
  MODIFY `id_zapatilla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

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
-- Filtros para la tabla `talles_zapatillas`
--
ALTER TABLE `talles_zapatillas`
  ADD CONSTRAINT `fk_talle` FOREIGN KEY (`id_talle`) REFERENCES `talles` (`id_talle`),
  ADD CONSTRAINT `fk_zapatilla` FOREIGN KEY (`id_zapatilla`) REFERENCES `zapatillas` (`id_zapatilla`);

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
