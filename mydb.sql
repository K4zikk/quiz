-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 19 Paź 2022, 09:17
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mydb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` varchar(45) DEFAULT NULL,
  `correct` tinyint(4) DEFAULT NULL,
  `questions_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `answers`
--

INSERT INTO `answers` (`id`, `answer`, `correct`, `questions_id`) VALUES
(1, 'nie tokarz', 1, 1),
(2, 'nie budowlaniec', NULL, 1),
(3, 'nie pijaczynka', NULL, 1),
(4, 'boxdil', 1, 2),
(5, 'idelti', NULL, 2),
(6, 'zabsontoziomal', NULL, 2),
(7, '42', NULL, 3),
(8, '11', NULL, 3),
(9, '19', 1, 3),
(10, 'jasne', NULL, 4),
(11, 'nie', 1, 4),
(12, 'oczywiscie tomek jest przykladem dla klasy', NULL, 4),
(13, 'krzywe nogi', NULL, 5),
(14, 'skolioze', 1, 5),
(15, 'bolerioze', NULL, 5),
(16, 'a', 1, 6),
(17, 'h', NULL, 6),
(18, 'j', NULL, 6),
(19, 'c', 1, 6),
(20, 'b', 1, 6),
(21, 'pije amarene', 1, 7),
(22, 'zgonuje', 1, 7),
(23, 'skacze po płatkach lili wodnej', NULL, 7),
(24, 'srake ', 1, 7),
(25, 'identyfikuje sie z gołembiem', NULL, 7),
(26, 'ile chcesz', 1, 8),
(27, '6 minut', 1, 8),
(28, '30 godzin', NULL, 8),
(29, '215 lat i pół', NULL, 8),
(30, 'ma narte', 1, 9),
(31, 'ma opone zimowom kontinental', NULL, 9),
(32, 'ma rozwolnienie', NULL, 9),
(33, 'ma łyżwe', 1, 9),
(34, 'kontrabasista witold', 1, 10),
(35, 'pudełkowy', NULL, 10),
(36, 'basowy', 1, 10),
(37, 'ogulnikowy ', NULL, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answers_has_students`
--

CREATE TABLE `answers_has_students` (
  `answers_id` int(11) NOT NULL,
  `answers_questions_id` int(11) NOT NULL,
  `students_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `odpowiedzi`
--

CREATE TABLE `odpowiedzi` (
  `id` int(11) NOT NULL,
  `answer` varchar(45) DEFAULT NULL,
  `correct` varchar(45) DEFAULT NULL,
  `incorrect` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pytania`
--

CREATE TABLE `pytania` (
  `id` int(11) NOT NULL,
  `odpowiedzi_id` int(11) NOT NULL,
  `pytaniacol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `question` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `questions`
--

INSERT INTO `questions` (`id`, `question`) VALUES
(1, 'pokaż?'),
(2, 'Kto to masny Ben?'),
(3, 'Ile lat ma cezary?'),
(4, 'czy tomek bedzie w szkole?'),
(5, 'co remek ma?'),
(6, 'jakie sa pierwsze litery alfabetu?'),
(7, 'co robi tomek na dworze?'),
(8, 'ile gotuje sie jajko?'),
(9, 'adam małyżw?'),
(10, 'kontrabas basowy to instrument?');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`,`questions_id`),
  ADD KEY `fk_answers_questions` (`questions_id`);

--
-- Indeksy dla tabeli `answers_has_students`
--
ALTER TABLE `answers_has_students`
  ADD PRIMARY KEY (`answers_id`,`answers_questions_id`,`students_id`),
  ADD KEY `fk_answers_has_students_students1` (`students_id`);

--
-- Indeksy dla tabeli `odpowiedzi`
--
ALTER TABLE `odpowiedzi`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `pytania`
--
ALTER TABLE `pytania`
  ADD PRIMARY KEY (`id`,`odpowiedzi_id`),
  ADD KEY `fk_pytania_odpowiedzi_idx` (`odpowiedzi_id`);

--
-- Indeksy dla tabeli `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `fk_answers_questions` FOREIGN KEY (`questions_id`) REFERENCES `questions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `answers_has_students`
--
ALTER TABLE `answers_has_students`
  ADD CONSTRAINT `fk_answers_has_students_answers1` FOREIGN KEY (`answers_id`,`answers_questions_id`) REFERENCES `answers` (`id`, `questions_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_answers_has_students_students1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `pytania`
--
ALTER TABLE `pytania`
  ADD CONSTRAINT `fk_pytania_odpowiedzi` FOREIGN KEY (`odpowiedzi_id`) REFERENCES `odpowiedzi` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
