-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Апр 27 2022 г., 08:06
-- Версия сервера: 5.7.21-20-beget-5.7.21-20-1-log
-- Версия PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sitenk03_surgu`
--

-- --------------------------------------------------------

--
-- Структура таблицы `department`
--
-- Создание: Апр 27 2022 г., 05:06
-- Последнее обновление: Апр 27 2022 г., 05:06
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(10) NOT NULL COMMENT 'id кафедры',
  `institute` int(10) DEFAULT NULL COMMENT 'id института',
  `department` varchar(128) NOT NULL COMMENT 'Название кафедры',
  `number` varchar(128) NOT NULL COMMENT 'Номер телефона кафедры',
  `e-mail` varchar(128) NOT NULL COMMENT 'e-mail кафедры',
  `http` varchar(128) NOT NULL COMMENT 'Ссылка на сайт кафедры',
  `office` varchar(32) NOT NULL COMMENT 'Номер аудитории кафедры',
  `num` int(4) NOT NULL COMMENT 'Дополнительный ключ'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `department`
--

INSERT INTO `department` (`id`, `institute`, `department`, `number`, `e-mail`, `http`, `office`, `num`) VALUES
(1, 1, 'Кафедра уголовного права и процесса', '+7 (3462) 76-29-34, +7 (3462) 76-28-93', 'diadkin_ds@surgu.ru, zhdanova_vs@surgu.ru', 'http://www.surgu.ru/instituty/institut-gosudarstva-i-prava/kafedry/kafedra-ugolovnogo-prava-i-protsessa/obschaya-informatsiya', '', 1),
(2, NULL, 'Кафедра теории и истории государства и права', '+7 (3462) 76-28-94, +7 (3462) 76-28-93', 'nikonova_np@surgu.ru, rasskazova_ea@surgu.ru', 'http://www.surgu.ru/instituty/institut-gosudarstva-i-prava/kafedry/kafedra-teorii-i-istorii-gosudarstva-i-prava/obschaya-informa', '', 2),
(3, NULL, 'Кафедра государственного и муниципального права', '+7 (3462) 76-28-91, +7 (3462) 76-28-92', 'filippova_na@surgu.ru, ganus_mv@surgu.ru', 'http://www.surgu.ru/instituty/institut-gosudarstva-i-prava/kafedry/kafedra-gosudarstvennogo-i-munitsipalnogo-prava/obschaya-info', '', 3),
(4, NULL, 'Кафедра гражданско-правовых дисциплин и трудового права', '+7 (3462) 76-28-95, +7 (3462) 76-29-96', 'charkovskaya_ni@surgu.ru, valeeva_os@surgu.ru', 'http://www.surgu.ru/instituty/institut-gosudarstva-i-prava/kafedry/kafedra-grazhdansko-pravovyh-distsiplin-i-trudovogo-prava/obs', '', 4),
(5, NULL, 'Кафедра политико-правовых дисциплин', '+7 (3462) 76-31-19', 'ushakova_nv@surgu.ru, alirzaeva_ut@surgu.ru', 'http://www.surgu.ru/instituty/institut-gosudarstva-i-prava/kafedry/kafedra-politiko-pravovyh-distsiplin/obschaya-informatsiya', '', 5),
(6, NULL, 'Кафедра философии и права', '+7 (3462) 76-30-12', 'philpravo@surgu.ru', 'http://www.surgu.ru/instituty/institut-gosudarstva-i-prava/kafedry/kafedra-filosofii-i-prava/obschaya-informatsiya', '', 6),
(7, NULL, 'Кафедра истории России', '+7 (3462) 76-30-34', 'kirilyuk_dv@surgu.ru; chizhik_kv@surgu.ru', 'http://www.surgu.ru/instituty/institut-gumanitarnogo-obrazovaniya-i-sporta/kafedry/kafedra-istorii-rossii/obschaya-informatsiya', '', 1),
(8, NULL, 'Кафедра психологии', '+7 (3462) 76–31–86', 'rodermel_ta@surgu.ru, tkachuk_av@surgu.ru', 'http://www.surgu.ru/instituty/institut-gumanitarnogo-obrazovaniya-i-sporta/kafedry/kafedra-psihologii-razvitiya/obschaya-informa', '', 2),
(9, NULL, 'Кафедра медико-биологических основ физической культуры', '+7 (3462) 76-28-55', 'malkov_mn@surgu.ru, mitina_op@surgu.ru', 'http://www.surgu.ru/instituty/institut-gumanitarnogo-obrazovaniya-i-sporta/kafedry/kafedra-mediko-biologicheskih-osnov-fizichesk', '', 3),
(10, NULL, 'Кафедра физической культуры', '+7 (3462) 76-28-20, +7 (3462) 76-30-77', 'peshkova_nv@surgu.ru, sankina_ns@surgu.ru', 'http://www.surgu.ru/instituty/institut-gumanitarnogo-obrazovaniya-i-sporta/kafedry/kafedra-fizicheskoy-kultury/obschaya-informat', '', 4),
(11, NULL, 'Кафедра спортивных дисциплин', '+7 (3462) 76-28-20', 'osm58_ksd@mail.ru', 'http://www.surgu.ru/instituty/institut-gumanitarnogo-obrazovaniya-i-sporta/kafedry/kafedra-sportivnyh-distsiplin/obschaya-inform', '', 5),
(12, NULL, 'Кафедра теории физической культуры', '+7 (3462) 76-28-38', 'rodionov_va@surgu.ru, golovanova_tv@surgu.ru', 'http://www.surgu.ru/instituty/institut-gumanitarnogo-obrazovaniya-i-sporta/kafedry/kafedra-teorii-fizicheskoy-kultury/obschaya-i', '', 6),
(13, NULL, 'Кафедра иностранных языков', '+7 (3462) 76-28-39, +7 (3462) 76-29-87', 'sergienko_na@surgu.ru, bilava_oi@surgu.ru', 'http://www.surgu.ru/instituty/institut-gumanitarnogo-obrazovaniya-i-sporta/kafedry/kafedra-inostrannyh-yazykov/obschaya-informat', '', 7),
(14, NULL, 'Кафедра лингвистики и переводоведения', '+7 (3462) 76-29-35, +7 (3462) 76-28-40', 'kurbanov_ia@surgu.ru, vishnyagova_ep@surgu.ru', 'http://www.surgu.ru/instituty/institut-gumanitarnogo-obrazovaniya-i-sporta/kafedry/kafedra-lingvistiki-i-perevodovedeniya/obscha', '', 8),
(15, NULL, 'Кафедра педагогики', '+7 (3462) 76-28-41, +7 (3462) 76-28-35', 'demchuk_av@surgu.ru, kravchenko_ve@surgu.ru', 'http://www.surgu.ru/instituty/institut-gumanitarnogo-obrazovaniya-i-sporta/kafedry/kafedra-pedagogiki/obschaya-informatsiya', '', 9),
(16, NULL, 'Кафедра режиссуры', '+7 (3462) 76-28-00', 'shevkunov_an@surgu.ru, tyrgola_av@surgu.ru', 'http://www.surgu.ru/instituty/institut-gumanitarnogo-obrazovaniya-i-sporta/kafedry/kafedra-rezhissury/obschaya-informatsiya', '', 10),
(17, NULL, 'Кафедра химии', '+7 (3462) 76-30-83', 'sevastyanova_ev@surgu.ru, strelnikova_tp@surgu.ru', 'http://www.surgu.ru/instituty/institut-estestvennyh-i-tehnicheskih-nauk/kafedry/kafedra-himii/obschaya-informatsiya', '', 1),
(18, NULL, 'Кафедра безопасности жизнедеятельности', '+7 (3462) 76-31-16, +7 (3462) 76-30-96', 'majstrenko_ev@surgu.ru, kozhuhova_ni@surgu.ru', 'http://www.surgu.ru/instituty/institut-estestvennyh-i-tehnicheskih-nauk/kafedry/kafedra-bezopasnosti-zhiznedeyatelnosti/obschaya', '', 2),
(19, NULL, 'Кафедра экологии и биофизики', '+7 (3462) 76-31-60, +7 (3462) 76-31-58', 'kukurichkin_gm@surgu.ru, provorova_ov@surgu.ru', 'http://www.surgu.ru/instituty/institut-estestvennyh-i-tehnicheskih-nauk/kafedry/kafedra-ekologii/obschaya-informatsiya', '', 3),
(20, NULL, 'Кафедра биологии и биотехнологии', '+7 (3462) 76-31-59, +7 (3462) 76-31-57', 'bernikov_ka@surgu.ru, yampolskaya_td@surgu.ru', 'http://www.surgu.ru/instituty/institut-estestvennyh-i-tehnicheskih-nauk/kafedry/kafedra-biologii-i-biotehnologii/obschaya-inform', '', 4),
(21, NULL, 'Кафедра экономических и учетных дисциплин', '+7 (3462) 76-28-73, +7 (3462) 76-28-74', 'puchkova_nv@surgu.ru, brylina_ar@surgu.ru', 'http://www.surgu.ru/instituty/institut-ekonomiki-i-upravleniya/kafedry/kafedra-ekonomocheskih-i-uchetnyh-disciplin/obschaya-info', 'K611, K617, K618', 1),
(22, NULL, 'Кафедра финансов, денежного обращения и кредита', '+7 (3462) 76-28-71, +7 (3462) 76-28-72', 'karataev_as@surgu.ru, timoshenko_jum@surgu.ru', 'http://www.surgu.ru/instituty/institut-ekonomiki-i-upravleniya/kafedry/kafedra-finansov-denezhnogo-obrascheniya-i-kredita/obscha', '', 2),
(23, NULL, 'Кафедра государственного, муниципального управления и управления персоналом', '+7 (3462) 76-28-87, +7 (3462) 76-28-88', 'khadasevich_nr@surgu.ru, kafgmuup@surgu.ru', 'http://www.surgu.ru/instituty/institut-ekonomiki-i-upravleniya/kafedry/kafedra-gosudarstvennogo-munitsipalnogo-upravleniya-i-upr', '', 3),
(24, NULL, 'Кафедра меджемента и бизнеса', '+7 (3462) 76-28-82, +7 (3462) 76-28-89', 'shirinkina_ev@surgu.ru, kanareiko_da@surgu.ru', 'http://www.surgu.ru/instituty/institut-ekonomiki-i-upravleniya/kafedry/kafedra-menedzhmenta-i-biznesa/obschaya-informatsiya', 'K522', 4),
(25, NULL, 'Кафедра морфологии и физиологии', '76-30-61, 76-30-64, 76-30-60', 'stolyarov_vv@surgu.rul.ru, morfology408@rambler.ru', 'http://www.surgu.ru/instituty/meditsinskiy-institut/kafedry/kafedra-morfologii/obschaya-informatsiya', '', 1),
(26, NULL, 'Кафедра патофизиологии и общей патологии', '+7 (3462) 76-30-59', 'pathology528@mail.ru', 'http://www.surgu.ru/instituty/meditsinskiy-institut/kafedry/kafedra-patofiziologii-i-obschey-patologii/obschaya-informatsiya', '', 2),
(27, NULL, 'Кафедра хирургических болезней', '+7 (3462) 52-74-50', 'suhoikovael@surgutokb.ru', 'http://www.surgu.ru/instituty/meditsinskiy-institut/kafedry/kafedra-gospitalnoy-hirurgii/obschaya-informatsiya', '', 3),
(28, NULL, 'Кафедра внутренних болезней', '+7 (3462) 52-73-72', 'vnbolezni@mail.ru', 'http://www.surgu.ru/instituty/meditsinskiy-institut/kafedry/kafedra-vnutrennih-bolezney/obschaya-informatsiya', '', 4),
(29, NULL, 'Кафедра детских болезней', '+7 (9227) 98-02-03', 'kafedraDBsurgu@yandex.ru', 'http://www.surgu.ru/instituty/meditsinskiy-institut/kafedry/kafedra-detskih-bolezney/obschaya-informatsiya', '', 5),
(31, NULL, 'Кафедра акушерства, гинекологии и перинатологии', '+7 (3462) 52-97-46, 76-30-52', 'u.mayer@surgut-kpc.ru', 'http://www.surgu.ru/instituty/meditsinskiy-institut/kafedry/kafedra-akusherstva-ginekologii-i-perinatologii/obschaya-informatsiy', '', 6),
(32, NULL, 'Кафедра кардиологии', 'Пока нет информации.', 'Пока нет информации.', 'http://www.surgu.ru/instituty/meditsinskiy-institut/kafedry/kafedra-kardiologii/obschaya-informatsiya', '', 7),
(33, NULL, 'Кафедра многопрофильной клинической подготовки', '+7 (3462) 52-74-83', 'kmkp_18@mail.ru', 'http://www.surgu.ru/instituty/meditsinskiy-institut/kafedry/kafedra-mnogoprofilnoy-klinicheskoy-podgotovki/obschaya-informatsiya', '', 8),
(34, NULL, 'Кафедра автоматики и компьютерных систем (АиКС)', '+7 (3462) 76-31-25, +7 (3462) 76-31-26', 'zapevalov_av@surgu.ru, medvedeva_na@surgu.ru, kuzin_da@surgu.ru', 'http://www.surgu.ru/instituty/politehnicheskiy-institut/kafedry/kafedra-avtomatiki-i-kompyuternyh-sistem/obschaya-informatsiya', '', 1),
(35, NULL, 'Кафедра экспериментальной физики (ЭФ)', '+7 (3462) 76-31-23', 'elnikov_av@surgu.ru, kotelnikova_nv@surgu.ru', 'http://www.surgu.ru/instituty/politehnicheskiy-institut/kafedry/kafedra-eksperimentalnoy-fiziki/obschaya-informatsiya', '', 2),
(36, NULL, 'Кафедра радиоэлектроники и электроэнергетики (РЭЭ)', '+7 (3462) 76-31-24', 'ryzhakov_vv@surgu.ru, kuzina_ti@surgu.ru', 'http://www.surgu.ru/instituty/politehnicheskiy-institut/kafedry/kafedra-radioelektroniki-i-elektroenergetiki/obschaya-informatsi', '', 3),
(37, NULL, 'Кафедра прикладной математики (ПМ)', '+7 (3462) 76-31-07, +7 (3462) 76-31-08', 'gorelikov_av@surgu.ru', 'http://www.surgu.ru/instituty/politehnicheskiy-institut/kafedry/kafedra-prikladnoy-matematiki/obschaya-informatsiya', '', 4),
(38, NULL, 'Кафедра высшей математики (ВМ)', '+7 (3462) 76-31-04', 'gordeeva_aa@surgu.ru', 'http://www.surgu.ru/instituty/politehnicheskiy-institut/kafedry/kafedra-vysshey-matematiki/obschaya-informatsiya', '', 5),
(39, NULL, 'Кафедра информатики и вычислительной техники (ИВТ)', '+7 (3462) 76-31-05, +7 (3462) 76-31-06', 'egorov_aa@surgu.ru, dobrovolskaya_ar@surgu.ru', 'http://www.surgu.ru/instituty/politehnicheskiy-institut/kafedry/kafedra-informatiki-i-vychislitelnoy-tehniki/obschaya-informatsi', '', 6),
(40, NULL, 'Кафедра автоматизированных систем обработки \"                 \"информации и управления (АСОИиУ)', '+7 (3462) 76-31-11, 76-31-12', 'bushmeleva_ki@surgu.ru, kalachikova_ep@surgu.ru', 'http://www.surgu.ru/instituty/politehnicheskiy-institut/kafedry/kafedra-avtomatizirovannyh-sistem-obrabotki-informatsii-i-upravl', '', 7),
(41, NULL, 'Кафедра строительных технологий и конструкций (СТиК)', '+7 (3462) 76-29-45, +7 (3462) 76-30-03, +7 (3462) 76-31-80', 'galiev_im@surgu.ru, gorynin_gl@surgu.ru, angova_av@surgu.ru', 'http://www.surgu.ru/instituty/politehnicheskiy-institut/kafedry/kafedra-stroitelnyh-tehnologiy-i-konstruktsiy/obschaya-informats', '', 8);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institute` (`institute`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`institute`) REFERENCES `Institute` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
