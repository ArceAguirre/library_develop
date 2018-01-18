-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-01-2018 a las 18:05:13
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `codice_develop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `daily_entry`
--

CREATE TABLE `daily_entry` (
  `id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_inventory` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8_bin NOT NULL,
  `code` varchar(20) COLLATE utf8_bin NOT NULL,
  `classification` varchar(100) COLLATE utf8_bin NOT NULL,
  `copy` int(10) NOT NULL,
  `volume` varchar(100) COLLATE utf8_bin NOT NULL,
  `bibid` varchar(100) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `author` varchar(100) COLLATE utf8_bin NOT NULL,
  `editorial` varchar(255) COLLATE utf8_bin NOT NULL,
  `edition` varchar(100) COLLATE utf8_bin NOT NULL,
  `year` year(4) NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `ref` bit(1) DEFAULT NULL,
  `id_status_inventory` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_inventory`
--

CREATE TABLE `status_inventory` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temporary_inventory`
--

CREATE TABLE `temporary_inventory` (
  `id` int(11) NOT NULL,
  `type` varchar(100) COLLATE utf8_bin NOT NULL,
  `code` varchar(20) COLLATE utf8_bin NOT NULL,
  `classification` varchar(100) COLLATE utf8_bin NOT NULL,
  `copy` int(10) NOT NULL,
  `volume` varchar(100) COLLATE utf8_bin NOT NULL,
  `bibid` varchar(100) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `author` varchar(100) COLLATE utf8_bin NOT NULL,
  `editorial` varchar(255) COLLATE utf8_bin NOT NULL,
  `edition` varchar(100) COLLATE utf8_bin NOT NULL,
  `year` year(4) NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `ref` bit(1) DEFAULT NULL,
  `id_status_inventory` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `type_user`
--

CREATE TABLE `type_user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_codice`
--

CREATE TABLE `user_codice` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `password` varchar(40) COLLATE utf8_bin NOT NULL,
  `id_type_user` int(11) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `daily_entry`
--
ALTER TABLE `daily_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_inventory` (`id_inventory`);

--
-- Indices de la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `id_status_inventory` (`id_status_inventory`);

--
-- Indices de la tabla `status_inventory`
--
ALTER TABLE `status_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `temporary_inventory`
--
ALTER TABLE `temporary_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `id_status_inventory` (`id_status_inventory`);

--
-- Indices de la tabla `type_user`
--
ALTER TABLE `type_user`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user_codice`
--
ALTER TABLE `user_codice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_user` (`id_type_user`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `daily_entry`
--
ALTER TABLE `daily_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `status_inventory`
--
ALTER TABLE `status_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `temporary_inventory`
--
ALTER TABLE `temporary_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `type_user`
--
ALTER TABLE `type_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_codice`
--
ALTER TABLE `user_codice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `daily_entry`
--
ALTER TABLE `daily_entry`
  ADD CONSTRAINT `daily_entry_ibfk_1` FOREIGN KEY (`id_inventory`) REFERENCES `inventory` (`id`);

--
-- Filtros para la tabla `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`id_status_inventory`) REFERENCES `status_inventory` (`id`);

--
-- Filtros para la tabla `user_codice`
--
ALTER TABLE `user_codice`
  ADD CONSTRAINT `user_codice_ibfk_1` FOREIGN KEY (`id_type_user`) REFERENCES `type_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
