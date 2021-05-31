-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Mag 31, 2021 alle 08:20
-- Versione del server: 10.4.14-MariaDB
-- Versione PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `maturità`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `atleta`
--

CREATE TABLE `atleta` (
  `nome` char(20) NOT NULL,
  `cognome` char(20) NOT NULL,
  `punteggio` int(11) NOT NULL,
  `cf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `atleta`
--

INSERT INTO `atleta` (`nome`, `cognome`, `punteggio`, `cf`) VALUES
('Dario', 'Tonetti', 0, 1),
('Nicolò', 'Provenzano', 0, 2),
('Leonardo', 'Difrancesco', 0, 3),
('Simone', 'Scavezzon', 0, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `costruttore`
--

CREATE TABLE `costruttore` (
  `codC` int(11) NOT NULL,
  `nome` char(20) NOT NULL,
  `paese` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `costruttore`
--

INSERT INTO `costruttore` (`codC`, `nome`, `paese`) VALUES
(11, 'Ferrari', 'Italia'),
(12, 'Lamborghini', 'Italia'),
(13, 'Ferrari', 'Italia'),
(14, 'Ferrari', 'Italia');

-- --------------------------------------------------------

--
-- Struttura della tabella `ga`
--

CREATE TABLE `ga` (
  `nome_gara` char(20) NOT NULL,
  `cf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `ga`
--

INSERT INTO `ga` (`nome_gara`, `cf`) VALUES
('Bonneville Speed Wee', 1),
('Bonneville Speed Wee', 2),
('Bonneville Speed Wee', 3),
('Enduropale du Touque', 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `gara`
--

CREATE TABLE `gara` (
  `nome_gara` char(20) NOT NULL,
  `categoria` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `gara`
--

INSERT INTO `gara` (`nome_gara`, `categoria`) VALUES
('Bonneville Speed Wee', 'MX2'),
('Enduropale du Touque', 'Autos'),
('Erzbergrodeo', 'MXGP'),
('Hangtown Classic', '85BW'),
('Weston Beach Race', 'MX3');

-- --------------------------------------------------------

--
-- Struttura della tabella `gs`
--

CREATE TABLE `gs` (
  `nome_gara` char(20) NOT NULL,
  `nome_sponsor` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `gs`
--

INSERT INTO `gs` (`nome_gara`, `nome_sponsor`) VALUES
('Bonneville Speed Wee', 'MotoMatta'),
('Enduropale du Touque', 'MotoMatta'),
('Erzbergrodeo', 'MotoMatta'),
('Hangtown Classic', 'MotoMatta'),
('Weston Beach Race', 'MotoMatta');

-- --------------------------------------------------------

--
-- Struttura della tabella `moto`
--

CREATE TABLE `moto` (
  `targa` char(20) NOT NULL,
  `marca` char(20) NOT NULL,
  `modello` char(20) NOT NULL,
  `codC` int(11) NOT NULL,
  `cf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `moto`
--

INSERT INTO `moto` (`targa`, `marca`, `modello`, `codC`, `cf`) VALUES
('1', 'Ferrari', 'Ferrari', 11, 1),
('2', 'Lamborghini', 'Lamborghini', 11, 2),
('3', 'Ferrari', 'Ferrari', 11, 3),
('4', 'Ferrari', 'Ferrari', 11, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `orario`
--

CREATE TABLE `orario` (
  `orario_inizio` char(5) NOT NULL,
  `data_inizio` char(10) NOT NULL,
  `codO` int(11) NOT NULL,
  `nome_gara` char(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `orario`
--

INSERT INTO `orario` (`orario_inizio`, `data_inizio`, `codO`, `nome_gara`) VALUES
('12:00', '20/05/2021', 1, 'Bonneville Speed Wee'),
('18:00', '18/07/2022', 2, 'Enduropale du Touque'),
('11:30', '02/02/2024', 4, 'Erzbergrodeo'),
('8:00', '13/05/2021', 5, 'Hangtown Classic'),
('17:15', '25/08/2022', 6, 'Weston Beach Race'),
('18:15', '28/05/2021', 17, 'Bonneville Speed Wee'),
('13:05', '27/05/2021', 18, 'Bonneville Speed Wee');

-- --------------------------------------------------------

--
-- Struttura della tabella `sponsor`
--

CREATE TABLE `sponsor` (
  `nome_sponsor` char(20) NOT NULL,
  `percentuale` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `sponsor`
--

INSERT INTO `sponsor` (`nome_sponsor`, `percentuale`) VALUES
('MotoMatta', 15);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `atleta`
--
ALTER TABLE `atleta`
  ADD PRIMARY KEY (`cf`);

--
-- Indici per le tabelle `costruttore`
--
ALTER TABLE `costruttore`
  ADD PRIMARY KEY (`codC`);

--
-- Indici per le tabelle `ga`
--
ALTER TABLE `ga`
  ADD KEY `nome` (`nome_gara`),
  ADD KEY `cf` (`cf`);

--
-- Indici per le tabelle `gara`
--
ALTER TABLE `gara`
  ADD PRIMARY KEY (`nome_gara`);

--
-- Indici per le tabelle `gs`
--
ALTER TABLE `gs`
  ADD KEY `nome_gara` (`nome_gara`),
  ADD KEY `nome_sponsor` (`nome_sponsor`);

--
-- Indici per le tabelle `moto`
--
ALTER TABLE `moto`
  ADD PRIMARY KEY (`targa`),
  ADD KEY `codC` (`codC`),
  ADD KEY `cf` (`cf`);

--
-- Indici per le tabelle `orario`
--
ALTER TABLE `orario`
  ADD PRIMARY KEY (`codO`),
  ADD KEY `nome_gara` (`nome_gara`);

--
-- Indici per le tabelle `sponsor`
--
ALTER TABLE `sponsor`
  ADD PRIMARY KEY (`nome_sponsor`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `costruttore`
--
ALTER TABLE `costruttore`
  MODIFY `codC` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT per la tabella `orario`
--
ALTER TABLE `orario`
  MODIFY `codO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `ga`
--
ALTER TABLE `ga`
  ADD CONSTRAINT `ga_ibfk_1` FOREIGN KEY (`nome_gara`) REFERENCES `gara` (`nome_gara`),
  ADD CONSTRAINT `ga_ibfk_2` FOREIGN KEY (`cf`) REFERENCES `atleta` (`cf`);

--
-- Limiti per la tabella `gs`
--
ALTER TABLE `gs`
  ADD CONSTRAINT `gs_ibfk_1` FOREIGN KEY (`nome_gara`) REFERENCES `gara` (`nome_gara`),
  ADD CONSTRAINT `gs_ibfk_2` FOREIGN KEY (`nome_sponsor`) REFERENCES `sponsor` (`nome_sponsor`);

--
-- Limiti per la tabella `moto`
--
ALTER TABLE `moto`
  ADD CONSTRAINT `moto_ibfk_1` FOREIGN KEY (`codC`) REFERENCES `costruttore` (`codC`),
  ADD CONSTRAINT `moto_ibfk_2` FOREIGN KEY (`cf`) REFERENCES `atleta` (`cf`);

--
-- Limiti per la tabella `orario`
--
ALTER TABLE `orario`
  ADD CONSTRAINT `orario_ibfk_1` FOREIGN KEY (`nome_gara`) REFERENCES `gara` (`nome_gara`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
