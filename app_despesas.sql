-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26-Fev-2022 às 17:09
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `app`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `app_despesas`
--

CREATE TABLE `app_despesas` (
  `id` int(11) NOT NULL,
  `ano` int(4) DEFAULT NULL,
  `mes` int(2) DEFAULT NULL,
  `dia` int(2) DEFAULT NULL,
  `tipo` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valor` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `app_despesas`
--

INSERT INTO `app_despesas` (`id`, `ano`, `mes`, `dia`, `tipo`, `descricao`, `valor`) VALUES
(30, 2018, 0, 0, '', '', 0),
(31, 2018, 2, 11, 'Alimentação', 'ultimo teste', 5334),
(32, 0, 0, 0, '', '', 55),
(33, 0, 0, 0, '', '', 55.44),
(34, 0, 2, 0, '', '', 0),
(35, 0, 3, 0, '', '', 0),
(36, 0, 2, 0, '', '', 0),
(37, 0, 3, 0, '', '', 0),
(38, 0, 2, 0, '', '', 0),
(39, 0, 2, 0, '', '', 0),
(40, 0, 2, 0, '', '', 0),
(41, 0, 2, 0, '', '', 0),
(42, 2018, 0, 0, '', '', 0),
(43, 0, 0, 0, '', '', 0),
(44, 0, 0, 0, '', '', 0),
(45, 0, 0, 0, '', '', 0),
(46, 0, 0, 0, '', '', 0),
(47, 0, 0, 0, '', '', 0),
(48, 0, 0, 0, '', '', 0),
(49, 0, 0, 0, '', '', 0),
(50, 0, 0, 0, '', '', 0),
(51, 0, 0, 0, '', '', 0),
(52, 0, 0, 0, '', '', 0),
(53, 0, 0, 0, '', '', 0),
(54, 0, 0, 0, '', '', 0),
(55, 0, 0, 0, '', '', 0),
(56, 0, 0, 0, '', '', 0),
(57, 0, 0, 0, '', '', 0),
(58, 0, 0, 0, 'Alimentação', '', 0),
(59, 2022, 2, 22, 'Alimentação', 'teste', 33),
(60, 2018, 2, 22, 'Alimentação', 'teste', 55),
(61, 2021, 4, 22, 'Alimentação', '222', 22),
(62, 2021, 2, 12, 'Alimentação', 'teste', 44),
(63, 2019, 3, 22, 'Alimentação', 'teste', 44),
(64, 2019, 2, 22, 'Alimentação', 'teste', 44),
(65, 2018, 2, 22, 'Educação', 'teste', 33);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `app_despesas`
--
ALTER TABLE `app_despesas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `app_despesas`
--
ALTER TABLE `app_despesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
