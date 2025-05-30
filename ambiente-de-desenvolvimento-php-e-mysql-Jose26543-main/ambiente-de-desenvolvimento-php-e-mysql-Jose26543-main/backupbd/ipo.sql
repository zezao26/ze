-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Out-2023 às 18:11
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ipo`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `CodCli` int(11) NOT NULL,
  `Nome` varchar(100) NOT NULL,
  `Morada` varchar(100) NOT NULL,
  `NIF` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`CodCli`, `Nome`, `Morada`, `NIF`) VALUES
(1, 'Julio Pinho', 'Lisboa', '185763248'),
(2, 'Barros Silva', 'Madeira', '785429675'),
(3, 'Maria Juahna', 'Leiria', '754863214');

-- --------------------------------------------------------

--
-- Estrutura da tabela `inspecoes`
--

CREATE TABLE `inspecoes` (
  `NumIns` int(11) NOT NULL,
  `Data` date NOT NULL,
  `NumFaltas` int(11) NOT NULL,
  `DescFaltas` varchar(100) NOT NULL,
  `Aprovado` tinyint(1) NOT NULL,
  `Matricula` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `inspecoes`
--

INSERT INTO `inspecoes` (`NumIns`, `Data`, `NumFaltas`, `DescFaltas`, `Aprovado`, `Matricula`) VALUES
(1, '2024-10-10', 1, 'Problema motor', 1, 'B01T4R'),
(2, '2024-10-08', 1, 'Problema travoes', 1, 'L1C0RN'),
(3, '2024-10-03', 2, 'Problema no motor e nos travoes', 0, 'M4ZD4S'),
(4, '2024-10-06', 1, 'Problema nos travoes', 1, 'M42Z1O'),
(5, '2024-10-09', 1, 'Problema motor', 1, 'J1S3M9'),
(6, '2024-10-06', 2, 'Problema no motor e nos travoes', 0, 'L1C0RN'),
(7, '2024-10-04', 1, 'Problema travoes', 1, 'B01T4R');

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

CREATE TABLE `marcas` (
  `CodMarca` int(11) NOT NULL,
  `Marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`CodMarca`, `Marca`) VALUES
(1, 'Ferrari'),
(2, 'Porsche'),
(3, 'Audi'),
(4, 'BMW'),
(5, 'Toyta');

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `Matricula` varchar(25) NOT NULL,
  `DataLivrete` date NOT NULL,
  `AnoFabrico` int(11) NOT NULL,
  `CodCli` int(11) NOT NULL,
  `CodMarca` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `veiculos`
--

INSERT INTO `veiculos` (`Matricula`, `DataLivrete`, `AnoFabrico`, `CodCli`, `CodMarca`) VALUES
('B01T4R', '2024-10-31', 2016, 1, 1),
('J1S3M9', '2024-10-20', 2012, 2, 3),
('L1C0RN', '2024-10-01', 2020, 1, 4),
('M42Z1O', '2024-10-13', 2004, 2, 2),
('M4ZD4S', '2024-10-03', 2004, 3, 5);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CodCli`);

--
-- Índices para tabela `inspecoes`
--
ALTER TABLE `inspecoes`
  ADD PRIMARY KEY (`NumIns`),
  ADD KEY `fk_Matricula` (`Matricula`);

--
-- Índices para tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`CodMarca`);

--
-- Índices para tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`Matricula`),
  ADD KEY `fk_CodCli` (`CodCli`),
  ADD KEY `fk_CodMarca` (`CodMarca`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `CodCli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `inspecoes`
--
ALTER TABLE `inspecoes`
  MODIFY `NumIns` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `CodMarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `inspecoes`
--
ALTER TABLE `inspecoes`
  ADD CONSTRAINT `inspecoes_ibfk_1` FOREIGN KEY (`Matricula`) REFERENCES `veiculos` (`Matricula`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Limitadores para a tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD CONSTRAINT `veiculos_ibfk_1` FOREIGN KEY (`CodCli`) REFERENCES `clientes` (`CodCli`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `veiculos_ibfk_2` FOREIGN KEY (`CodMarca`) REFERENCES `marcas` (`CodMarca`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;