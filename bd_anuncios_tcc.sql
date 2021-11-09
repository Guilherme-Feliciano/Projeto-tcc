-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 08-Out-2021 às 02:58
-- Versão do servidor: 10.4.20-MariaDB
-- versão do PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_anuncios_tcc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado`
--

CREATE TABLE `estado` (
  `id` int(11) NOT NULL,
  `nome` varchar(75) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `ibge` int(2) DEFAULT NULL,
  `pais` int(3) DEFAULT NULL,
  `ddd` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Unidades Federativas';

--
-- Extraindo dados da tabela `estado`
--

INSERT INTO `estado` (`id`, `nome`, `uf`, `ibge`, `pais`, `ddd`) VALUES
(1, 'Acre', 'AC', 12, 1, '68'),
(2, 'Alagoas', 'AL', 27, 1, '82'),
(3, 'Amazonas', 'AM', 13, 1, '97,92'),
(4, 'Amapá', 'AP', 16, 1, '96'),
(5, 'Bahia', 'BA', 29, 1, '77,75,73,74,71'),
(6, 'Ceará', 'CE', 23, 1, '88,85'),
(7, 'Distrito Federal', 'DF', 53, 1, '61'),
(8, 'Espírito Santo', 'ES', 32, 1, '28,27'),
(9, 'Goiás', 'GO', 52, 1, '62,64,61'),
(10, 'Maranhão', 'MA', 21, 1, '99,98'),
(11, 'Minas Gerais', 'MG', 31, 1, '34,37,31,33,35,38,32'),
(12, 'Mato Grosso do Sul', 'MS', 50, 1, '67'),
(13, 'Mato Grosso', 'MT', 51, 1, '65,66'),
(14, 'Pará', 'PA', 15, 1, '91,94,93'),
(15, 'Paraíba', 'PB', 25, 1, '83'),
(16, 'Pernambuco', 'PE', 26, 1, '81,87'),
(17, 'Piauí', 'PI', 22, 1, '89,86'),
(18, 'Paraná', 'PR', 41, 1, '43,41,42,44,45,46'),
(19, 'Rio de Janeiro', 'RJ', 33, 1, '24,22,21'),
(20, 'Rio Grande do Norte', 'RN', 24, 1, '84'),
(21, 'Rondônia', 'RO', 11, 1, '69'),
(22, 'Roraima', 'RR', 14, 1, '95'),
(23, 'Rio Grande do Sul', 'RS', 43, 1, '53,54,55,51'),
(24, 'Santa Catarina', 'SC', 42, 1, '47,48,49'),
(25, 'Sergipe', 'SE', 28, 1, '79'),
(26, 'São Paulo', 'SP', 35, 1, '11,12,13,14,15,16,17,18,19'),
(27, 'Tocantins', 'TO', 17, 1, '63'),
(99, 'Exterior', 'EX', 99, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `cod_categoria` int(11) NOT NULL,
  `categoria` varchar(150) COLLATE utf8_bin NOT NULL,
  `categoria_data_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `categoria_cadastrado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`cod_categoria`, `categoria`, `categoria_data_hora`, `categoria_cadastrado_por`) VALUES
(3, 'imobi', '2021-09-30 19:54:13', 13),
(4, 'info', '2021-09-30 19:54:17', 13),
(5, 'car', '2021-09-30 19:54:22', 13);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_dados`
--

