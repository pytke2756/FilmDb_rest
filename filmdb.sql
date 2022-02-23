-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Jan 05. 17:27
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `filmdb`
--
CREATE DATABASE IF NOT EXISTS `filmdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `filmdb`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `filmek`
--

CREATE TABLE `filmek` (
  `id` int(11) NOT NULL,
  `cim` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `kategoria` varchar(150) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `hossz` int(3) NOT NULL,
  `ertekeles` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `filmek`
--

INSERT INTO `filmek` (`id`, `cim`, `kategoria`, `hossz`, `ertekeles`) VALUES
(1, 'Star Wars IV - Egy új remény', 'Akció, kaland, fantasy', 121, 9),
(2, 'Star Wars V - A Birodalom visszavág', 'Akció, kaland, fantasy', 124, 9),
(3, 'Star Wars VI - A Jedi visszatér', 'Akció, kaland, fantasy', 131, 8),
(4, 'A Gyűrűk Ura: A gyűrű szövetsége', 'Akció, kaland, dráma', 178, 9),
(5, 'A Gyűrűk Ura: A két torony', 'Akició, kaland, dráma', 179, 9),
(6, 'A Gyűrűk Ura: A király visszatér', 'Akció, kaland, dráma', 201, 9);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `filmek`
--
ALTER TABLE `filmek`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `filmek`
--
ALTER TABLE `filmek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
