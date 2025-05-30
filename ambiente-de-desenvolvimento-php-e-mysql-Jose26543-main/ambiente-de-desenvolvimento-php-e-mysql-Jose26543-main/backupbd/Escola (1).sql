-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Tempo de geração: 30-Set-2024 às 15:02
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
-- Banco de dados: `Escola`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Alunos`
--

CREATE TABLE `Alunos` (
  `NumAluno` int(11) NOT NULL,
  `Nome` varchar(120) NOT NULL,
  `Morada` varchar(120) NOT NULL,
  `CodTurma` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `Alunos`
--

INSERT INTO `Alunos` (`NumAluno`, `Nome`, `Morada`, `CodTurma`) VALUES
(1, 'José', 'Rua do ze', '1'),
(2, 'guilherme', 'rua do gui', '2'),
(3, 'Antonieta', 'Rua da tonieta', '3'),
(4, 'Pedro', 'Rua do pedro', '1'),
(5, 'Lara', 'Rua da lara', '2'),
(6, 'Albertino', 'Rua do albetino', '3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Turmas`
--

CREATE TABLE `Turmas` (
  `CodTurma` varchar(10) NOT NULL,
  `Turma` varchar(20) NOT NULL,
  `Curso` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

--
-- Extraindo dados da tabela `Turmas`
--

INSERT INTO `Turmas` (`CodTurma`, `Turma`, `Curso`) VALUES
('1', '3tgp', 'informatica'),
('2', '3tmi', 'manuntencao industrial'),
('3', '3tel', 'eletrotecnia');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Alunos`
--
ALTER TABLE `Alunos`
  ADD PRIMARY KEY (`NumAluno`),
  ADD KEY `fk_Codturma` (`CodTurma`);

--
-- Índices para tabela `Turmas`
--
ALTER TABLE `Turmas`
  ADD PRIMARY KEY (`CodTurma`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Alunos`
--
ALTER TABLE `Alunos`
  MODIFY `NumAluno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `Alunos`
--
ALTER TABLE `Alunos`
  ADD CONSTRAINT `fk_Codturma` FOREIGN KEY (`CodTurma`) REFERENCES `Turmas` (`CodTurma`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