CREATE TABLE `tbl_dados` (
  `codDadosEmpresa` int(11) NOT NULL,
  `codUsuarioEmpresa` int(11) NOT NULL,
  `razao` varchar(150) COLLATE utf8_bin NOT NULL,
  `nomeEmpresa` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(150) COLLATE utf8_bin NOT NULL,
  `cpf_cnpj` int(11) NOT NULL,
  `inscricaoEstadual` int(11) NOT NULL,
  `representante` varchar(150) COLLATE utf8_bin NOT NULL,
  `bairro` varchar(150) COLLATE utf8_bin NOT NULL,
  `endereco` varchar(11) COLLATE utf8_bin NOT NULL,
  `cidade` varchar(11) COLLATE utf8_bin NOT NULL,
  `estado` varchar(11) COLLATE utf8_bin NOT NULL,
  `cep` varchar(10) COLLATE utf8_bin NOT NULL,
  `fone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tbl_dados`
--

INSERT INTO `tbl_dados` (`codDadosEmpresa`, `codUsuarioEmpresa`, `razao`, `nomeEmpresa`, `email`, `cpf_cnpj`, `inscricaoEstadual`, `representante`, `bairro`, `endereco`, `cidade`, `estado`, `cep`, `fone`) VALUES
(4, 13, 'bruno@bruno.com', 'bruno', 'bruno@bruno.com', 2147483647, 1231233, 'bruno', 'bruno123', 'rua brunoo', 'cerq', '18', '18760-40', 123);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_favoritos`
--

CREATE TABLE `tbl_favoritos` (
  `cod_favorito` int(11) NOT NULL,
  `favorito_usuario` int(11) NOT NULL,
  `favorito_produto` int(11) NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_horario_atendimento`
--

CREATE TABLE `tbl_horario_atendimento` (
  `codHorario` int(11) NOT NULL,
  `codLogin` int(11) NOT NULL,
  `diaSemana` int(11) NOT NULL,
  `horarioInicio` time NOT NULL,
  `horarioFim` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_login`
--

CREATE TABLE `tbl_login` (
  `cod_login` int(11) NOT NULL,
  `nome` varchar(150) COLLATE utf8_bin NOT NULL,
  `email` varchar(150) COLLATE utf8_bin NOT NULL,
  `numero` varchar(15) COLLATE utf8_bin NOT NULL,
  `senha` varchar(50) COLLATE utf8_bin NOT NULL,
  `foto` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `tipo_usuario` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `status_login` int(11) NOT NULL,
  `cod_ativacao` varchar(150) COLLATE utf8_bin NOT NULL,
  `login_data_criacao` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Extraindo dados da tabela `tbl_login`
--

INSERT INTO `tbl_login` (`cod_login`, `nome`, `email`, `numero`, `senha`, `foto`, `tipo_usuario`, `status_login`, `cod_ativacao`, `login_data_criacao`) VALUES
(9, 'bruno', 'bruno@gmail.com', '976564433', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'user', 0, '', '2021-09-02 19:50:35'),
(10, '12345', '124344@gmail.com', '124345676', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'user', 1, '', '2021-09-02 19:53:00'),
(11, 'bruno', 'bruno1@gmail.com', '999999999', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'user', 1, '', '2021-09-02 21:35:07'),
(12, 'bruno33223', 'bruno33@gmail.com', '(33) 3333-2222', 'e10adc3949ba59abbe56e057f20f883e', NULL, 'user', 1, '', '2021-09-02 22:29:56'),
(13, 'bruno', 'bruno@bruno.com', '876354431', '31df4e2c73a3278c81ef985ef2024183', NULL, 'user', 1, '', '2021-09-30 19:08:18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_logs`
--

CREATE TABLE `tbl_logs` (
  `cod_log` int(11) NOT NULL,
  `acao` varchar(250) COLLATE utf8_bin NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_produto`
--

CREATE TABLE `tbl_produto` (
  `cod_produto` int(11) NOT NULL,
  `categoria_produto` int(11) NOT NULL,
  `nome_produto` varchar(150) COLLATE utf8_bin NOT NULL,
  `preco` float NOT NULL,
  `descricao` varchar(250) COLLATE utf8_bin NOT NULL,
  `imagem` varchar(250) COLLATE utf8_bin NOT NULL,
  `produto_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`cod_categoria`);

--
-- Índices para tabela `tbl_dados`
--
ALTER TABLE `tbl_dados`
  ADD PRIMARY KEY (`codDadosEmpresa`);

--
-- Índices para tabela `tbl_favoritos`
--
ALTER TABLE `tbl_favoritos`
  ADD PRIMARY KEY (`cod_favorito`);

--
-- Índices para tabela `tbl_horario_atendimento`
--
ALTER TABLE `tbl_horario_atendimento`
  ADD PRIMARY KEY (`codHorario`);

--
-- Índices para tabela `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`cod_login`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `tbl_logs`
--
ALTER TABLE `tbl_logs`
  ADD PRIMARY KEY (`cod_log`);

--
-- Índices para tabela `tbl_produto`
--
ALTER TABLE `tbl_produto`
  ADD PRIMARY KEY (`cod_produto`),
  ADD KEY `fk_categoria` (`categoria_produto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `cod_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tbl_dados`
--
ALTER TABLE `tbl_dados`
  MODIFY `codDadosEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tbl_favoritos`
--
ALTER TABLE `tbl_favoritos`
  MODIFY `cod_favorito` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbl_horario_atendimento`
--
ALTER TABLE `tbl_horario_atendimento`
  MODIFY `codHorario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `cod_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `tbl_logs`
--
ALTER TABLE `tbl_logs`
  MODIFY `cod_log` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbl_produto`
--
ALTER TABLE `tbl_produto`
  MODIFY `cod_produto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbl_produto`
--
ALTER TABLE `tbl_produto`
  ADD CONSTRAINT `fk_categoria` FOREIGN KEY (`categoria_produto`) REFERENCES `tbl_categoria` (`cod_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
