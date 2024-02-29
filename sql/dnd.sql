-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 29 2024 г., 10:15
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dnd`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Characters`
--

CREATE TABLE `Characters` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `race_id` int NOT NULL,
  `gender_id` int NOT NULL,
  `class_id` int NOT NULL,
  `age` int NOT NULL,
  `speed` int NOT NULL,
  `level` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Cityes`
--

CREATE TABLE `Cityes` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `size_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Classes`
--

CREATE TABLE `Classes` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Genders`
--

CREATE TABLE `Genders` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Languages`
--

CREATE TABLE `Languages` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Parties`
--

CREATE TABLE `Parties` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Races`
--

CREATE TABLE `Races` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `img` longtext NOT NULL,
  `description` longtext NOT NULL,
  `base_speed` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `RacesLanguages`
--

CREATE TABLE `RacesLanguages` (
  `id` int NOT NULL,
  `race_id` int NOT NULL,
  `language_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `Sizes`
--

CREATE TABLE `Sizes` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Characters`
--
ALTER TABLE `Characters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `race_id` (`race_id`),
  ADD KEY `gender_id` (`gender_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Индексы таблицы `Cityes`
--
ALTER TABLE `Cityes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `size_id` (`size_id`);

--
-- Индексы таблицы `Classes`
--
ALTER TABLE `Classes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Genders`
--
ALTER TABLE `Genders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Languages`
--
ALTER TABLE `Languages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Parties`
--
ALTER TABLE `Parties`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Races`
--
ALTER TABLE `Races`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `RacesLanguages`
--
ALTER TABLE `RacesLanguages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `race_id` (`race_id`),
  ADD KEY `language_id` (`language_id`);

--
-- Индексы таблицы `Sizes`
--
ALTER TABLE `Sizes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Characters`
--
ALTER TABLE `Characters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Cityes`
--
ALTER TABLE `Cityes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Classes`
--
ALTER TABLE `Classes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Genders`
--
ALTER TABLE `Genders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Languages`
--
ALTER TABLE `Languages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Parties`
--
ALTER TABLE `Parties`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Races`
--
ALTER TABLE `Races`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `RacesLanguages`
--
ALTER TABLE `RacesLanguages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `Sizes`
--
ALTER TABLE `Sizes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Characters`
--
ALTER TABLE `Characters`
  ADD CONSTRAINT `characters_ibfk_1` FOREIGN KEY (`race_id`) REFERENCES `Races` (`id`),
  ADD CONSTRAINT `characters_ibfk_2` FOREIGN KEY (`gender_id`) REFERENCES `Genders` (`id`),
  ADD CONSTRAINT `characters_ibfk_3` FOREIGN KEY (`class_id`) REFERENCES `Classes` (`id`);

--
-- Ограничения внешнего ключа таблицы `Cityes`
--
ALTER TABLE `Cityes`
  ADD CONSTRAINT `cityes_ibfk_1` FOREIGN KEY (`size_id`) REFERENCES `Sizes` (`id`);

--
-- Ограничения внешнего ключа таблицы `RacesLanguages`
--
ALTER TABLE `RacesLanguages`
  ADD CONSTRAINT `raceslanguages_ibfk_1` FOREIGN KEY (`race_id`) REFERENCES `Races` (`id`),
  ADD CONSTRAINT `raceslanguages_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `Languages` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
