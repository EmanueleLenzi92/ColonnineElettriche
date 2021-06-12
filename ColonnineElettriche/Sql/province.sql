-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Lug 03, 2019 alle 12:08
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
-- Struttura della tabella `province`
--

CREATE TABLE `province` (
  `id_province` int(16) NOT NULL,
  `nome_province` varchar(128) NOT NULL,
  `sigla_province` varchar(5) NOT NULL,
  `regione_province` varchar(128) DEFAULT NULL,
  `latitudine` varchar(20) NOT NULL,
  `longitudine` varchar(20) NOT NULL,
  `gruppo` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `province`
--

INSERT INTO `province` (`id_province`, `nome_province`, `sigla_province`, `regione_province`, `latitudine`, `longitudine`, `gruppo`) VALUES
(1, 'Agrigento', 'AG', 'Sicilia', '37.3122991', '13.57465', 1),
(2, 'Alessandria', 'AL', 'Piemonte', '44.9129225', '8.615321', 0),
(3, 'Ancona', 'AN', 'Marche', '43.6170137', '13.5170982', 0),
(4, 'Arezzo', 'AR', 'Toscana', '43.4628957', '11.8781675', 0),
(5, 'Ascoli Piceno', 'AP', 'Marche', '42.8546185', '13.5755038', 0),
(6, 'Asti', 'AT', 'Piemonte', '44.900542', '8.2068876', 0),
(7, 'Avellino', 'AV', 'Campania', '40.9141958', '14.7888764', 0),
(8, 'Bari', 'BA', 'Puglia', '41.1257843', '16.8620293', 0),
(9, 'Barletta', 'BT', 'Puglia', '41.3214976', '16.2868696', 0),
(10, 'Belluno', 'BL', 'Veneto', '46.1397378', '12.2192968', 0),
(11, 'Benevento', 'BN', 'Campania', '41.1295587', '14.7824639', 0),
(12, 'Bergamo', 'BG', 'Lombardia', '45.6944947', '9.6698727', 0),
(13, 'Biella', 'BI', 'Piemonte', '45.5664109', '8.0542758', 0),
(14, 'Bologna', 'BO', 'Emilia-Romagna', '44.4936714', '11.3430347', 0),
(15, 'Bolzano', 'BZ', 'Trentino-Alto Adige', '46.4981125', '11.3547801', 0),
(16, 'Brescia', 'BS', 'Lombardia', '45.5398022', '10.2200214', 0),
(17, 'Brindisi', 'BR', 'Puglia', '40.6395295', '17.945526', 0),
(18, 'Cagliari', 'CA', 'Sardegna', '39.2169525', '9.1128513', 2),
(19, 'Caltanissetta', 'CL', 'Sicilia', '37.4899412', '14.0631618', 1),
(20, 'Campobasso', 'CB', 'Molise', '41.5597935', '14.6602725', 0),
(21, 'Carbonia', 'CI', 'Sardegna', '39.165332', '8.527834', 2),
(22, 'Caserta', 'CE', 'Campania', '41.0820827', '14.334708', 0),
(23, 'Catania', 'CT', 'Sicilia', '37.5022355', '15.08738', 1),
(24, 'Catanzaro', 'CZ', 'Calabria', '38.9076353', '16.5960465', 0),
(25, 'Chieti', 'CH', 'Abruzzo', '42.3446529', '14.1659738', 0),
(26, 'Como', 'CO', 'Lombardia', '45.81082', '9.086044', 0),
(27, 'Cosenza', 'CS', 'Calabria', '39.3099931', '16.2501929', 0),
(28, 'Cremona', 'CR', 'Lombardia', '45.1334796', '10.0248716', 0),
(29, 'Crotone', 'KR', 'Calabria', '39.0806223', '17.127196', 0),
(30, 'Cuneo', 'CN', 'Piemonte', '44.3895925', '7.5478945', 0),
(31, 'Enna', 'EN', 'Sicilia', '37.5667573', '14.2807473', 1),
(32, 'Fermo', 'FM', 'Marche', '43.1604184', '13.7161408', 0),
(33, 'Ferrara', 'FE', 'Emilia-Romagna', '44.8372737', '11.6186451', 0),
(34, 'Firenze', 'FI', 'Toscana', '43.7698712', '11.2555757', 0),
(35, 'Foggia', 'FG', 'Puglia', '41.4623447', '15.5430624', 0),
(36, 'Forlì', 'FC', 'Emilia-Romagna', '44.2226017', '12.0409384', 0),
(37, 'Frosinone', 'FR', 'Lazio', '41.6419807', '13.3469287', 0),
(38, 'Genova', 'GE', 'Liguria', '44.40726', '8.9338624', 0),
(39, 'Gorizia', 'GO', 'Friuli-Venezia Giulia', '45.9441278', '13.6252288', 0),
(40, 'Grosseto', 'GR', 'Toscana', '42.7597261', '11.1137389', 0),
(41, 'Imperia', 'IM', 'Liguria', '43.8862958', '8.0267106', 0),
(42, 'Isernia', 'IS', 'Molise', '41.600216', '14.238217', 0),
(43, 'L\'Aquila', 'AQ', 'Abruzzo', '45.0297323', '7.265821', 0),
(44, 'La Spezia', 'SP', 'Liguria', '44.107033', '9.8282255', 0),
(45, 'Latina', 'LT', 'Lazio', '41.4672589', '12.9035737', 0),
(46, 'Lecce', 'LE', 'Puglia', '40.3570373', '18.1718482', 0),
(47, 'Lecco', 'LC', 'Lombardia', '45.8553764', '9.389605', 0),
(48, 'Livorno', 'LI', 'Toscana', '43.5507411', '10.3091456', 0),
(49, 'Lodi', 'LO', 'Lombardia', '45.3138959', '9.503263', 0),
(50, 'Lucca', 'LU', 'Toscana', '43.8428381', '10.502876', 0),
(51, 'Macerata', 'MC', 'Marche', '43.3007275', '13.4535897', 0),
(52, 'Mantova', 'MN', 'Lombardia', '45.1566683', '10.7917191', 0),
(53, 'Massa', 'MS', 'Toscana', '44.0359323', '10.1395519', 0),
(54, 'Matera', 'MT', 'Basilicata', '40.668523', '16.601585', 0),
(56, 'Messina', 'ME', 'Sicilia', '38.1937571', '15.5542082', 1),
(57, 'Milano', 'MI', 'Lombardia', '45.4667971', '9.1904984', 0),
(58, 'Modena', 'MO', 'Emilia-Romagna', '44.6458885', '10.9255707', 0),
(59, 'Monza', 'MB', 'Lombardia', '45.5834418', '9.2735257', 0),
(60, 'Napoli', 'NA', 'Campania', '40.8359336', '14.2487826', 0),
(61, 'Novara', 'NO', 'Piemonte', '45.4464036', '8.619655', 0),
(62, 'Nuoro', 'NU', 'Sardegna', '40.3210601', '9.3297339', 2),
(64, 'Olbia', 'OT', 'Sardegna', '40.9543293', '9.47614014606825', 2),
(65, 'Oristano', 'OR', 'Sardegna', '39.9059497', '8.5916112', 2),
(66, 'Padova', 'PD', 'Veneto', '45.4077172', '11.8734455', 0),
(67, 'Palermo', 'PA', 'Sicilia', '38.1112268', '13.3524434', 1),
(68, 'Parma', 'PR', 'Emilia-Romagna', '44.8013678', '10.3280833', 0),
(69, 'Pavia', 'PV', 'Lombardia', '45.1860043', '9.1546375', 0),
(70, 'Perugia', 'PG', 'Umbria', '43.1119613', '12.3890104', 0),
(71, 'Pesaro', 'PU', 'Marche', '43.9098114', '12.9131228', 0),
(72, 'Pescara', 'PE', 'Abruzzo', '42.469613', '14.2059269', 0),
(73, 'Piacenza', 'PC', 'Emilia-Romagna', '45.0534751', '9.6947461', 0),
(74, 'Pisa', 'PI', 'Toscana', '43.7159395', '10.4018624', 0),
(75, 'Pistoia', 'PT', 'Toscana', '43.9336213', '10.9174238', 0),
(76, 'Pordenone', 'PN', 'Friuli-Venezia Giulia', '45.9562503', '12.6597197', 0),
(77, 'Potenza', 'PZ', 'Basilicata', '40.6384046', '15.8022077', 0),
(78, 'Prato', 'PO', 'Toscana', '43.880598', '11.0969262', 0),
(79, 'Ragusa', 'RG', 'Sicilia', '36.9219828', '14.7213455', 1),
(80, 'Ravenna', 'RA', 'Emilia-Romagna', '44.4161414', '12.2017617', 0),
(81, 'Reggio Calabria', 'RC', 'Calabria', '38.1035389', '15.6397556', 0),
(82, 'Reggio Emilia', 'RE', 'Emilia-Romagna', '44.6978446', '10.6304958', 0),
(83, 'Rieti', 'RI', 'Lazio', '42.4016906', '12.8629993', 0),
(84, 'Rimini', 'RN', 'Emilia-Romagna', '44.0593886', '12.5684371', 0),
(85, 'Roma', 'RM', 'Lazio', '41.894802', '12.4853384', 0),
(86, 'Rovigo', 'RO', 'Veneto', '45.0698166', '11.78882', 0),
(87, 'Salerno', 'SA', 'Campania', '40.6803601', '14.7594542', 0),
(88, 'Sassari', 'SS', 'Sardegna', '40.7232643', '8.5610074', 2),
(89, 'Savona', 'SV', 'Liguria', '44.3080251', '8.4810315', 0),
(90, 'Siena', 'SI', 'Toscana', '43.3185536', '11.3316533', 0),
(91, 'Siracusa', 'SR', 'Sicilia', '37.0646139', '15.2907196', 1),
(92, 'Sondrio', 'SO', 'Lombardia', '46.1709447', '9.8767107', 0),
(93, 'Taranto', 'TA', 'Puglia', '40.4712427', '17.2432278', 0),
(94, 'Teramo', 'TE', 'Abruzzo', '42.6612893', '13.6983524', 0),
(95, 'Terni', 'TR', 'Umbria', '42.5641417', '12.6405466', 0),
(96, 'Torino', 'TO', 'Piemonte', '45.0677551', '7.6824892', 0),
(97, 'Trapani', 'TP', 'Sicilia', '38.0174321', '12.515992', 1),
(98, 'Trento', 'TN', 'Trentino-Alto Adige', '46.0664228', '11.1257601', 0),
(99, 'Treviso', 'TV', 'Veneto', '45.6658505', '12.2455414', 0),
(100, 'Trieste', 'TS', 'Friuli-Venezia Giulia', '45.6500335', '13.7706559', 0),
(101, 'Udine', 'UD', 'Friuli-Venezia Giulia', '46.0634632', '13.2358377', 0),
(102, 'Aosta', 'AO', 'Valle d\'Aosta', '45.7370885', '7.3196649', 0),
(103, 'Varese', 'VA', 'Lombardia', '45.8175359', '8.8263438', 0),
(104, 'Venezia', 'VE', 'Veneto', '45.4371908', '12.3345898', 0),
(105, 'Verbano', 'VB', 'Piemonte', '45.8874507', '8.71875772839886', 0),
(106, 'Vercelli', 'VC', 'Piemonte', '45.3251557', '8.4227666', 0),
(107, 'Verona', 'VR', 'Veneto', '45.4384958', '10.9924122', 0),
(108, 'Vibo Valentia', 'VV', 'Calabria', '38.677407', '16.0924801', 0),
(109, 'Vicenza', 'VI', 'Veneto', '45.5488306', '11.5478825', 0),
(110, 'Viterbo', 'VT', 'Lazio', '42.4164974', '12.1039438', 0);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id_province`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `province`
--
ALTER TABLE `province`
  MODIFY `id_province` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
