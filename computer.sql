-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Nov 19. 13:31
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `computer`
--
CREATE DATABASE IF NOT EXISTS `computer` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `computer`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `comp`
--

CREATE TABLE `comp` (
  `Id` char(36) NOT NULL,
  `Brand` varchar(37) DEFAULT NULL,
  `Type` varchar(30) DEFAULT NULL,
  `Display` double DEFAULT NULL,
  `Memory` int(11) DEFAULT NULL,
  `CreatedTime` datetime DEFAULT NULL,
  `OsId` char(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `os`
--

CREATE TABLE `os` (
  `Id` char(36) NOT NULL,
  `Name` varchar(27) DEFAULT NULL,
  `CreatedTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `os`
--

INSERT INTO `os` (`Id`, `Name`, `CreatedTime`) VALUES
('3876874d-fe4f-4961-b108-316bec8262a2', 'FreeDos', '2024-11-19 12:08:21'),
('488d1306-ae71-4e45-965a-dc3dbeb05657', 'Microsoft Vista Home Basic ', '2024-11-19 12:21:11'),
('4c1a3933-572b-4865-a4dd-02535ae29a55', 'Linux', '2024-11-19 12:09:07'),
('a8fb1bdb-d8ee-4ada-8634-5dbf1bd9f0e0', ' Microsoft Vista Business', '2024-11-19 12:09:27'),
('e37a6d60-0c67-4e42-8a80-09c73a127866', 'Microsoft Vista Home Premiu', '2024-11-19 13:01:01');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `comp`
--
ALTER TABLE `comp`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OsId` (`OsId`);

--
-- A tábla indexei `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`Id`);

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `comp`
--
ALTER TABLE `comp`
  ADD CONSTRAINT `comp_ibfk_1` FOREIGN KEY (`OsId`) REFERENCES `os` (`Id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
