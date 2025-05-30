-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 08-Out-2024 às 12:02
-- Versão do servidor: 10.4.34-MariaDB-1:10.4.34+maria~ubu2004
-- versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `IPO`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Clientes`
--

CREATE TABLE `Clientes` (
  `CodCliente` int(11) NOT NULL,
  `Nome` varchar(20) NOT NULL,
  `Morada` varchar(20) NOT NULL,
  `NIF` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Inspecoes`
--

CREATE TABLE `Inspecoes` (
  `numinspecao` int(11) NOT NULL,
  `Data` date NOT NULL,
  `Numfaltas` int(20) NOT NULL,
  `Descfaltas` varchar(10) NOT NULL,
  `Aprovado` bit(10) NOT NULL,
  `Matricula` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Marcas`
--

CREATE TABLE `Marcas` (
  `CodMarca` int(11) NOT NULL,
  `Marca` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `Matricula` varchar(20) NOT NULL,
  `Datalivrete` date NOT NULL,
  `Anofabrico` int(10) NOT NULL,
  `CodCliente` varchar(20) NOT NULL,
  `numinspecao` varchar(10) NOT NULL,
  `CodMarca` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`CodCliente`);

--
-- Índices para tabela `Inspecoes`
--
ALTER TABLE `Inspecoes`
  ADD PRIMARY KEY (`numinspecao`);

--
-- Índices para tabela `Marcas`
--
ALTER TABLE `Marcas`
  ADD PRIMARY KEY (`CodMarca`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `CodCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Inspecoes`
--
ALTER TABLE `Inspecoes`
  MODIFY `numinspecao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `Marcas`
--
ALTER TABLE `Marcas`
  MODIFY `CodMarca` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
