-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Giu 11, 2019 alle 23:26
-- Versione del server: 10.1.26-MariaDB
-- Versione PHP: 7.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `colonnine`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `consumi_auto`
--

CREATE TABLE `consumi_auto` (
  `id` int(11) NOT NULL,
  `modello` varchar(50) COLLATE utf8_bin NOT NULL,
  `batteria_kWh` float(10,0) NOT NULL,
  `prezzo` int(100) NOT NULL,
  `Km_con_un_pieno` float NOT NULL,
  `Costo_un_pieno` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dump dei dati per la tabella `consumi_auto`
--

INSERT INTO `consumi_auto` (`id`, `modello`, `batteria_kWh`, `prezzo`, `Km_con_un_pieno`, `Costo_un_pieno`) VALUES
(1, 'Tesla Model S', 100, 118400, 600, 40),
(2, 'Tesla Model X', 100, 123300, 565, 40),
(3, 'Renault Zoe', 41, 25000, 380, 16),
(4, 'Volkswagen e-Golf', 35, 38000, 300, 14),
(5, 'Hyundai IONIQ', 0, 36750, 280, 11),
(6, 'Nissan Leaf', 30, 29855, 250, 12),
(7, 'Kia Soul EV', 27, 37000, 210, 11),
(8, 'BMW i3', 33, 37000, 200, 13),
(9, 'Nissan e-NV200', 24, 25855, 170, 9);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `consumi_auto`
--
ALTER TABLE `consumi_auto`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `consumi_auto`
--
ALTER TABLE `consumi_auto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
