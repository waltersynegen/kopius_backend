-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 06, 2023 at 04:02 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kopius`
--

-- --------------------------------------------------------

--
-- Table structure for table `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pais` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `skills` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `comentario` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `puntaje` int(11) DEFAULT NULL,
  `timecreated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `apellido`, `pais`, `edad`, `email`, `skills`, `comentario`, `puntaje`, `timecreated`) VALUES
(1, 'María', 'Luna', 'Colombia', 52, 'mluna@colom.com', 'PHP, MySQL', 'todo muy bien', 90, '2023-08-04 18:30:00'),
(2, 'Jorge', 'Rivas', 'Argentina', 48, 'jrivas@gmail.com', '.NET, ORACLE', 'me encantó, volvería otra vez', 45, '2023-08-04 18:30:00'),
(3, 'Silvia', 'Solano', 'Venezuela', 25, 'sil.solano@gmail.com', 'PSQL, JAVA', '', 110, '2023-08-04 18:30:00'),
(4, 'Ramiro', 'Perez', 'Uruguay', 35, 'ramperez@gmail.com', 'SQL Server, MySQL, Oracle', 'de 10', 80, '2023-08-04 18:30:00'),
(5, 'Carlos', 'Bermudez', 'Colombia', 28, 'cbermudez@gmail.com', 'PHP, MySQL', '', 75, '2023-08-04 18:30:00'),
(6, 'Cristian', 'Nolasco', 'Francia', 22, 'cnolasco@hotmail.com', 'PSQL, JAVA', 'me gustó mucho', 120, '2023-08-04 18:30:00'),
(7, 'Roberto', 'Barbera', 'Perú', 20, 'rbarbera@skill.com', '.NET', '', 50, '2023-08-04 18:30:00'),
(8, 'Mauricio', 'Pozo', 'Uruguay', 41, 'mpozo@gmail.com', 'SQL Server, MySQL, Oracle', 'vamo arriba', 65, '2023-08-04 18:30:00'),
(9, 'Karina', 'Jose', 'México', 30, 'kjose@hotmail.com', 'PHP, MySQL', 'me gustó la onda', 100, '2023-08-04 18:30:00'),
(10, 'José', 'Pernile', 'Chile', 19, 'jpernile@yahoo.com.cl', 'PHP, MySQL', 'ok', 95, '2023-08-04 18:30:00'),
(11, 'Beatriz', 'Sarlo', 'Colombia', 25, 'bsarlo@gmail.com', 'SQL Server, MySQL, Oracle', '', 85, '2023-08-04 18:30:00'),
(12, 'Juan Manuel', 'Noya', 'Argentina', 24, 'jcnoya@gmail.com', 'PHP, MySQL, NodeJS', NULL, 65, '2023-08-04 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'demo', '827ccb0eea8a706c4c34a16891f84e7b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
