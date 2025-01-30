-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 12 sep. 2024 à 17:31
-- Version du serveur : 10.3.39-MariaDB-0ubuntu0.20.04.2
-- Version de PHP : 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `s10551_basevente`
--

-- --------------------------------------------------------

--
-- Structure de la table `addon_account`
--

CREATE TABLE `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `addon_account`
--

INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
('society_abatoire', 'Société abatoire', 1),
('society_agent-immo', 'Agent immobilier', 1),
('society_armurier', 'Armurier', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_bandadiaz', 'Banda Diaz', 1),
('society_benny', 'Benny', 1),
('society_burgershot', 'BurgerShot', 1),
('society_casino', 'Casino', 1),
('society_concess', 'concess', 1),
('society_concess_bateau', 'Concess Bateau', 1),
('society_concess_moto', 'Concess Moto', 1),
('society_couture', 'Société couture', 1),
('society_doa', 'DOA', 1),
('society_ems', 'EMS', 1),
('society_garage_cayo', 'Garage Cayo', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_henhouse', 'Hen House', 1),
('society_hopital_cayo', 'Hopital Cayo', 1),
('society_horny', 'Horny', 1),
('society_koi', 'Koï', 1),
('society_lscustomnord', 'LsCustom Nord', 1),
('society_lscustomsud', 'LsCustom Sud', 1),
('society_lssd', 'LSSD', 1),
('society_ltdcayo', 'LTD Cayo', 1),
('society_ltddp', 'LTD Del Perro', 1),
('society_ltdfd', 'LTD Forum Drive', 1),
('society_ltdgs', 'LTD Grove Street', 1),
('society_ltdls', 'LTD Little Seoul', 1),
('society_ltdmp', 'LTD Mirror Park', 1),
('society_milice', 'Milice', 1),
('society_mineur', 'Mineur', 1),
('society_nikkibeach', 'Nikki Beach', 1),
('society_police', 'police', 1),
('society_ssd', 'SSD', 1),
('society_swat', 'SWAT', 1),
('society_tabac', 'Tabac', 1),
('society_tacos', 'Tacos', 1),
('society_tequilala', 'Tequilala', 1),
('society_torcedor', 'Torcedor', 1),
('society_unicorn', 'Unicorn', 1),
('society_uwucafe', 'UwU Café', 1),
('society_vigneron', 'Vigneron', 1),
('society_weazelnewz', 'Weazel Newz', 1),
('society_yellowjack', 'Yellowjack', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_account_data`
--

CREATE TABLE `addon_account_data` (
  `id` int(11) NOT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(50) NOT NULL,
  `owner` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `addon_account_data`
--

INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
(66, 'society_agent-immo', 1600, NULL),
(68, 'society_burgershot', 1600, NULL),
(69, 'society_concess', 105720, NULL),
(70, 'society_horny', 1600, NULL),
(71, 'society_mineur', 2440, NULL),
(72, 'society_police', 5100, NULL),
(73, 'society_tabac', 1600, NULL),
(74, 'society_tacos', 1600, NULL),
(75, 'society_tequilala', 1600, NULL),
(76, 'society_unicorn', 1600, NULL),
(77, 'society_vigneron', 1600, NULL),
(78, 'society_yellowjack', 1600, NULL),
(79, 'society_armurier', 1600, NULL),
(80, 'society_abatoire', 1600, NULL),
(81, 'society_bahamas', 1600, NULL),
(87, 'society_ltdls', 1600, NULL),
(88, 'society_ltddp', 1600, NULL),
(89, 'society_ltdfd', 1600, NULL),
(90, 'society_ltdgs', 1600, NULL),
(91, 'society_ltdmp', 1600, NULL),
(93, 'society_benny', 9747500, NULL),
(95, 'society_lscustomsud', 14817, NULL),
(96, 'society_lscustomnord', 1600, NULL),
(97, 'society_concess_bateau', 1600, NULL),
(98, 'society_nikkibeach', 110013142, NULL),
(99, 'society_concess_moto', 1600, NULL),
(100, 'society_uwucafe', 1600, NULL),
(101, 'society_gouvernement', 1600, NULL),
(102, 'society_avocat', 1600, NULL),
(103, 'society_henhouse', 1600, NULL),
(104, 'society_ltdcayo', 1600, NULL),
(105, 'society_torcedor', 1600, NULL),
(106, 'society_ems', 1600, NULL),
(107, 'society_lssd', 1600, NULL),
(108, 'society_garage_cayo', 1600, NULL),
(109, 'society_hopital_cayo', 1600, NULL),
(110, 'society_milice', 1600, NULL),
(111, 'society_bandadiaz', 1600, NULL),
(112, 'society_casino', 1600, NULL),
(113, 'society_weazelnewz', 1600, NULL),
(117, 'society_doa', 1600, NULL),
(118, 'society_ssd', 1600, NULL),
(119, 'society_swat', 1600, NULL),
(120, 'society_koi', 1600, NULL),
(121, 'society_couture', 14, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory`
--

CREATE TABLE `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `addon_inventory`
--

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
('property', 'Propriété', 1),
('society_agent-immo', 'Agent immobilier', 1),
('society_armurier', 'Armurier', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_bandadiaz', 'Banda Diaz', 1),
('society_benny', 'Benny', 1),
('society_burgershot', 'BurgerShot', 1),
('society_casino', 'Casino', 1),
('society_concess', 'concess', 1),
('society_concess_bateau', 'Concess Bateau', 1),
('society_concess_moto', 'Concess Moto', 1),
('society_couture', 'Société couture', 1),
('society_doa', 'DOA', 1),
('society_ems', 'EMS', 1),
('society_garage_cayo', 'Garage Cayo', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_henhouse', 'Hen House', 1),
('society_hopital_cayo', 'Hôpital Cayo', 1),
('society_horny', 'Horny', 1),
('society_koi', 'Koï', 1),
('society_lscustomnord', 'LsCustom Nord', 1),
('society_lscustomsud', 'LsCustom Sud', 1),
('society_lssd', 'LSSD', 1),
('society_ltdcayo', 'LTD Cayo', 1),
('society_ltddp', 'LTD Del Perro', 1),
('society_ltdfd', 'LTD Forum Drive', 1),
('society_ltdgs', 'LTD Grove Street', 1),
('society_ltdls', 'LTD Little Seoul', 1),
('society_ltdmp', 'LTD Mirror Park', 1),
('society_milice', 'Milice', 1),
('society_mineur', 'Mineur', 1),
('society_nikkibeach', 'Nikki Beach', 1),
('society_police', 'police', 1),
('society_police_saisie', 'Saisie police', 1),
('society_police_weapon', 'Armurerie Police', 1),
('society_ssd', 'SSD', 1),
('society_swat', 'SWAT', 1),
('society_tabac', 'Tabac', 1),
('society_tacos', 'Tacos', 1),
('society_tequilala', 'Tequilala', 1),
('society_torcedor', 'Torcedor', 1),
('society_unicorn', 'Unicorn', 1),
('society_uwucafe', 'UwU Café', 1),
('society_vigneron', 'Vigneron', 1),
('society_weazelnewz', 'Weazel Newz', 1),
('society_yellowjack', 'Yellowjack', 1);

-- --------------------------------------------------------

--
-- Structure de la table `addon_inventory_items`
--

CREATE TABLE `addon_inventory_items` (
  `id` int(11) NOT NULL,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owned` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `banking`
--

CREATE TABLE `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int(64) DEFAULT NULL,
  `time` bigint(20) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `balance` int(11) DEFAULT 0,
  `label` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `banking`
--

INSERT INTO `banking` (`identifier`, `type`, `amount`, `time`, `ID`, `balance`, `label`) VALUES
('a023603b196b40b4a683b77429127786974fefc1', 'WITHDRAW', 10, 1723138019000, 1, 51594, 'WITHDRAW'),
('a023603b196b40b4a683b77429127786974fefc1', 'DEPOSIT', 10, 1723138020000, 2, 51604, 'DEPOSIT'),
('a023603b196b40b4a683b77429127786974fefc1', 'DEPOSIT', 1000000, 1723138025000, 3, 1051604, 'DEPOSIT');

-- --------------------------------------------------------

--
-- Structure de la table `banlist`
--

CREATE TABLE `banlist` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `nameplayer` varchar(50) NOT NULL,
  `nameadmin` varchar(50) NOT NULL,
  `reason` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `banlist`
--

INSERT INTO `banlist` (`id`, `identifier`, `nameplayer`, `nameadmin`, `reason`) VALUES
(2, 'a023603b196b40b4a683b77429127786974fefc1', 'Tipi Mathieu', 'Tipi Mathieu', 'mlkmlkmlklmk'),
(3, 'a023603b196b40b4a683b77429127786974fefc1', 'Tipi Mathieu', 'Tipi Mathieu', 'lkmlkmklmklm');

-- --------------------------------------------------------

--
-- Structure de la table `bansql`
--

CREATE TABLE `bansql` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `steamID` varchar(50) DEFAULT NULL,
  `liveid` varchar(50) DEFAULT NULL,
  `xblid` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `playerip` varchar(50) DEFAULT NULL,
  `nameplayer` varchar(50) DEFAULT NULL,
  `nameadmin` varchar(50) DEFAULT NULL,
  `reason` longtext DEFAULT NULL,
  `expiration` longtext DEFAULT NULL,
  `permanant` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `billing`
--

INSERT INTO `billing` (`id`, `identifier`, `sender`, `target_type`, `target`, `label`, `amount`) VALUES
(17, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a023603b196b40b4a683b77429127786974fefc1', 'society', 'society_benny', 'benny', 5000),
(19, '29a9462e64ddfed46096292b656966175087ffd9', 'a023603b196b40b4a683b77429127786974fefc1', 'society', 'society_bahamas', 'bahamas', 50000),
(28, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a023603b196b40b4a683b77429127786974fefc1', 'society', 'society_ems', 'ems', 500),
(29, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a023603b196b40b4a683b77429127786974fefc1', 'society', 'society_ems', 'ems', 500),
(30, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a023603b196b40b4a683b77429127786974fefc1', 'society', 'society_ems', 'ems', 500),
(31, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a8702ef0eb3d3166075f2cc9e6da8af4f198acfa', 'society', 'society_ems', 'ems', 10),
(32, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a8702ef0eb3d3166075f2cc9e6da8af4f198acfa', 'society', 'society_ems', 'ems', 500),
(33, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a8702ef0eb3d3166075f2cc9e6da8af4f198acfa', 'society', 'society_ems', 'ems', 500),
(34, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a8702ef0eb3d3166075f2cc9e6da8af4f198acfa', 'society', 'society_ems', 'ems', 500),
(35, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a8702ef0eb3d3166075f2cc9e6da8af4f198acfa', 'society', 'society_ems', 'ems', 500),
(36, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a8702ef0eb3d3166075f2cc9e6da8af4f198acfa', 'society', 'society_ems', 'ems', 500),
(37, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'a8702ef0eb3d3166075f2cc9e6da8af4f198acfa', 'society', 'society_ems', 'ems', 500),
(38, 'c715b44f4e18a99c992e6c0b75edddd2e6af831f', '28c4253db1bf82a66a8645b7e97de77334f61a9f', 'society', 'society_bahamas', 'bahamas', 1),
(39, 'c715b44f4e18a99c992e6c0b75edddd2e6af831f', '28c4253db1bf82a66a8645b7e97de77334f61a9f', 'society', 'society_bahamas', 'bahamas', 20);

-- --------------------------------------------------------

--
-- Structure de la table `billing_entreprise`
--

CREATE TABLE `billing_entreprise` (
  `id` int(11) NOT NULL,
  `employe` varchar(50) NOT NULL,
  `client` varchar(50) NOT NULL,
  `facture` int(11) NOT NULL,
  `raison` longtext NOT NULL,
  `job` varchar(25) NOT NULL,
  `society` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `blanchiment`
--

CREATE TABLE `blanchiment` (
  `identifier` varchar(80) NOT NULL,
  `expiration` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `blanchiment`
--

INSERT INTO `blanchiment` (`identifier`, `expiration`) VALUES
('a023603b196b40b4a683b77429127786974fefc1', 1690146365),
('d84442731b732e8a5f0502a4a9e54caa798d1037', 1690130929);

-- --------------------------------------------------------

--
-- Structure de la table `blanchiment_entreprise`
--

CREATE TABLE `blanchiment_entreprise` (
  `society` varchar(30) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `blanchiment_entreprise`
--

INSERT INTO `blanchiment_entreprise` (`society`, `expiration`) VALUES
('burgershot', 1686307622),
('ltdls', 1689870834),
('nikkibeach', 1692662182);

-- --------------------------------------------------------

--
-- Structure de la table `cardealer_vehicles`
--

CREATE TABLE `cardealer_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `chestobject`
--

CREATE TABLE `chestobject` (
  `id` int(11) NOT NULL,
  `society` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `chestobject`
--

INSERT INTO `chestobject` (`id`, `society`, `name`, `label`, `count`) VALUES
(1, 'society_police', 'weapon_pistol', 'Beretta', 1);

-- --------------------------------------------------------

--
-- Structure de la table `chestweapon`
--

CREATE TABLE `chestweapon` (
  `id` int(11) NOT NULL,
  `society` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `coffrebuilder`
--

CREATE TABLE `coffrebuilder` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `society` varchar(55) NOT NULL,
  `pos` longtext NOT NULL,
  `money` tinyint(1) NOT NULL DEFAULT 0,
  `blackmoney` tinyint(1) NOT NULL DEFAULT 0,
  `object` tinyint(1) NOT NULL DEFAULT 0,
  `weapon` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `coffrebuilder`
--

INSERT INTO `coffrebuilder` (`id`, `name`, `job`, `society`, `pos`, `money`, `blackmoney`, `object`, `weapon`) VALUES
(2, 'Police', 'police', 'society_police', '{\"x\":-1542.95361328125,\"y\":-1223.390625,\"z\":2.04036664962768}', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `coffregang`
--

CREATE TABLE `coffregang` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `count` int(11) NOT NULL,
  `society` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `coffregang`
--

INSERT INTO `coffregang` (`id`, `name`, `label`, `count`, `society`) VALUES
(1, 'pistol_ammo', 'Pistol Ammo', 109, 'society_ballas');

-- --------------------------------------------------------

--
-- Structure de la table `coffrehouse`
--

CREATE TABLE `coffrehouse` (
  `id` int(11) NOT NULL,
  `idHouse` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `coffrehouse`
--

INSERT INTO `coffrehouse` (`id`, `idHouse`, `identifier`, `name`, `label`, `count`) VALUES
(22, 0, 'a023603b196b40b4a683b77429127786974fefc1', 'weapon_pistol', 'Beretta', 21),
(23, 0, 'a023603b196b40b4a683b77429127786974fefc1', 'black_phone', 'Black Phone', 10),
(24, 0, 'a023603b196b40b4a683b77429127786974fefc1', 'pain', 'Pain', 10),
(25, 0, 'a023603b196b40b4a683b77429127786974fefc1', 'pistol_ammo', 'Pistol Ammo', 10),
(26, 0, 'a023603b196b40b4a683b77429127786974fefc1', 'fishingrod', 'Canne à pêche', 10),
(27, 0, 'a023603b196b40b4a683b77429127786974fefc1', 'weapon_bat', 'Batte de Baseball', 1),
(29, 71, 'a023603b196b40b4a683b77429127786974fefc1', 'pistol_ammo', 'Munition .45ACP', 1),
(30, 71, 'a023603b196b40b4a683b77429127786974fefc1', 'weapon_pistol50', 'Pistolet Cal.50', 1),
(31, 116, '47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 'weapon_assaultrifle', 'AK-47', 0),
(32, 118, '47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 'weapon_assaultrifle', 'AK-47', 1);

-- --------------------------------------------------------

--
-- Structure de la table `datastore`
--

CREATE TABLE `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `datastore`
--

INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
('society_agent-immo', 'Agent immobilier', 1),
('society_armurier', 'Armurier', 1),
('society_avocat', 'Avocat', 1),
('society_bahamas', 'Bahamas', 1),
('society_bandadiaz', 'Banda Diaz', 1),
('society_benny', 'Benny', 1),
('society_burgershot', 'BurgerShot', 1),
('society_casino', 'Casino', 1),
('society_concess', 'concess', 1),
('society_concess_bateau', 'Concess Bateau', 1),
('society_concess_moto', 'Concess Moto', 1),
('society_couture', 'Société couture', 1),
('society_doa', 'DOA', 1),
('society_ems', 'EMS', 1),
('society_garage_cayo', 'Garage Cayo', 1),
('society_gouvernement', 'Gouvernement', 1),
('society_henhouse', 'Hen House', 1),
('society_hopital_cayo', 'Hôpital Cayo', 1),
('society_horny', 'Horny', 1),
('society_koi', 'Koï', 1),
('society_lscustomnord', 'LsCustom Nord', 1),
('society_lscustomsud', 'LsCustom Sud', 1),
('society_ltdcayo', 'LTD Cayo', 1),
('society_ltddp', 'LTD Del Perro', 1),
('society_ltdfd', 'LTD Forum Drive', 1),
('society_ltdgs', 'LTD Grove Street', 1),
('society_ltdls', 'LTD Little Seoul', 1),
('society_ltdmp', 'LTD Mirror Park', 1),
('society_milice', 'Milice', 1),
('society_mineur', 'Mineur', 1),
('society_nikkibeach', 'Nikki Beach', 1),
('society_police', 'police', 1),
('society_sherif', 'Shérif', 1),
('society_ssd', 'SSD', 1),
('society_swat', 'SWAT', 1),
('society_tabac', 'Tabac', 1),
('society_tacos', 'Tacos', 1),
('society_tequilala', 'Tequilala', 1),
('society_torcedor', 'Torcedor', 1),
('society_unicorn', 'Unicorn', 1),
('society_uwucafe', 'UwU Café', 1),
('society_vigneron', 'Vigneron', 1),
('society_weazelnewz', 'Weazel Newz', 1),
('society_yellowjack', 'Yellowjack', 1);

-- --------------------------------------------------------

--
-- Structure de la table `datastore_data`
--

CREATE TABLE `datastore_data` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `owner` varchar(60) DEFAULT NULL,
  `data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `datastore_data`
--

INSERT INTO `datastore_data` (`id`, `name`, `owner`, `data`) VALUES
(27, 'society_police', NULL, '{}'),
(28, 'society_concess', NULL, '{}'),
(29, 'society_vigneron', NULL, '{}'),
(30, 'society_tabac', NULL, '{}'),
(31, 'society_tacos', NULL, '{}'),
(32, 'society_bahamas', NULL, '{}'),
(33, 'society_tequilala', NULL, '{}'),
(34, 'society_unicorn', NULL, '{}'),
(35, 'society_yellowjack', NULL, '{}'),
(36, 'society_mineur', NULL, '{}'),
(37, 'society_agent-immo', NULL, '{}'),
(38, 'society_burgershot', NULL, '{}'),
(39, 'society_horny', NULL, '{}'),
(40, 'society_armurier', NULL, '{}'),
(41, 'society_ltddp', NULL, '{}'),
(42, 'society_ltdfd', NULL, '{}'),
(43, 'society_ltdgs', NULL, '{}'),
(44, 'society_ltdls', NULL, '{}'),
(45, 'society_ltdmp', NULL, '{}'),
(46, 'society_ltdls', NULL, '{}'),
(47, 'society_bcso', NULL, '{}'),
(48, 'society_benny', NULL, '{}'),
(49, 'society_lscustomsud', NULL, '{}'),
(50, 'society_lscustomnord', NULL, '{}'),
(51, 'society_concess_bateau', NULL, '{}'),
(52, 'society_nikkibeach', NULL, '{}'),
(53, 'society_concess_moto', NULL, '{}'),
(54, 'society_uwucafe', NULL, '{}'),
(55, 'society_gouvernement', NULL, '{}'),
(56, 'society_avocat', NULL, '{}'),
(57, 'society_henhouse', NULL, '{}'),
(58, 'society_ltdcayo', NULL, '{}'),
(59, 'society_torcedor', NULL, '{}'),
(60, 'society_ems', NULL, '{}'),
(61, 'society_sherif', NULL, '{}'),
(62, 'society_garage_cayo', NULL, '{}'),
(63, 'society_hopital_cayo', NULL, '{}'),
(64, 'society_milice', NULL, '{}'),
(65, 'society_bandadiaz', NULL, '{}'),
(66, 'society_casino', NULL, '{}'),
(67, 'society_weazelnewz', NULL, '{}'),
(68, 'society_doa', NULL, '{}'),
(69, 'society_ssd', NULL, '{}'),
(70, 'society_swat', NULL, '{}'),
(71, 'society_koi', NULL, '{}'),
(72, 'society_couture', NULL, '{}');

-- --------------------------------------------------------

--
-- Structure de la table `dpkeybinds`
--

CREATE TABLE `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `dpkeybinds`
--

INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
('steam:1100001177390e2', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('license:e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('license:a023603b196b40b4a683b77429127786974fefc1', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:11000011590ddb6', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('license:ab7cdc233d113bbd0e9ded9a324cd87e9c269278', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', ''),
('steam:11000010c9d9847', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');

-- --------------------------------------------------------

--
-- Structure de la table `federale`
--

CREATE TABLE `federale` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `expiration` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fill_type`
--

CREATE TABLE `fill_type` (
  `id` int(10) NOT NULL,
  `label` varchar(25) NOT NULL,
  `description` longtext NOT NULL,
  `amount` int(5) NOT NULL,
  `category` varchar(25) NOT NULL,
  `job` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `fill_type`
--

INSERT INTO `fill_type` (`id`, `label`, `description`, `amount`, `category`, `job`) VALUES
(0, 'Delit de fuite', 'pmals', 100, 'Mineur', 'police');

-- --------------------------------------------------------

--
-- Structure de la table `garage`
--

CREATE TABLE `garage` (
  `id` int(11) NOT NULL,
  `TypeGarage` varchar(50) NOT NULL,
  `posGarageExt` longtext NOT NULL,
  `priceVente` int(11) NOT NULL,
  `priceLocation` int(11) NOT NULL,
  `positionGarage` longtext NOT NULL,
  `placeGarage` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `garageimmo`
--

CREATE TABLE `garageimmo` (
  `id` int(11) NOT NULL,
  `TypeGarage` varchar(50) NOT NULL,
  `posGarageExt` longtext NOT NULL,
  `priceVente` int(11) NOT NULL,
  `priceLocation` int(11) NOT NULL,
  `positionGarage` longtext NOT NULL,
  `placeGarage` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gav`
--

CREATE TABLE `gav` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `expiration` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gestionadmin`
--

CREATE TABLE `gestionadmin` (
  `id` int(11) NOT NULL,
  `idgrade` varchar(25) NOT NULL,
  `namegrade` varchar(25) NOT NULL,
  `color` varchar(25) NOT NULL,
  `permissions` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gestionadmin`
--

INSERT INTO `gestionadmin` (`id`, `idgrade`, `namegrade`, `color`, `permissions`) VALUES
(11, 'fondateur', 'Fondateur', '~b~', '[{\"label\":\"Menu Admin\",\"status\":true,\"name\":\"menuadmin\"},{\"label\":\"Afficher nombre report\",\"status\":true,\"name\":\"shownvbrreport\"},{\"label\":\"Menu Report\",\"status\":true,\"name\":\"menureport\"},{\"label\":\"Menu personnel\",\"status\":true,\"name\":\"menupersonnel\"},{\"label\":\"Menu Météo\",\"status\":true,\"name\":\"meteo\"},{\"label\":\"Menu Joueur\",\"status\":true,\"name\":\"menujoueur\"},{\"label\":\"Menu Vehicule\",\"status\":true,\"name\":\"menuvehicle\"},{\"label\":\"Menu Serveur\",\"status\":true,\"name\":\"menuserveur\"},{\"label\":\"Menu Options\",\"status\":true,\"name\":\"menuoptions\"},{\"label\":\"Menu ped\",\"status\":true,\"name\":\"menuped\"},{\"label\":\"Liste des joueurs\",\"status\":true,\"name\":\"listeplayer\"},{\"label\":\"Vehicule options\",\"status\":true,\"name\":\"vehicleoption\"},{\"label\":\"Spawn Vehicule\",\"status\":true,\"name\":\"spawnvehicule\"},{\"label\":\"Menu mapping\",\"status\":true,\"name\":\"mapping\"},{\"label\":\"Gestion du serveur\",\"status\":true,\"name\":\"gestionserveur\"},{\"label\":\"Crée un item\",\"status\":true,\"name\":\"createitem\"},{\"label\":\"Noclip\",\"status\":true,\"name\":\"noclip\"},{\"label\":\"Tags Joueur\",\"status\":true,\"name\":\"tagsjoueur\"},{\"label\":\"Blips Joueur\",\"status\":true,\"name\":\"blipsjoueur\"},{\"label\":\"GodMode\",\"status\":true,\"name\":\"godmode\"},{\"label\":\"TP marker\",\"status\":true,\"name\":\"tpmarker\"},{\"label\":\"Setjob\",\"status\":true,\"name\":\"sesetjob\"},{\"label\":\"Action soins\",\"status\":true,\"name\":\"actionsoins\"},{\"label\":\"give de l\'argent\",\"status\":true,\"name\":\"givemoney\"},{\"label\":\"Give item\",\"status\":true,\"name\":\"giveitem\"},{\"label\":\"Invincible\",\"status\":true,\"name\":\"invincible\"},{\"label\":\"Spectacte\",\"status\":true,\"name\":\"spectacte\"},{\"label\":\"Info Serveur\",\"status\":true,\"name\":\"infoserveur\"},{\"label\":\"TP joueur\",\"status\":true,\"name\":\"tpjoueur\"},{\"label\":\"Action sanction\",\"status\":true,\"name\":\"sanction\"},{\"label\":\"Envoyer un message\",\"status\":true,\"name\":\"sendmessage\"},{\"label\":\"Freeze\",\"status\":true,\"name\":\"freeze\"}]');

-- --------------------------------------------------------

--
-- Structure de la table `gofast`
--

CREATE TABLE `gofast` (
  `id` int(11) NOT NULL,
  `identifier` varchar(80) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `gofast`
--

INSERT INTO `gofast` (`id`, `identifier`, `expiration`) VALUES
(22, 'a023603b196b40b4a683b77429127786974fefc1', 1686681408),
(23, '29a9462e64ddfed46096292b656966175087ffd9', 1688527723),
(24, '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 1688528122),
(25, 'd84442731b732e8a5f0502a4a9e54caa798d1037', 1692310814);

-- --------------------------------------------------------

--
-- Structure de la table `historyboss`
--

CREATE TABLE `historyboss` (
  `id` int(11) NOT NULL,
  `action` varchar(20) NOT NULL,
  `price` int(11) NOT NULL,
  `society` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `historyboss`
--

INSERT INTO `historyboss` (`id`, `action`, `price`, `society`) VALUES
(1, 'Dépôt', 100, 'society_gouvernement'),
(2, 'Dépôt', 10000, 'society_gouvernement'),
(3, 'Retrait', 5000, 'society_gouvernement'),
(4, 'Dépôt', 1000, 'society_gouvernement'),
(5, 'Dépôt', 1000, 'society_gouvernement'),
(6, 'Dépôt', 100000, 'society_gouvernement'),
(7, 'Dépôt', 1000, 'society_gouvernement'),
(8, 'Retrait', 1000000, 'society_gouvernement'),
(9, 'Retrait', 120000, 'society_gouvernement'),
(10, 'Dépôt', 1000, 'society_gouvernement'),
(11, 'Dépôt', 1000, 'society_gouvernement'),
(12, 'Dépôt', 1000, 'society_gouvernement'),
(13, 'Dépôt', 50909099, 'society_concess'),
(14, 'Dépôt', 1000, 'society_concess'),
(15, 'Dépôt', 100000000, 'society_concess'),
(16, 'Dépôt', 100, 'society_concess'),
(17, 'Dépôt', 100000, 'society_concess'),
(18, 'Dépôt', 6000000, 'society_concess'),
(19, 'Dépôt', 900000, 'society_police'),
(20, 'Dépôt', 50000000, 'society_police'),
(21, 'Retrait', 889500, 'society_police'),
(22, 'Dépôt', 15000, 'society_weazelnewz'),
(23, 'Retrait', 15000, 'society_weazelnewz'),
(24, 'Dépôt', 200000, 'society_lssd'),
(25, 'Dépôt', 200000, 'society_ems'),
(26, 'Retrait', 180000, 'society_ems'),
(27, 'Dépôt', 5000000, 'society_ems'),
(28, 'Dépôt', 50000000, 'society_concess_moto'),
(29, 'Dépôt', 500000, 'society_lscustomsud'),
(30, 'Retrait', 500000, 'society_concess'),
(31, 'Dépôt', 10000, 'society_koi'),
(32, 'Dépôt', 10000, 'society_koi'),
(33, 'Dépôt', 100, 'society_benny'),
(34, 'Retrait', 100, 'society_benny'),
(35, 'Dépôt', 10000, 'society_benny'),
(36, 'Retrait', 11120, 'society_benny'),
(37, 'Dépôt', 10000000, 'society_benny'),
(38, 'Dépôt', 20000, 'society_police'),
(39, 'Dépôt', 1000, 'society_nikkibeach'),
(40, 'Dépôt', 11000, 'society_nikkibeach'),
(41, 'Retrait', 100000, 'society_nikkibeach'),
(42, 'Retrait', 100, 'society_nikkibeach'),
(43, 'Dépôt', 10, 'society_nikkibeach'),
(44, 'Dépôt', 1000, 'society_nikkibeach'),
(45, 'Dépôt', 10, 'society_nikkibeach'),
(46, 'Retrait', 1000, 'society_nikkibeach'),
(47, 'Dépôt', 1000, 'society_nikkibeach'),
(48, 'Dépôt', 1000, 'society_nikkibeach'),
(49, 'Dépôt', 1, 'society_nikkibeach'),
(50, 'Retrait', 100000, 'society_nikkibeach'),
(51, 'Dépôt', 1000, 'society_nikkibeach'),
(52, 'Dépôt', 100, 'society_nikkibeach'),
(53, 'Dépôt', 110000000, 'society_nikkibeach'),
(54, 'Dépôt', 1000, 'society_nikkibeach'),
(55, 'Dépôt', 100, 'society_nikkibeach'),
(56, 'Dépôt', 10, 'society_nikkibeach'),
(57, 'Dépôt', 1000, 'society_nikkibeach'),
(58, 'Dépôt', 1000, 'society_nikkibeach'),
(59, 'Dépôt', 100, 'society_nikkibeach'),
(60, 'Dépôt', 1000, 'society_nikkibeach'),
(61, 'Dépôt', 1, 'society_nikkibeach'),
(62, 'Dépôt', 1000, 'society_nikkibeach'),
(63, 'Dépôt', 100, 'society_nikkibeach'),
(64, 'Dépôt', 1000, 'society_nikkibeach'),
(65, 'Dépôt', 100, 'society_nikkibeach'),
(66, 'Dépôt', 100, 'society_nikkibeach'),
(67, 'Dépôt', 1000, 'society_nikkibeach'),
(68, 'Dépôt', 1000, 'society_nikkibeach'),
(69, 'Dépôt', 10, 'society_nikkibeach'),
(70, 'Dépôt', 10, 'society_nikkibeach'),
(71, 'Dépôt', 1000, 'society_nikkibeach'),
(72, 'Retrait', 100, 'society_nikkibeach'),
(73, 'Dépôt', 100, 'society_nikkibeach'),
(74, 'Dépôt', 10, 'society_nikkibeach'),
(75, 'Dépôt', 1000, 'society_police');

-- --------------------------------------------------------

--
-- Structure de la table `houseimmo`
--

CREATE TABLE `houseimmo` (
  `id` int(11) NOT NULL,
  `vip` tinyint(1) NOT NULL,
  `TypeHouse` varchar(50) NOT NULL,
  `posHouseExt` longtext NOT NULL,
  `posCoffre` longtext NOT NULL,
  `weightCoffre` int(11) NOT NULL,
  `weightCoffreVIP` int(11) NOT NULL,
  `posManage` longtext NOT NULL,
  `priceVente` int(11) NOT NULL,
  `priceLocation` int(11) NOT NULL,
  `positionProperty` longtext NOT NULL,
  `statusBuy` tinyint(1) DEFAULT 0,
  `identifier` varchar(50) DEFAULT NULL,
  `expiration` int(50) DEFAULT NULL,
  `other_users` longtext DEFAULT '\'[]\'',
  `jobaccess` longtext NOT NULL DEFAULT '\'{"name":"personne","label":"Personne"}\'',
  `gangaccess` longtext NOT NULL DEFAULT '\'{"name":"personne","label":"Personne"}\''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `houseimmo`
--

INSERT INTO `houseimmo` (`id`, `vip`, `TypeHouse`, `posHouseExt`, `posCoffre`, `weightCoffre`, `weightCoffreVIP`, `posManage`, `priceVente`, `priceLocation`, `positionProperty`, `statusBuy`, `identifier`, `expiration`, `other_users`, `jobaccess`, `gangaccess`) VALUES
(111, 1, 'Maison', '{\"x\":-633.2576904296875,\"y\":-645.0093994140625,\"z\":31.72809028625488}', '{\"x\":-174.5370330810547,\"y\":493.90472412109377,\"z\":130.0436248779297}', 300, 600, '{\"x\":-170.01712036132813,\"y\":493.1553039550781,\"z\":130.0435028076172}', 1, 1, '{\"x\":-174.3295135498047,\"y\":497.92724609375,\"z\":137.6537322998047}', 0, NULL, NULL, '\'[]\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\''),
(112, 0, 'Appartement', '{\"x\":-628.54736328125,\"y\":-645.6566162109375,\"z\":31.6910343170166}', '{\"x\":259.8028869628906,\"y\":-1003.9981689453125,\"z\":-99.00857543945313}', 150, 300, '{\"x\":265.86956787109377,\"y\":-999.476318359375,\"z\":-99.00865173339844}', 100, 100, '{\"x\":266.04266357421877,\"y\":-1007.6098022460938,\"z\":-101.00859069824219}', 0, NULL, NULL, '\'[]\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\''),
(113, 0, 'Appartement', '{\"x\":-625.0849609375,\"y\":-650.993408203125,\"z\":31.71195602416992}', '{\"x\":259.8028869628906,\"y\":-1003.9981689453125,\"z\":-99.00857543945313}', 150, 300, '{\"x\":265.86956787109377,\"y\":-999.476318359375,\"z\":-99.00865173339844}', 110, 110, '{\"x\":266.04266357421877,\"y\":-1007.6098022460938,\"z\":-101.00859069824219}', 0, NULL, NULL, '\'[]\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\''),
(114, 0, 'Appartement', '{\"x\":-631.9752807617188,\"y\":-653.7725219726563,\"z\":31.71407318115234}', '{\"x\":259.8028869628906,\"y\":-1003.9981689453125,\"z\":-99.00857543945313}', 150, 300, '{\"x\":265.86956787109377,\"y\":-999.476318359375,\"z\":-99.00865173339844}', 100, 100, '{\"x\":266.04266357421877,\"y\":-1007.6098022460938,\"z\":-101.00859069824219}', 0, NULL, NULL, '\'[]\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\''),
(115, 0, 'Maison', '{\"x\":-626.6101684570313,\"y\":-658.4217529296875,\"z\":31.74213790893554}', '{\"x\":351.9512634277344,\"y\":-998.751220703125,\"z\":-99.19624328613281}', 250, 500, '{\"x\":349.1777648925781,\"y\":-994.9756469726563,\"z\":-99.19615936279297}', 100, 100, '{\"x\":346.5380859375,\"y\":-1013.2401733398438,\"z\":-99.19617462158203}', 0, NULL, NULL, '\'[]\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\''),
(116, 0, 'Appartement', '{\"x\":-828.1806030273438,\"y\":-1090.149169921875,\"z\":11.13908386230468}', '{\"x\":259.8028869628906,\"y\":-1003.9981689453125,\"z\":-99.00857543945313}', 150, 300, '{\"x\":265.86956787109377,\"y\":-999.476318359375,\"z\":-99.00865173339844}', 1000, 100, '{\"x\":266.04266357421877,\"y\":-1007.6098022460938,\"z\":-101.00859069824219}', 1, '47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 1693570658, '\'[]\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\''),
(117, 0, 'Appartement', '{\"x\":-822.7084350585938,\"y\":-1099.655029296875,\"z\":11.15565109252929}', '{\"x\":151.3033905029297,\"y\":-1003.1554565429688,\"z\":-98.99996948242188}', 200, 400, '{\"x\":151.7383575439453,\"y\":-1000.9758911132813,\"z\":-98.99996948242188}', 1000, 100, '{\"x\":151.37661743164063,\"y\":-1008.06103515625,\"z\":-99.00001525878906}', 0, NULL, NULL, '\'[]\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\''),
(118, 0, 'Maison', '{\"x\":-818.4468994140625,\"y\":-1107.0963134765626,\"z\":11.16862773895263}', '{\"x\":351.9512634277344,\"y\":-998.751220703125,\"z\":-99.19624328613281}', 250, 500, '{\"x\":349.1777648925781,\"y\":-994.9756469726563,\"z\":-99.19615936279297}', 1000, 100, '{\"x\":346.5380859375,\"y\":-1013.2401733398438,\"z\":-99.19617462158203}', 1, '47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 1693575966, '\'[]\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\''),
(119, 0, 'Maison', '{\"x\":142.918701171875,\"y\":-884.8233642578125,\"z\":30.50860595703125}', '{\"x\":351.9512634277344,\"y\":-998.751220703125,\"z\":-99.19624328613281}', 250, 500, '{\"x\":349.1777648925781,\"y\":-994.9756469726563,\"z\":-99.19615936279297}', 100, 1000, '{\"x\":346.5380859375,\"y\":-1013.2401733398438,\"z\":-99.19617462158203}', 0, NULL, NULL, '\'[]\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\''),
(120, 0, 'Maison', '{\"x\":-813.9386596679688,\"y\":-1114.2750244140626,\"z\":11.18093109130859}', '{\"x\":351.9512634277344,\"y\":-998.751220703125,\"z\":-99.19624328613281}', 250, 500, '{\"x\":349.1777648925781,\"y\":-994.9756469726563,\"z\":-99.19615936279297}', 1000, 100, '{\"x\":346.5380859375,\"y\":-1013.2401733398438,\"z\":-99.19617462158203}', 0, NULL, NULL, '\'[]\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'', '\'{\"name\":\"personne\",\"label\":\"Personne\"}\'');

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` float NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('acide', 'Acide', 1, 0, 1),
('alcool', 'Alcool', 0.2, 0, 1),
('americano', 'Americano', 1, 0, 1),
('anchois', 'Anchois', 1, 0, 1),
('attachment_remover', 'Attachement Remover', 1, 0, 1),
('ball_ammo', 'ball_ammo', 1, 0, 1),
('barquette_poulet', 'Barquette de poulet', 1, 0, 1),
('beryl', 'Beryl', 1, 0, 1),
('biere', 'Bière', 1, 0, 1),
('bijoux', 'Bijoux', 1, 0, 1),
('bird_crap_ammo', 'bird_crap_ammo', 1, 0, 1),
('bmx', 'BMX', 10, 0, 1),
('boeuf', 'Boeuf', 1, 0, 1),
('boeuf_cru', 'Boeuf cru', 1, 0, 1),
('boeuf_cuit', 'Tomahawk de boeuf', 1, 0, 1),
('boite_mun_assault', 'Boite 7.62mm', 12, 0, 1),
('boite_mun_mitraillette', 'Boite 9mm', 12, 0, 1),
('boite_mun_pistol', 'Boite .45ACP', 12, 0, 1),
('boite_mun_pompe', 'Boite Calibre 12', 12, 0, 1),
('bombe_tag', 'Bombe à tag', 0.5, 0, 1),
('bouteille_champagne', 'Bouteille de champagne', 1, 0, 1),
('bouteille_eau', 'Bouteille d\'eau', 1, 0, 1),
('bouteille_tequila', 'Bouteille de tequila', 1, 0, 1),
('bouteille_vin', 'Bouteille de vin', 1, 0, 1),
('bouteille_vodka', 'Bouteille de vodka', 1, 0, 1),
('bouteille_whisky', 'Bouteille de whisky', 1, 0, 1),
('bouteille_woodford', 'Bouteille de Woodfort', 1, 0, 1),
('bracelet_electronique', 'Bracelet électronique', 0.5, 0, 1),
('branche_weed_critical', 'Branche de weed (critical)', 1, 0, 1),
('brownie', 'Brownie', 1, 0, 1),
('brownie_moule', 'Brownie en moule', 1, 0, 1),
('bumpton', 'Jeton AutoTemponeuse', 1, 0, 1),
('cafe', 'Café', 1, 0, 1),
('casse_vitre', 'Casse vitre', 2, 0, 1),
('cheeseburger', 'Cheese Burger', 1, 0, 1),
('chickenburger', 'Chicken Burger', 1, 0, 1),
('cle_piratage', 'Clé de piratage', 0.5, 0, 1),
('clip_extended', 'Extended Clip', 1, 0, 1),
('cognac', 'Cognac', 1, 0, 1),
('cookie', 'Cookie', 1, 0, 1),
('crack', 'Crack', 0.2, 0, 1),
('crepe_nutella', 'Crêpe nutella', 1, 0, 1),
('crystal_meth', 'Crystal de meth', 0.2, 0, 1),
('cuisse_poulet', 'Cuisse de poulet', 0.2, 0, 1),
('dauphin', 'Dauphin', 7, 0, 1),
('donut', 'Donut', 1, 0, 1),
('drill', 'Perceuse', 4, 0, 1),
('emeraude', 'Emeraude', 1, 0, 1),
('espadon', 'Espadon', 1, 0, 1),
('etoile_mer', 'Etoile de mer', 3, 0, 1),
('feuille_coca', 'Feuille de coca', 1, 0, 1),
('feuille_ocb', 'Feuille OCB', 0.2, 0, 1),
('feuille_tabac', 'Feuille de tabac', 1, 0, 1),
('feuille_tabac_seche', 'Feuille de tabac séchée', 0.2, 0, 1),
('ficello', 'Ficello', 0.5, 0, 1),
('fireextinguisher_ammo', 'fireextinguisher_ammo', 1, 0, 1),
('fishingrod', 'Canne à pêche', 1.5, 0, 1),
('flare_ammo', 'Munition de détresse', 0.2, 0, 1),
('flashlight', 'Flashlight', 1, 0, 1),
('fragment_minerais', 'Fragment de minerais', 0.2, 0, 1),
('frite', 'Frite', 1, 0, 1),
('frozen_margarita', 'Frozen Margarita', 1, 0, 1),
('fruit_fermente', 'Fruit Fermenté', 1, 0, 1),
('gadget_parachute', 'Parachute', 1, 0, 1),
('glace', 'Glace', 1, 0, 1),
('grand_appat', 'Grand-appât', 1, 0, 1),
('grappe_raisin', 'Grappe de raisin', 0.2, 0, 1),
('grip', 'Grip', 1, 0, 1),
('gzgas_ammo', 'gzgas_ammo', 1, 0, 1),
('hamburger', 'Hamburger', 1, 0, 1),
('ice_tea', 'Ice-Tea', 1, 0, 1),
('jumelles', 'Jumelle', 1, 0, 1),
('jus_raisin', 'Jus de raisin', 1, 0, 1),
('kit_crochetage', 'Kit de crochetage', 2, 0, 1),
('kit_reparation', 'Kit de réparation', 2, 0, 1),
('longchicken', 'Long Chicken', 1, 0, 1),
('luxary_finish', 'Luxury Finish', 1, 0, 1),
('margarita', 'Margarita', 1, 0, 1),
('martini', 'Martini', 1, 0, 1),
('meduse', 'Méduse', 1.5, 0, 1),
('menotte', 'Menotte', 1, 0, 1),
('mg_ammo', 'Munition 5.56', 0.2, 0, 1),
('mgclip', 'MG Clip', 1, 0, 1),
('mochi', 'Mochi', 1, 0, 1),
('mojito', 'Mojito', 1, 0, 1),
('molotov_ammo', 'molotov_ammo', 1, 0, 1),
('morue', 'Morue', 1, 0, 1),
('moyen_appat', 'Moyen-appât', 1, 0, 1),
('mysterybronze', 'Mystery Bronze', 1, 0, 1),
('mysterydiamond', 'Mystery Diamond', 1, 0, 1),
('mysterygold', 'Mystery Gold', 1, 0, 1),
('mysteryiron', 'Mystery Iron', 1, 0, 1),
('mysteryultime', 'Mystery Ultime', 1, 0, 1),
('oasis', 'Oasis', 1, 0, 1),
('pain', 'Pain', 0.5, 0, 1),
('paquet_marlboro', 'Paquet de marlboro', 1, 0, 1),
('paquet_viande', 'Paquet de viande', 1, 0, 1),
('peau_coyote', 'Peau de coyote', 1, 0, 1),
('peau_puma', 'Peau de puma', 1, 0, 1),
('pelote_laine', 'Pelote de laine', 1, 0, 1),
('petit_appat', 'Petit-appât', 0.5, 0, 1),
('phone', 'Téléphone', 1, 0, 1),
('phosphore_rouge', 'Phosphore rouge', 0.2, 0, 1),
('pince_cheveux', 'Pince à cheveux', 1, 0, 1),
('pistol_ammo', 'Munition .45ACP', 0.2, 0, 1),
('pistolclip', 'Pistol Clip', 1, 0, 1),
('plane_rocket_ammo', 'plane_rocket_ammo', 1, 0, 1),
('player_laser_ammo', 'player_laser_ammo', 1, 0, 1),
('pochon_coke', 'Pochon de coke', 1, 0, 1),
('pochon_crack', 'Pochon de crack', 1, 0, 1),
('pochon_meth', 'Pochon de meth', 1, 0, 1),
('pochon_weed_critical', 'Pochon de weed (critical)', 1, 0, 1),
('potatoes', 'Potatoes', 1, 0, 1),
('poudre_coke', 'Poudre de coke', 0.2, 0, 1),
('poulet', 'Poulet', 1, 0, 1),
('poulet_cuit', 'Poulet cuit', 1, 0, 1),
('pouletpane', 'Poulet pané', 1, 0, 1),
('pseudoephedrine', 'Pseudoéphédrine', 0.2, 0, 1),
('radio', 'Radio', 0.5, 0, 1),
('raie', 'Raie', 1, 0, 1),
('requin', 'Requin', 9, 0, 1),
('requin_marteau', 'Requin Marteau', 8, 0, 1),
('rhum', 'Rhum', 1, 0, 1),
('rifle_ammo', 'Munition 7.62mm', 0.2, 0, 1),
('rifleclip', 'Rifle Clip', 1, 0, 1),
('riz', 'Riz', 1, 0, 1),
('rope', 'Câble en acier', 3, 0, 1),
('sac_farine', 'Sac de farine', 1, 0, 1),
('salade_cesar', 'Salade césar', 1, 0, 1),
('sandwich', 'Sandwich', 1, 0, 1),
('saumon', 'Saumon', 1, 0, 1),
('scope', 'Viseur', 1, 0, 1),
('serflex', 'Serflex', 1, 0, 1),
('shotgun_ammo', 'Munition Calibre 12', 0.2, 0, 1),
('shotgunclip', 'Shotgun Clip', 1, 0, 1),
('skin', 'Camouflage', 1, 0, 1),
('smg_ammo', 'Munition 9mm', 0.2, 0, 1),
('smgclip', 'SMG Clip', 1, 0, 1),
('sniper_remote_ammo', 'Sniper Remote Ammo', 1, 0, 1),
('space_rocket_ammo', 'space_rocket_ammo', 1, 0, 1),
('spray', 'Spray', 0.5, 1, 1),
('spray_remover', 'Spray Remover', 0.5, 1, 1),
('stickybomb_ammo', 'stickybomb_ammo', 1, 0, 1),
('stungun_ammo', 'Stungun Ammo', 1, 0, 1),
('suppressor', 'Suppressor', 1, 0, 1),
('sushi', 'Sushi', 1, 0, 1),
('tacos', 'Tacos', 1, 0, 1),
('tank_ammo', 'tank_ammo', 1, 0, 1),
('telephone_bicrave', 'Téléphone de bicrave', 1, 0, 1),
('tete_weed_critical', 'Tête de weed (critical)', 0.2, 0, 1),
('the', 'Thé', 1, 0, 1),
('thon', 'Thon', 1, 0, 1),
('throwableclip', 'Throwable Clip', 1, 0, 1),
('tint_army', 'Army', 1, 0, 1),
('tint_gold', 'Gold', 1, 0, 1),
('tint_green', 'Green', 1, 0, 1),
('tint_lspd', 'LSPD', 1, 0, 1),
('tint_orange', 'Orange', 1, 0, 1),
('tint_pink', 'Pink', 1, 0, 1),
('tint_platinum', 'Platinum', 1, 0, 1),
('tissu', 'Tissu', 0.2, 0, 1),
('tortue_mer', 'Tortue de mer', 4.5, 0, 1),
('umeshu', 'Umeshu', 1, 0, 1),
('vetement', 'Vêtement', 1, 0, 1),
('viande_biche', 'Viande de biche', 1, 0, 1),
('viande_cuite', 'Viande cuite', 0.2, 0, 1),
('viande_lapin', 'Viande de lapin', 1, 0, 1),
('viande_oie', 'Viande d\'oie', 1, 0, 1),
('viande_sanglier', 'Viande de sanglier', 1, 0, 1),
('weapon_assaultrifle', 'AK-47', 1, 0, 1),
('weapon_ball', 'Balle', 1, 0, 1),
('weapon_bat', 'Batte de Baseball', 1, 0, 1),
('weapon_battleaxe', 'Hache de guerre', 1, 0, 1),
('weapon_bottle', 'Bouteille cassé', 1, 0, 1),
('weapon_bzgas', 'Grenade lacrymogène', 1, 0, 1),
('weapon_carbinerifle', 'M4-A1', 1, 0, 1),
('weapon_ceramicpistol', 'Pistolet céramique', 1, 0, 1),
('weapon_combatpistol', 'Pistolet de Combat', 1, 0, 1),
('weapon_compactrifle', 'Ak Compact', 1, 0, 1),
('weapon_crowbar', 'Pied de biche', 1, 0, 1),
('weapon_dagger', 'Dague antique', 1, 0, 1),
('weapon_dbshotgun', 'Fusil à double canon', 1, 0, 1),
('weapon_digiscanner', 'Détecteur de métaux', 1, 0, 1),
('weapon_fireextinguisher', 'Fusée de mortier', 1, 0, 1),
('weapon_firework', 'Mortier', 1, 0, 1),
('weapon_flare', 'Fusée de détresse', 1, 0, 1),
('weapon_flaregun', 'Pistolet de détresse', 1, 0, 1),
('weapon_flashlight', 'Lampe de poche', 1, 0, 1),
('weapon_golfclub', 'Club de Golf', 1, 0, 1),
('weapon_gusenberg', 'Thompson', 1, 0, 1),
('weapon_hammer', 'Marteau', 1, 0, 1),
('weapon_hatchet', 'Hachette', 1, 0, 1),
('weapon_heavypistol', 'Pistolet Lourd', 1, 0, 1),
('weapon_knife', 'Couteau', 1, 0, 1),
('weapon_knuckle', 'Poing Américain', 1, 0, 1),
('weapon_machete', 'Machette', 1, 0, 1),
('weapon_machinepistol', 'Tech 9', 1, 0, 1),
('weapon_microsmg', 'Micro-Uzi', 1, 0, 1),
('weapon_minismg', 'Scorpion', 1, 0, 1),
('weapon_molotov', 'Cocktail Molotov', 1, 0, 1),
('weapon_musket', 'Musquet', 1, 0, 1),
('weapon_nightstick', 'Matraque', 1, 0, 1),
('weapon_petrolcan', 'Bidon d\'essence', 1, 0, 1),
('weapon_pipebomb', 'Bombe tuyau', 1, 0, 1),
('weapon_pistol', 'Pistolet Berreta', 1, 0, 1),
('weapon_pistol50', 'Pistolet Cal.50', 1, 0, 1),
('weapon_poolcue', 'Queue de billard', 1, 0, 1),
('weapon_pumpshotgun', 'Fusil à pompe', 1, 0, 1),
('weapon_revolver', 'Pistolet Revolver', 1, 0, 1),
('weapon_sawnoffshotgun', 'Canon scié', 1, 0, 1),
('weapon_smg', 'MP5', 1, 0, 1),
('weapon_smokegrenade', 'Grenade fumigène', 1, 0, 1),
('weapon_snowball', 'Pavé', 1, 0, 1),
('weapon_snspistol', 'Pistolet SNS', 1, 0, 1),
('weapon_specialcarbine', 'Carabine spécial', 1, 0, 1),
('weapon_stickybomb', 'Bombe collante', 1, 0, 1),
('weapon_stungun', 'Taser', 1, 0, 1),
('weapon_switchblade', 'Cran d\'arrêt', 1, 0, 1),
('weapon_vintagepistol', 'Pistolet vintage', 1, 0, 1),
('weapon_wrench', 'Clé anglaise', 1, 0, 1),
('yusuf', 'Weapon Skin', 1, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `jail`
--

CREATE TABLE `jail` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `expiration` int(25) NOT NULL,
  `reason` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
--

CREATE TABLE `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `jobs`
--

INSERT INTO `jobs` (`name`, `label`) VALUES
('abatoire', 'Abatoire'),
('agent-immo', 'Agent immobilier'),
('armurier', 'Armurier'),
('avocat', 'Avocat'),
('bahamas', 'Bahamas'),
('ballas', 'Ballas'),
('bandadiaz', 'Banda Diaz'),
('benny', 'Benny\'s'),
('bloods', 'Bloods'),
('bmf', 'BMF'),
('burgershot', 'BurgerShot'),
('casino', 'Casino'),
('concess', 'Concess Auto'),
('concess_bateau', 'Concess Bateau'),
('concess_moto', 'Concess Moto'),
('couture', 'Couture'),
('doa', 'DOA'),
('ems', 'EMS'),
('f4l', 'F4l'),
('garage_cayo', 'Garage Cayo'),
('gouvernement', 'Gouvernement'),
('henhouse', 'Hen House'),
('hopital_cayo', 'Hôpital Cayo'),
('horny', 'Horny\'s'),
('koi', 'Koï'),
('lostmc', 'LostMC'),
('lscustomnord', 'LsCustom Nord'),
('lscustomsud', 'LsCustom Sud'),
('lssd', 'LSSD'),
('ltdcayo', 'LTD Cayo'),
('ltddp', 'LTD Del Perro'),
('ltdfd', 'LTD Forum Drive'),
('ltdgs', 'LTD Grove Street'),
('ltdls', 'LTD Little Seoul'),
('ltdmp', 'LTD Mirror Park'),
('madrazo', 'Cartel Madrazo'),
('marabunta', 'Marabunta'),
('milice', 'Milice'),
('mineur', 'Mineur'),
('nikkibeach', 'Nikki Beach'),
('oneil', 'O\'Neil'),
('police', 'LSPD'),
('ssd', 'SSD'),
('swat', 'SWAT'),
('tabac', 'Tabac'),
('tacos', 'Tacos'),
('tequilala', 'Tequilala'),
('torcedor', 'Torcedor'),
('unemployed', 'Chomeur'),
('unemployed2', 'Citoyen'),
('unicorn', 'Unicorn'),
('uwucafe', 'UwU Café'),
('vagos', 'Vagos'),
('vigneron', 'Vigneron'),
('weazelnewz', 'Weazel Newz'),
('yellowjack', 'YellowJack');

-- --------------------------------------------------------

--
-- Structure de la table `job_grades`
--

CREATE TABLE `job_grades` (
  `id` int(11) NOT NULL,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `coffre` tinyint(1) DEFAULT 0,
  `garage` tinyint(1) DEFAULT 0,
  `armurerie` tinyint(1) NOT NULL DEFAULT 0,
  `fisc` tinyint(1) NOT NULL DEFAULT 0,
  `saisie` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job_grades`
--

INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `coffre`, `garage`, `armurerie`, `fisc`, `saisie`) VALUES
(1, 'unemployed', 0, 'unemployed', 'RSA', 0, 0, 0, 0, 0, 0),
(2, 'unemployed2', 0, 'unemployed2', 'Sans Emploi', 0, 0, 0, 0, 0, 0),
(50, 'ballas', 0, 'petit', 'Petite-Frappe', 0, 0, 0, 0, 0, 0),
(200, 'torcedor', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(1000, 'bandadiaz', 10, 'boss', 'Lead', 0, 0, 0, 0, 0, 0),
(3888, 'abatoire', 0, 'employe', 'Employé', 0, 0, 0, 0, 0, 0),
(3889, 'police', 20, 'boss', 'Chief', 95, 1, 1, 1, 0, 1),
(3890, 'police', 19, 'commandant', 'Commandant', 90, 1, 1, 1, 0, 1),
(3891, 'concess', 10, 'boss', 'Patron', 100, 1, 1, 0, 0, 0),
(3892, 'concess', 0, 'recrue', 'Employé', 1, 1, 1, 0, 0, 0),
(3894, 'ballas', 10, 'boss', 'Triple-OG', 0, 0, 0, 0, 0, 0),
(3897, 'f4l', 10, 'boss', 'Triple-OG', 800, 0, 0, 0, 0, 0),
(3898, 'vagos', 10, 'boss', 'Jefe', 800, 0, 0, 0, 0, 0),
(3899, 'bloods', 10, 'boss', 'Triple-OG', 800, 0, 0, 0, 0, 0),
(3900, 'oneil', 10, 'boss', 'Chef', 800, 0, 0, 0, 0, 0),
(3901, 'marabunta', 10, 'boss', 'Jefe', 800, 0, 0, 0, 0, 0),
(3902, 'madrazo', 10, 'boss', 'Jefe', 800, 0, 0, 0, 0, 0),
(3903, 'lostmc', 10, 'boss', 'Président', 800, 0, 0, 0, 0, 0),
(3904, 'bmf', 10, 'boss', 'Chef', 800, 0, 0, 0, 0, 0),
(3905, 'couture', 0, 'employe', 'Employé', 800, 0, 0, 0, 0, 0),
(3906, 'vigneron', 10, 'boss', 'Patron', 0, 1, 1, 0, 0, 0),
(3907, 'tabac', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3908, 'tacos', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3909, 'bahamas', 10, 'boss', 'Patron', 0, 1, 1, 0, 0, 0),
(3910, 'unicorn', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3911, 'tequilala', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3912, 'yellowjack', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3913, 'mineur', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3914, 'agent-immo', 10, 'boss', 'Patron', 90, 0, 0, 0, 0, 0),
(3916, 'horny', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3917, 'armurier', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3918, 'ltdls', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3919, 'ltddp', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3920, 'ltdmp', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3921, 'ltdgs', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3922, 'ltdfd', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3924, 'lscustomsud', 10, 'boss', 'Patron', 500, 1, 1, 0, 0, 0),
(3925, 'benny', 10, 'boss', 'Patron', 10, 1, 1, 0, 0, 0),
(3926, 'bahamas', 5, 'securite', 'Bahamas', 10, 0, 0, 0, 0, 0),
(3927, 'bahamas', 8, 'voiturier', 'Bahamas', 10, 0, 0, 0, 0, 0),
(3928, 'lscustomnord', 10, 'boss', 'Patron', 0, 1, 1, 0, 0, 0),
(3929, 'concess_bateau', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3930, 'nikkibeach', 10, 'boss', 'Patron', 90, 0, 0, 0, 0, 0),
(3931, 'concess_moto', 10, 'boss', 'Patron', 95, 1, 1, 0, 0, 0),
(3932, 'uwucafe', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3933, 'burgershot', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3934, 'gouvernement', 10, 'boss', 'Gouverneur', 205, 1, 1, 0, 0, 0),
(3935, 'gouvernement', 9, 'procureur', 'Procureur', 165, 1, 1, 0, 0, 0),
(3936, 'gouvernement', 8, 'fisc', 'Fisc', 125, 1, 1, 0, 1, 0),
(3937, 'gouvernement', 7, 'juge', 'Juge', 85, 0, 0, 0, 0, 0),
(3938, 'gouvernement', 6, 'securite', 'Sécurité', 45, 0, 1, 0, 0, 0),
(3939, 'benny', 1, 'recrue', 'Recrue', 10, 1, 1, 0, 0, 0),
(3941, 'avocat', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3942, 'henhouse', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3943, 'ltdcayo', 10, 'boss', 'Patron', 0, 1, 1, 0, 0, 0),
(3945, 'police', 18, 'capitaine', 'Capitaine', 85, 1, 1, 1, 0, 1),
(3946, 'police', 17, 'lieutenant', 'Lieutenant', 80, 1, 1, 1, 0, 1),
(3947, 'police', 16, 'sergent2', 'Sergent 2', 75, 1, 1, 1, 0, 0),
(3948, 'police', 15, 'sergent1', 'Sergent 1', 70, 1, 1, 1, 0, 0),
(3949, 'police', 5, 'slo', 'SLO', 65, 1, 1, 1, 0, 0),
(3950, 'police', 4, 'officier3', 'Officier 3', 60, 1, 1, 1, 0, 0),
(3951, 'police', 3, 'officier2', 'Officier 2', 55, 1, 1, 1, 0, 0),
(3952, 'police', 2, 'officier1', 'Officier 1', 50, 1, 1, 1, 0, 0),
(3953, 'police', 1, 'rookie', 'Rookie', 45, 1, 1, 1, 0, 1),
(3954, 'lssd', 20, 'boss', 'Chief', 0, 1, 1, 1, 0, 1),
(3955, 'ems', 20, 'boss', 'Patron', 0, 1, 1, 0, 0, 0),
(3956, 'garage_cayo', 20, 'boss', 'Patron', 0, 1, 1, 0, 0, 0),
(3957, 'milice', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3958, 'hopital_cayo', 10, 'boss', 'Patron', 0, 0, 0, 0, 0, 0),
(3960, 'casino', 10, 'boss', 'Lead', 0, 0, 0, 0, 0, 0),
(3961, 'weazelnewz', 10, 'boss', 'Patron', 500, 1, 1, 0, 0, 0),
(3965, 'lssd', 19, 'commandant', 'Commandant', 0, 1, 1, 1, 0, 1),
(3966, 'lssd', 18, 'capitaine', 'Capitaine', 0, 1, 1, 1, 0, 1),
(3967, 'lssd', 17, 'lieutenant', 'Lieutenant', 0, 1, 1, 1, 0, 1),
(3968, 'lssd', 16, 'sergent2', 'Sergent 2', 0, 1, 1, 1, 0, 0),
(3969, 'lssd', 15, 'sergent1', 'Sergent 1', 0, 1, 1, 1, 0, 0),
(3970, 'lssd', 5, 'sld', 'SLD', 0, 1, 1, 1, 0, 0),
(3971, 'lssd', 4, 'deputy3', 'Deputy 3', 0, 1, 1, 1, 0, 0),
(3972, 'lssd', 3, 'deputy2', 'Deputy 2', 0, 1, 1, 1, 0, 0),
(3973, 'lssd', 2, 'deputy1', 'Deputy 1', 0, 1, 1, 1, 0, 0),
(3974, 'lssd', 1, 'junior', 'Junior', 0, 1, 1, 1, 0, 0),
(3975, 'ssd', 10, 'boss', 'Lieutenant', 0, 0, 0, 0, 0, 0),
(3976, 'swat', 10, 'boss', 'Lieutenant', 0, 0, 0, 0, 0, 0),
(3977, 'doa', 10, 'boss', 'Lieutenant', 0, 0, 0, 0, 0, 0),
(3978, 'koi', 10, 'boss', 'Patron', 500, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `keysvehi`
--

CREATE TABLE `keysvehi` (
  `identifier` varchar(50) NOT NULL,
  `other_users` longtext DEFAULT '[]',
  `plate` varchar(11) NOT NULL,
  `job` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `keysvehi`
--

INSERT INTO `keysvehi` (`identifier`, `other_users`, `plate`, `job`) VALUES
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', '[]', 'BJUT043', 0),
('a023603b196b40b4a683b77429127786974fefc1', '[]', 'CNVG711', 0),
('a023603b196b40b4a683b77429127786974fefc1', '[]', 'CVIA702', 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', '[]', 'DZWH989', 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', '[]', 'EYRX674', 0),
('a023603b196b40b4a683b77429127786974fefc1', '[]', 'FUNL419', 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', '[]', 'GDDZ178', 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', '[]', 'GMYN543', 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', '[]', 'GRMY007', 0),
('a023603b196b40b4a683b77429127786974fefc1', '[]', 'GXJG940', 0),
('a023603b196b40b4a683b77429127786974fefc1', '[]', 'HCIE863', 0),
('a023603b196b40b4a683b77429127786974fefc1', '[]', 'IGEI831', 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', '[]', 'IJKD624', 0),
('a023603b196b40b4a683b77429127786974fefc1', '[]', 'IRIF734', 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', '[]', 'IXRF946', 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', '[]', 'JWZX794', 0),
('66c38cd1bdaaa07a75574f0076f3f2fd94c9ffe2', '[]', 'MQPZ873', 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', '[]', 'MTCF611', 0),
('29a9462e64ddfed46096292b656966175087ffd9', '[]', 'QZDU482', 0),
('47f4b8176dff09360d433f8bfca8f1e3d1af3adb', '[]', 'STEV216', 0),
('29a9462e64ddfed46096292b656966175087ffd9', '[]', 'TOIO781', 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', '[]', 'TZIF571', 0),
('a023603b196b40b4a683b77429127786974fefc1', '[]', 'UCAS421', 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', '[]', 'VCGR661', 0),
('29a9462e64ddfed46096292b656966175087ffd9', '[]', 'VOAJ432', 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', '[]', 'VXTD249', 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', '[]', 'XFRL274', 0),
('28c4253db1bf82a66a8645b7e97de77334f61a9f', '[]', 'YTHZ225', 0);

-- --------------------------------------------------------

--
-- Structure de la table `licenses`
--

CREATE TABLE `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `licenses`
--

INSERT INTO `licenses` (`type`, `label`) VALUES
('drive_a', 'A'),
('drive_b', 'B'),
('drive_c', 'C'),
('practical_boat', 'Practical Boat'),
('practical_helicopter', 'Practical Helicopter'),
('practical_plane', 'Practical Plane'),
('theory_a', 'Theory A'),
('theory_b', 'Theory B'),
('theory_boat', 'Theory Boat'),
('theory_c', 'Theory C'),
('theory_helicopter', 'Theory Helicopter'),
('theory_plane', 'Theory Plane'),
('weapon', 'Weapon License');

-- --------------------------------------------------------

--
-- Structure de la table `open_car`
--

CREATE TABLE `open_car` (
  `id` int(11) NOT NULL,
  `identifier` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `value` varchar(50) DEFAULT NULL,
  `got` varchar(50) DEFAULT NULL,
  `NB` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `owned_vehicles`
--

CREATE TABLE `owned_vehicles` (
  `owner` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'vehicle',
  `stored` int(1) NOT NULL DEFAULT 0,
  `glovebox` longtext DEFAULT NULL,
  `trunk` longtext DEFAULT NULL,
  `import` bigint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `owned_vehicles`
--

INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `type`, `stored`, `glovebox`, `trunk`, `import`) VALUES
('a023603b196b40b4a683b77429127786974fefc1', 'CNVG711', '{\"modAPlate\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modAirFilter\":-1,\"modTrimA\":-1,\"color2\":2,\"modRoof\":-1,\"modGrille\":-1,\"modXenon\":false,\"modAerials\":-1,\"modHydrolic\":-1,\"modDashboard\":-1,\"fuelLevel\":65.0,\"modExhaust\":-1,\"modTank\":-1,\"modTrunk\":-1,\"pearlescentColor\":4,\"modHorns\":-1,\"color1\":0,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":3,\"engineHealth\":1000.0,\"dirtLevel\":6.3,\"modSpeakers\":-1,\"modBackWheels\":-1,\"modOrnaments\":-1,\"modTransmission\":-1,\"modRearBumper\":-1,\"modFrame\":-1,\"modTrimB\":-1,\"modSmokeEnabled\":false,\"modFender\":-1,\"modArchCover\":-1,\"xenonColor\":255,\"extras\":{\"1\":true,\"9\":true,\"4\":true},\"modWindows\":-1,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"wheelColor\":156,\"modArmor\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modSuspension\":-1,\"modFrontWheels\":-1,\"plate\":\"CNVG711\",\"neonEnabled\":[false,false,false,false],\"modLivery\":-1,\"neonColor\":[255,0,255],\"modDial\":-1,\"modStruts\":-1,\"model\":1672195559,\"modTurbo\":false,\"modVanityPlate\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modShifterLeavers\":-1,\"bodyHealth\":1000.0,\"modDoorSpeaker\":-1,\"modBrakes\":-1,\"wheels\":6,\"modSeats\":-1,\"modFrontBumper\":-1,\"modHood\":-1,\"tankHealth\":1000.0}', 'vehicle', 0, NULL, NULL, 0),
('a023603b196b40b4a683b77429127786974fefc1', 'CVIA702', '{\"modAPlate\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modAirFilter\":-1,\"modTrimA\":-1,\"color2\":0,\"modRoof\":-1,\"modGrille\":-1,\"modXenon\":false,\"modAerials\":-1,\"modHydrolic\":-1,\"modDashboard\":-1,\"fuelLevel\":70.0,\"modExhaust\":-1,\"modTank\":-1,\"modTrunk\":-1,\"pearlescentColor\":32,\"modHorns\":-1,\"color1\":46,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":2,\"engineHealth\":1000.0,\"dirtLevel\":11.0,\"modSpeakers\":-1,\"modBackWheels\":-1,\"modOrnaments\":-1,\"modTransmission\":-1,\"modRearBumper\":-1,\"modFrame\":-1,\"modTrimB\":-1,\"modSmokeEnabled\":false,\"modFender\":-1,\"modArchCover\":-1,\"xenonColor\":255,\"extras\":{\"11\":false,\"10\":false,\"5\":false,\"12\":true},\"modWindows\":-1,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"wheelColor\":156,\"modArmor\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modSuspension\":-1,\"modFrontWheels\":-1,\"plate\":\"CVIA702\",\"neonEnabled\":[false,false,false,false],\"modLivery\":-1,\"neonColor\":[255,0,255],\"modDial\":-1,\"modStruts\":-1,\"model\":-1435919434,\"modTurbo\":false,\"modVanityPlate\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modShifterLeavers\":-1,\"bodyHealth\":1000.0,\"modDoorSpeaker\":-1,\"modBrakes\":-1,\"wheels\":4,\"modSeats\":-1,\"modFrontBumper\":-1,\"modHood\":-1,\"tankHealth\":1000.0}', 'vehicle', 0, NULL, NULL, 0),
('a023603b196b40b4a683b77429127786974fefc1', 'DZWH989', '{\"modAPlate\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modAirFilter\":-1,\"modTrimA\":-1,\"color2\":4,\"modRoof\":-1,\"modGrille\":-1,\"modXenon\":false,\"modAerials\":-1,\"modHydrolic\":-1,\"modDashboard\":-1,\"fuelLevel\":46.9,\"modExhaust\":-1,\"modTank\":-1,\"modTrunk\":-1,\"pearlescentColor\":5,\"modHorns\":-1,\"color1\":0,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":0,\"engineHealth\":1000.0,\"dirtLevel\":4.0,\"modSpeakers\":-1,\"modBackWheels\":-1,\"modOrnaments\":-1,\"modTransmission\":-1,\"modRearBumper\":-1,\"modFrame\":-1,\"modTrimB\":-1,\"modSmokeEnabled\":false,\"modFender\":-1,\"modArchCover\":-1,\"xenonColor\":255,\"extras\":[],\"modWindows\":-1,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"wheelColor\":112,\"modArmor\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modSuspension\":-1,\"modFrontWheels\":-1,\"plate\":\"DZWH989\",\"neonEnabled\":[false,false,false,false],\"modLivery\":-1,\"neonColor\":[255,0,255],\"modDial\":-1,\"modStruts\":-1,\"model\":86520421,\"modTurbo\":false,\"modVanityPlate\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modShifterLeavers\":-1,\"bodyHealth\":1000.0,\"modDoorSpeaker\":-1,\"modBrakes\":-1,\"wheels\":6,\"modSeats\":-1,\"modFrontBumper\":-1,\"modHood\":-1,\"tankHealth\":1000.0}', 'vehicle', 0, NULL, NULL, 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', 'EYRX674', '{\"modFrame\":-1,\"modTank\":-1,\"modRoof\":-1,\"modLivery\":-1,\"modAirFilter\":-1,\"model\":-304802106,\"modDashboard\":-1,\"tankHealth\":1000.0,\"modEngineBlock\":-1,\"modTrimA\":-1,\"dirtLevel\":4.0,\"pearlescentColor\":38,\"modRightFender\":-1,\"modFrontBumper\":-1,\"modExhaust\":-1,\"plate\":\"EYRX674\",\"modEngine\":-1,\"modHorns\":-1,\"modWindows\":-1,\"modHood\":-1,\"modSideSkirt\":-1,\"modRoofLivery\":-1,\"dashboardColor\":0,\"plateIndex\":0,\"modBackWheels\":-1,\"modTurbo\":false,\"modHydrolic\":-1,\"modSteeringWheel\":-1,\"modCustomFrontWheels\":false,\"color2\":0,\"modSuspension\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"bodyHealth\":1000.0,\"tyreSmokeColor\":[255,255,255],\"modStruts\":-1,\"interiorColor\":0,\"modSeats\":-1,\"modAPlate\":-1,\"modTransmission\":-1,\"neonEnabled\":[false,false,false,false],\"tyreBurst\":{\"5\":false,\"1\":false,\"0\":false,\"4\":false},\"fuelLevel\":65.0,\"modArmor\":-1,\"tyresCanBurst\":1,\"modPlateHolder\":-1,\"modSpoilers\":-1,\"modArchCover\":-1,\"extras\":{\"1\":1,\"2\":1,\"3\":1,\"4\":1,\"5\":1,\"11\":false,\"10\":false},\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"xenonColor\":255,\"windowsBroken\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"7\":false,\"0\":false},\"wheelColor\":156,\"modSpeakers\":-1,\"color1\":33,\"doorsBroken\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"0\":false},\"modAerials\":-1,\"modTrunk\":-1,\"modShifterLeavers\":-1,\"windowTint\":-1,\"modVanityPlate\":-1,\"wheels\":0,\"modXenon\":false,\"modGrille\":-1,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modSmokeEnabled\":false,\"modTrimB\":-1,\"modFender\":-1,\"modLightbar\":-1,\"modCustomBackWheels\":false,\"modBrakes\":-1,\"modFrontWheels\":-1}', 'vehicle', 0, NULL, NULL, 0),
('a023603b196b40b4a683b77429127786974fefc1', 'FUNL419', '{\"modAPlate\":-1,\"modRightFender\":-1,\"modEngine\":-1,\"modAirFilter\":-1,\"modTrimA\":-1,\"color2\":0,\"modRoof\":-1,\"modGrille\":-1,\"modXenon\":false,\"modAerials\":-1,\"modHydrolic\":-1,\"modDashboard\":-1,\"fuelLevel\":60.0,\"modExhaust\":-1,\"modTank\":-1,\"modTrunk\":-1,\"pearlescentColor\":18,\"modHorns\":-1,\"color1\":70,\"tyreSmokeColor\":[255,255,255],\"plateIndex\":0,\"engineHealth\":1000.0,\"dirtLevel\":3.0,\"modSpeakers\":-1,\"modBackWheels\":-1,\"modOrnaments\":-1,\"modTransmission\":-1,\"modRearBumper\":-1,\"modFrame\":-1,\"modTrimB\":-1,\"modSmokeEnabled\":false,\"modFender\":-1,\"modArchCover\":-1,\"xenonColor\":255,\"extras\":{\"1\":true},\"modWindows\":-1,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"wheelColor\":156,\"modArmor\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"modSuspension\":-1,\"modFrontWheels\":-1,\"plate\":\"FUNL419\",\"neonEnabled\":[false,false,false,false],\"modLivery\":-1,\"neonColor\":[255,0,255],\"modDial\":-1,\"modStruts\":-1,\"model\":-2098954619,\"modTurbo\":false,\"modVanityPlate\":-1,\"modSteeringWheel\":-1,\"windowTint\":-1,\"modShifterLeavers\":-1,\"bodyHealth\":1000.0,\"modDoorSpeaker\":-1,\"modBrakes\":-1,\"wheels\":5,\"modSeats\":-1,\"modFrontBumper\":-1,\"modHood\":-1,\"tankHealth\":1000.0}', 'vehicle', 0, NULL, NULL, 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'GDDZ178', '{\"modAerials\":-1,\"tankHealth\":1000.0,\"modTrimA\":-1,\"modEngineBlock\":-1,\"pearlescentColor\":127,\"modWindows\":-1,\"modStruts\":-1,\"neonEnabled\":[false,false,false,false],\"modHydrolic\":-1,\"modFrame\":-1,\"modSeats\":-1,\"engineHealth\":1000.0,\"plateIndex\":0,\"modTurbo\":false,\"modPlateHolder\":-1,\"modSteeringWheel\":-1,\"tyreSmokeColor\":[255,255,255],\"fuelLevel\":66.8,\"modDoorSpeaker\":-1,\"modExhaust\":-1,\"modArchCover\":-1,\"plate\":\"GDDZ178\",\"modDashboard\":-1,\"dirtLevel\":14.5,\"modRearBumper\":-1,\"modTrunk\":-1,\"modFrontBumper\":-1,\"wheelColor\":3,\"color2\":0,\"modDial\":-1,\"modBrakes\":-1,\"modHood\":-1,\"modGrille\":-1,\"modRightFender\":-1,\"modSuspension\":-1,\"modSmokeEnabled\":false,\"modTank\":-1,\"modLivery\":-1,\"modShifterLeavers\":-1,\"xenonColor\":255,\"modSpoilers\":-1,\"color1\":71,\"modFender\":-1,\"modTrimB\":-1,\"modFrontWheels\":-1,\"modVanityPlate\":-1,\"modOrnaments\":-1,\"modEngine\":-1,\"modSideSkirt\":-1,\"modRoof\":-1,\"extras\":[],\"windowTint\":-1,\"modTransmission\":-1,\"modAirFilter\":-1,\"bodyHealth\":1000.0,\"modSpeakers\":-1,\"wheels\":0,\"modHorns\":-1,\"modArmor\":-1,\"modXenon\":false,\"model\":-1858654120,\"neonColor\":[255,0,255],\"modBackWheels\":-1,\"modAPlate\":-1}', 'vehicle', 1, NULL, NULL, 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', 'GMYN543', '{\"modFrame\":-1,\"modTank\":-1,\"modRoof\":-1,\"modLivery\":-1,\"modAirFilter\":-1,\"model\":-1479664699,\"modDashboard\":-1,\"tankHealth\":1000.0,\"modEngineBlock\":-1,\"modTrimA\":-1,\"dirtLevel\":5.0,\"pearlescentColor\":3,\"modRightFender\":-1,\"modFrontBumper\":-1,\"modExhaust\":-1,\"plate\":\"GMYN543\",\"modEngine\":-1,\"modHorns\":-1,\"modWindows\":-1,\"modHood\":-1,\"modSideSkirt\":-1,\"modRoofLivery\":-1,\"dashboardColor\":0,\"plateIndex\":0,\"modBackWheels\":-1,\"modTurbo\":false,\"modHydrolic\":-1,\"modSteeringWheel\":-1,\"modCustomFrontWheels\":false,\"color2\":13,\"modSuspension\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"bodyHealth\":1000.0,\"tyreSmokeColor\":[255,255,255],\"modStruts\":-1,\"interiorColor\":0,\"modSeats\":-1,\"modAPlate\":-1,\"modTransmission\":-1,\"neonEnabled\":[false,false,false,false],\"tyreBurst\":{\"5\":false,\"1\":false,\"0\":false,\"4\":false},\"fuelLevel\":45.0,\"modArmor\":-1,\"tyresCanBurst\":1,\"modPlateHolder\":-1,\"modSpoilers\":-1,\"modArchCover\":-1,\"extras\":[],\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"xenonColor\":255,\"windowsBroken\":{\"1\":false,\"2\":false,\"3\":false,\"4\":true,\"5\":true,\"6\":false,\"7\":false,\"0\":false},\"wheelColor\":0,\"modSpeakers\":-1,\"color1\":126,\"doorsBroken\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"0\":false},\"modAerials\":-1,\"modTrunk\":-1,\"modShifterLeavers\":-1,\"windowTint\":-1,\"modVanityPlate\":-1,\"wheels\":4,\"modXenon\":false,\"modGrille\":-1,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modSmokeEnabled\":false,\"modTrimB\":-1,\"modFender\":-1,\"modLightbar\":-1,\"modCustomBackWheels\":false,\"modBrakes\":-1,\"modFrontWheels\":-1}', 'vehicle', 0, NULL, NULL, 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'GRMY007', '{\"modShifterLeavers\":-1,\"model\":-619930876,\"modFrontWheels\":-1,\"modGrille\":-1,\"engineHealth\":991.7,\"tankHealth\":999.8,\"modOrnaments\":-1,\"xenonColor\":255,\"modTrunk\":-1,\"modVanityPlate\":-1,\"modAPlate\":-1,\"modHydrolic\":-1,\"modArmor\":-1,\"modAerials\":-1,\"plateIndex\":0,\"modSpeakers\":-1,\"modDoorSpeaker\":-1,\"modDashboard\":-1,\"modSuspension\":-1,\"modStruts\":-1,\"modSteeringWheel\":-1,\"modXenon\":false,\"pearlescentColor\":111,\"modLivery\":-1,\"modSeats\":-1,\"modEngineBlock\":-1,\"modBackWheels\":-1,\"modFrontBumper\":-1,\"neonEnabled\":[false,false,false,false],\"modWindows\":-1,\"modTurbo\":1,\"neonColor\":[255,0,255],\"color1\":111,\"modRearBumper\":-1,\"modSideSkirt\":-1,\"modPlateHolder\":-1,\"extras\":[],\"modHood\":-1,\"modTrimB\":-1,\"modFrame\":-1,\"dirtLevel\":5.4,\"modTank\":-1,\"modTrimA\":-1,\"plate\":\"GRMY007\",\"modArchCover\":-1,\"modExhaust\":-1,\"modDial\":-1,\"modBrakes\":2,\"tyreSmokeColor\":[255,255,255],\"modEngine\":3,\"windowTint\":-1,\"wheels\":0,\"bodyHealth\":998.5,\"modSmokeEnabled\":false,\"modFender\":-1,\"modRoof\":-1,\"color2\":0,\"modHorns\":-1,\"modAirFilter\":-1,\"fuelLevel\":51.0,\"modSpoilers\":-1,\"wheelColor\":0,\"modTransmission\":2,\"modRightFender\":-1}', 'vehicle', 1, NULL, NULL, 0),
('a023603b196b40b4a683b77429127786974fefc1', 'HCIE863', '{\"modTrunk\":-1,\"modArchCover\":-1,\"modXenon\":false,\"modBrakes\":-1,\"dirtLevel\":4.0,\"modAPlate\":-1,\"modDashboard\":-1,\"modDial\":-1,\"bodyHealth\":1000.0,\"modFrontBumper\":-1,\"modGrille\":-1,\"modBackWheels\":-1,\"xenonColor\":255,\"modVanityPlate\":-1,\"model\":1118611807,\"modFrontWheels\":-1,\"neonEnabled\":[false,false,false,false],\"modSeats\":-1,\"windowTint\":-1,\"wheels\":5,\"extras\":[],\"modSmokeEnabled\":false,\"wheelColor\":156,\"tankHealth\":1000.0,\"modPlateHolder\":-1,\"modTransmission\":-1,\"modTrimA\":-1,\"modSteeringWheel\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"color2\":111,\"fuelLevel\":65.0,\"modWindows\":-1,\"modSuspension\":-1,\"neonColor\":[255,0,255],\"modAerials\":-1,\"modRightFender\":-1,\"modFrame\":-1,\"modSideSkirt\":-1,\"modHorns\":-1,\"modTurbo\":false,\"modHydrolic\":-1,\"modEngine\":-1,\"modExhaust\":-1,\"modOrnaments\":-1,\"modArmor\":-1,\"modTank\":-1,\"modEngineBlock\":-1,\"modRoof\":-1,\"modSpoilers\":-1,\"modFender\":-1,\"modStruts\":-1,\"modAirFilter\":-1,\"modShifterLeavers\":-1,\"plate\":\"HCIE863\",\"engineHealth\":1000.0,\"modRearBumper\":-1,\"pearlescentColor\":138,\"plateIndex\":0,\"modTrimB\":-1,\"modDoorSpeaker\":-1,\"modLivery\":-1,\"color1\":29,\"modSpeakers\":-1}', 'vehicle', 0, NULL, NULL, 0),
('a023603b196b40b4a683b77429127786974fefc1', 'IGEI831', '{\"extras\":[],\"modRightFender\":-1,\"modArmor\":-1,\"modFrame\":-1,\"model\":1118611807,\"modEngineBlock\":-1,\"modGrille\":-1,\"modSideSkirt\":-1,\"dirtLevel\":5.0,\"color1\":53,\"modSteeringWheel\":-1,\"modOrnaments\":-1,\"modTank\":-1,\"modRearBumper\":-1,\"modTrunk\":-1,\"modSuspension\":-1,\"modFender\":-1,\"plate\":\"IGEI831\",\"pearlescentColor\":138,\"modStruts\":-1,\"modSpoilers\":-1,\"neonEnabled\":[false,false,false,false],\"modTransmission\":-1,\"modPlateHolder\":-1,\"modAPlate\":-1,\"modRoof\":-1,\"windowTint\":-1,\"wheelColor\":156,\"modSpeakers\":-1,\"modExhaust\":-1,\"modWindows\":-1,\"tankHealth\":1000.0,\"neonColor\":[255,0,255],\"fuelLevel\":47.9,\"modFrontWheels\":-1,\"modAirFilter\":-1,\"modBrakes\":-1,\"modDoorSpeaker\":-1,\"modHorns\":-1,\"modTrimA\":-1,\"modXenon\":false,\"modBackWheels\":-1,\"xenonColor\":255,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modHood\":-1,\"modFrontBumper\":-1,\"modDashboard\":-1,\"modHydrolic\":-1,\"modArchCover\":-1,\"plateIndex\":0,\"modShifterLeavers\":-1,\"modTrimB\":-1,\"modDial\":-1,\"modTurbo\":false,\"modAerials\":-1,\"wheels\":5,\"bodyHealth\":1000.0,\"modEngine\":-1,\"engineHealth\":1000.0,\"color2\":111,\"modSeats\":-1,\"modLivery\":-1,\"modSmokeEnabled\":false}', 'vehicle', 0, NULL, NULL, 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', 'IJKD624', '{\"modFrame\":-1,\"modTank\":-1,\"modRoof\":-1,\"modLivery\":-1,\"modAirFilter\":-1,\"model\":310284501,\"modDashboard\":-1,\"tankHealth\":1000.0,\"modEngineBlock\":-1,\"modTrimA\":-1,\"dirtLevel\":10.0,\"pearlescentColor\":131,\"modRightFender\":-1,\"modFrontBumper\":-1,\"modExhaust\":-1,\"plate\":\"IJKD624\",\"modEngine\":-1,\"modHorns\":-1,\"modWindows\":-1,\"modHood\":-1,\"modSideSkirt\":-1,\"modRoofLivery\":-1,\"dashboardColor\":111,\"plateIndex\":0,\"modBackWheels\":-1,\"modTurbo\":false,\"modHydrolic\":-1,\"modSteeringWheel\":-1,\"modCustomFrontWheels\":false,\"color2\":93,\"modSuspension\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"bodyHealth\":1000.0,\"tyreSmokeColor\":[255,255,255],\"modStruts\":-1,\"interiorColor\":13,\"modSeats\":-1,\"modAPlate\":-1,\"modTransmission\":-1,\"neonEnabled\":[false,false,false,false],\"tyreBurst\":{\"5\":false,\"1\":false,\"0\":false,\"4\":false},\"fuelLevel\":65.0,\"modArmor\":-1,\"tyresCanBurst\":1,\"modPlateHolder\":-1,\"modSpoilers\":-1,\"modArchCover\":-1,\"extras\":[],\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"xenonColor\":255,\"windowsBroken\":{\"1\":false,\"2\":false,\"3\":false,\"4\":true,\"5\":true,\"6\":false,\"7\":false,\"0\":false},\"wheelColor\":0,\"modSpeakers\":-1,\"color1\":34,\"doorsBroken\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"6\":false,\"0\":false},\"modAerials\":-1,\"modTrunk\":-1,\"modShifterLeavers\":-1,\"windowTint\":-1,\"modVanityPlate\":-1,\"wheels\":2,\"modXenon\":false,\"modGrille\":-1,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modSmokeEnabled\":false,\"modTrimB\":-1,\"modFender\":-1,\"modLightbar\":-1,\"modCustomBackWheels\":false,\"modBrakes\":-1,\"modFrontWheels\":-1}', 'vehicle', 0, NULL, NULL, 0),
('a023603b196b40b4a683b77429127786974fefc1', 'IRIF734', '{\"modFrame\":-1,\"modSeats\":-1,\"modAirFilter\":-1,\"modWindows\":-1,\"modRearBumper\":-1,\"modPlateHolder\":-1,\"modSmokeEnabled\":1,\"tankHealth\":1000.0,\"tyreSmokeColor\":[255,255,255],\"modLivery\":-1,\"modDial\":-1,\"color1\":29,\"modTank\":-1,\"modFrontWheels\":-1,\"modEngine\":-1,\"modRoof\":-1,\"xenonColor\":255,\"pearlescentColor\":138,\"modTrunk\":-1,\"modCustomBackWheels\":false,\"modVanityPlate\":-1,\"modSideSkirt\":-1,\"modRightFender\":-1,\"modTrimA\":-1,\"modHood\":-1,\"interiorColor\":3,\"modSuspension\":-1,\"plateIndex\":0,\"modBrakes\":-1,\"color2\":111,\"windowTint\":-1,\"modArchCover\":-1,\"fuelLevel\":45.7,\"model\":1118611807,\"modRoofLivery\":-1,\"bodyHealth\":1000.0,\"doorsBroken\":{\"5\":false,\"4\":false,\"3\":false,\"2\":false,\"1\":false,\"0\":false},\"modDashboard\":-1,\"modSpoilers\":-1,\"modArmor\":-1,\"modOrnaments\":-1,\"engineHealth\":1000.0,\"modSpeakers\":-1,\"modDoorSpeaker\":-1,\"modAPlate\":-1,\"modFender\":-1,\"tyresCanBurst\":1,\"modShifterLeavers\":-1,\"wheelColor\":156,\"modAerials\":-1,\"wheels\":5,\"modBackWheels\":-1,\"dashboardColor\":160,\"modEngineBlock\":-1,\"modHydrolic\":-1,\"modTransmission\":-1,\"tyreBurst\":{\"1\":false,\"4\":false,\"5\":false,\"0\":false},\"modHorns\":-1,\"neonColor\":[255,0,255],\"modExhaust\":-1,\"modTurbo\":false,\"modSteeringWheel\":-1,\"modTrimB\":-1,\"modFrontBumper\":-1,\"modCustomFrontWheels\":false,\"dirtLevel\":6.0,\"modStruts\":-1,\"plate\":\"IRIF734\",\"neonEnabled\":[false,false,false,false],\"extras\":[],\"modLightbar\":-1,\"windowsBroken\":{\"5\":true,\"4\":true,\"3\":false,\"2\":false,\"1\":false,\"0\":false,\"7\":false,\"6\":false},\"modXenon\":false,\"modGrille\":-1}', 'vehicle', 1, NULL, NULL, 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', 'IXRF946', '{\"modLivery\":-1,\"modShifterLeavers\":-1,\"modCustomFrontWheels\":false,\"modStruts\":-1,\"modWindows\":-1,\"modTrimB\":-1,\"modFrame\":-1,\"modSideSkirt\":-1,\"modLightbar\":-1,\"modSuspension\":-1,\"extras\":[],\"modHood\":-1,\"wheels\":5,\"tyreSmokeColor\":[255,255,255],\"tyresCanBurst\":1,\"plate\":\"IXRF946\",\"modSmokeEnabled\":false,\"modSteeringWheel\":-1,\"modArchCover\":-1,\"modHorns\":-1,\"modTrimA\":-1,\"modDashboard\":-1,\"modSeats\":-1,\"modAirFilter\":-1,\"modGrille\":-1,\"tankHealth\":1000.0,\"modExhaust\":-1,\"modTransmission\":-1,\"pearlescentColor\":138,\"wheelColor\":156,\"modPlateHolder\":-1,\"modTrunk\":-1,\"bodyHealth\":1000.0,\"dirtLevel\":4.0,\"fuelLevel\":65.0,\"tyreBurst\":{\"4\":false,\"5\":false,\"0\":false,\"1\":false},\"modHydrolic\":-1,\"modSpeakers\":-1,\"modSpoilers\":-1,\"color2\":111,\"color1\":29,\"modVanityPlate\":-1,\"windowsBroken\":{\"0\":false,\"7\":false,\"6\":false,\"5\":true,\"4\":true,\"3\":false,\"2\":false,\"1\":false},\"modAPlate\":-1,\"modDoorSpeaker\":-1,\"neonEnabled\":[false,false,false,false],\"modEngine\":-1,\"modFrontWheels\":-1,\"modRearBumper\":-1,\"doorsBroken\":{\"0\":false,\"5\":false,\"4\":false,\"3\":false,\"2\":false,\"1\":false},\"modFender\":-1,\"engineHealth\":1000.0,\"modTurbo\":false,\"modCustomBackWheels\":false,\"modRoofLivery\":-1,\"plateIndex\":0,\"modXenon\":false,\"modAerials\":-1,\"modDial\":-1,\"xenonColor\":255,\"modArmor\":-1,\"modBrakes\":-1,\"model\":1118611807,\"modBackWheels\":-1,\"windowTint\":-1,\"modRoof\":-1,\"interiorColor\":3,\"neonColor\":[255,0,255],\"dashboardColor\":160,\"modFrontBumper\":-1,\"modTank\":-1,\"modOrnaments\":-1,\"modRightFender\":-1,\"modEngineBlock\":-1}', 'vehicle', 0, NULL, NULL, 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', 'JWZX794', '{\"modFrame\":-1,\"modTank\":-1,\"modRoof\":-1,\"modLivery\":-1,\"modAirFilter\":-1,\"model\":1617472902,\"modDashboard\":-1,\"tankHealth\":1000.0,\"modEngineBlock\":-1,\"modTrimA\":-1,\"dirtLevel\":8.0,\"pearlescentColor\":6,\"modRightFender\":-1,\"modFrontBumper\":-1,\"modExhaust\":-1,\"plate\":\"JWZX794\",\"modEngine\":-1,\"modHorns\":-1,\"modWindows\":-1,\"modHood\":-1,\"modSideSkirt\":-1,\"modRoofLivery\":-1,\"dashboardColor\":156,\"plateIndex\":0,\"modBackWheels\":-1,\"modTurbo\":false,\"modHydrolic\":-1,\"modSteeringWheel\":-1,\"modCustomFrontWheels\":false,\"color2\":120,\"modSuspension\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"bodyHealth\":1000.0,\"tyreSmokeColor\":[255,255,255],\"modStruts\":-1,\"interiorColor\":3,\"modSeats\":-1,\"modAPlate\":-1,\"modTransmission\":-1,\"neonEnabled\":[false,false,false,false],\"tyreBurst\":{\"5\":false,\"1\":false,\"0\":false,\"4\":false},\"fuelLevel\":65.0,\"modArmor\":-1,\"tyresCanBurst\":1,\"modPlateHolder\":-1,\"modSpoilers\":-1,\"modArchCover\":-1,\"extras\":[],\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"xenonColor\":255,\"windowsBroken\":{\"1\":false,\"2\":false,\"3\":false,\"4\":true,\"5\":false,\"6\":false,\"7\":false,\"0\":false},\"wheelColor\":0,\"modSpeakers\":-1,\"color1\":68,\"doorsBroken\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"5\":false,\"0\":false},\"modAerials\":-1,\"modTrunk\":-1,\"modShifterLeavers\":-1,\"windowTint\":-1,\"modVanityPlate\":-1,\"wheels\":1,\"modXenon\":false,\"modGrille\":-1,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modSmokeEnabled\":false,\"modTrimB\":-1,\"modFender\":-1,\"modLightbar\":-1,\"modCustomBackWheels\":false,\"modBrakes\":-1,\"modFrontWheels\":-1}', 'vehicle', 0, NULL, NULL, 0),
('66c38cd1bdaaa07a75574f0076f3f2fd94c9ffe2', 'MQPZ873', '{\"modHorns\":15,\"modHydrolic\":-1,\"wheelColor\":156,\"modTransmission\":2,\"modArchCover\":-1,\"pearlescentColor\":156,\"modSmokeEnabled\":false,\"modShifterLeavers\":-1,\"modGrille\":-1,\"modOrnaments\":-1,\"modBackWheels\":-1,\"modLivery\":-1,\"neonEnabled\":[1,1,1,1],\"modRightFender\":-1,\"modHood\":2,\"modDashboard\":-1,\"modWindows\":-1,\"modVanityPlate\":-1,\"modTrimB\":-1,\"windowTint\":-1,\"modFender\":-1,\"extras\":[],\"neonColor\":[2,2,255],\"modSeats\":-1,\"modSteeringWheel\":-1,\"modFrontWheels\":6,\"modTurbo\":1,\"modArmor\":-1,\"modStruts\":-1,\"modSpoilers\":2,\"tankHealth\":1000.0,\"bodyHealth\":1000.0,\"modTrimA\":-1,\"modSideSkirt\":1,\"modAPlate\":-1,\"color2\":129,\"xenonColor\":255,\"modSuspension\":1,\"modPlateHolder\":-1,\"modDial\":-1,\"modExhaust\":1,\"fuelLevel\":46.9,\"modAerials\":-1,\"modFrame\":-1,\"modXenon\":false,\"plate\":\"MQPZ873\",\"model\":-1485523546,\"modRearBumper\":0,\"modSpeakers\":-1,\"modEngineBlock\":-1,\"wheels\":4,\"modRoof\":0,\"dirtLevel\":0.0,\"modEngine\":3,\"engineHealth\":1000.0,\"tyreSmokeColor\":[255,255,255],\"modBrakes\":2,\"modFrontBumper\":2,\"plateIndex\":0,\"modAirFilter\":-1,\"modTrunk\":-1,\"modDoorSpeaker\":-1,\"color1\":110,\"modTank\":-1}', 'vehicle', 1, NULL, NULL, 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'MTCF611', '{\"color1\":0,\"modArmor\":-1,\"modAirFilter\":-1,\"modPlateHolder\":-1,\"plateIndex\":0,\"modAPlate\":-1,\"modEngine\":-1,\"neonEnabled\":[false,false,false,false],\"modTrimA\":-1,\"modXenon\":false,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"pearlescentColor\":3,\"modArchCover\":-1,\"modRearBumper\":-1,\"modSideSkirt\":-1,\"modGrille\":-1,\"tankHealth\":1000.0,\"modBackWheels\":-1,\"modDashboard\":-1,\"wheels\":0,\"modHood\":-1,\"modFender\":-1,\"modRightFender\":-1,\"wheelColor\":0,\"modFrame\":-1,\"modEngineBlock\":-1,\"engineHealth\":981.6,\"modHydrolic\":-1,\"modOrnaments\":-1,\"fuelLevel\":21.9,\"neonColor\":[255,0,255],\"xenonColor\":255,\"model\":1070967343,\"modTrimB\":-1,\"modTransmission\":-1,\"plate\":\"MTCF611\",\"modRoof\":-1,\"modExhaust\":-1,\"modSuspension\":-1,\"modWindows\":-1,\"modAerials\":-1,\"modTurbo\":false,\"bodyHealth\":978.1,\"modVanityPlate\":-1,\"extras\":[],\"modFrontWheels\":-1,\"windowTint\":-1,\"modShifterLeavers\":-1,\"modSpeakers\":-1,\"color2\":0,\"modTrunk\":-1,\"modTank\":-1,\"dirtLevel\":0.0,\"modDial\":-1,\"modSpoilers\":-1,\"modSteeringWheel\":-1,\"modBrakes\":-1,\"modLivery\":-1,\"modDoorSpeaker\":-1,\"modStruts\":-1,\"modSeats\":-1,\"modHorns\":-1,\"modFrontBumper\":-1}', 'bateau', 1, NULL, NULL, 0),
('29a9462e64ddfed46096292b656966175087ffd9', 'QZDU482', '{\"modSuspension\":-1,\"modVanityPlate\":-1,\"modSideSkirt\":-1,\"modSteeringWheel\":-1,\"modBrakes\":-1,\"color1\":0,\"modTank\":-1,\"modEngine\":-1,\"modDashboard\":-1,\"modAPlate\":-1,\"modTrunk\":-1,\"windowTint\":-1,\"modExhaust\":-1,\"modSmokeEnabled\":false,\"modLivery\":-1,\"modSpeakers\":-1,\"modRoof\":-1,\"wheels\":0,\"wheelColor\":156,\"tyreSmokeColor\":[255,255,255],\"color2\":0,\"modRightFender\":-1,\"modRearBumper\":-1,\"dirtLevel\":0.0,\"modEngineBlock\":-1,\"modFrontWheels\":-1,\"plateIndex\":0,\"fuelLevel\":65.0,\"modHorns\":-1,\"modPlateHolder\":-1,\"xenonColor\":255,\"modSpoilers\":-1,\"modAirFilter\":-1,\"modTurbo\":false,\"modTransmission\":-1,\"modXenon\":false,\"tankHealth\":1000.0,\"engineHealth\":1000.0,\"modTrimA\":-1,\"modFrame\":-1,\"modHydrolic\":-1,\"modHood\":-1,\"modWindows\":-1,\"model\":736902334,\"modDoorSpeaker\":-1,\"modGrille\":-1,\"modBackWheels\":-1,\"modFrontBumper\":-1,\"modDial\":-1,\"extras\":{\"11\":true,\"12\":false},\"plate\":\"QZDU482\",\"pearlescentColor\":2,\"modShifterLeavers\":-1,\"neonEnabled\":[false,false,false,false],\"modAerials\":-1,\"modStruts\":-1,\"bodyHealth\":1000.0,\"modArchCover\":-1,\"neonColor\":[255,0,255],\"modSeats\":-1,\"modTrimB\":-1,\"modOrnaments\":-1,\"modArmor\":-1,\"modFender\":-1}', 'vehicle', 1, NULL, NULL, 0),
('47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 'STEV216', '{\"modAirFilter\":-1,\"modPlateHolder\":-1,\"modTrimB\":-1,\"modEngineBlock\":-1,\"modFrontBumper\":-1,\"modBackWheels\":-1,\"modFrame\":-1,\"modFrontWheels\":-1,\"color1\":70,\"modRoof\":-1,\"modArmor\":-1,\"modBrakes\":-1,\"modSpeakers\":-1,\"modHydrolic\":-1,\"modVanityPlate\":-1,\"pearlescentColor\":18,\"modAerials\":-1,\"wheelColor\":156,\"modSteeringWheel\":-1,\"modTurbo\":false,\"engineHealth\":1000.0,\"modTank\":-1,\"modFender\":-1,\"modStruts\":-1,\"fuelLevel\":60.0,\"modSpoilers\":-1,\"modDashboard\":-1,\"modSuspension\":-1,\"modSmokeEnabled\":false,\"modDoorSpeaker\":-1,\"neonColor\":[255,0,255],\"modRightFender\":-1,\"windowTint\":-1,\"modExhaust\":-1,\"modArchCover\":-1,\"neonEnabled\":[false,false,false,false],\"modOrnaments\":-1,\"plate\":\"STEV216\",\"modRearBumper\":-1,\"modSeats\":-1,\"modTrunk\":-1,\"model\":-2098954619,\"dirtLevel\":4.1,\"bodyHealth\":1000.0,\"modXenon\":false,\"color2\":0,\"modSideSkirt\":-1,\"modEngine\":-1,\"xenonColor\":255,\"tankHealth\":1000.0,\"extras\":{\"1\":true},\"modHood\":-1,\"modLivery\":-1,\"plateIndex\":0,\"modWindows\":-1,\"modAPlate\":-1,\"modTransmission\":-1,\"modHorns\":-1,\"modTrimA\":-1,\"modDial\":-1,\"wheels\":5,\"modGrille\":-1,\"modShifterLeavers\":-1,\"tyreSmokeColor\":[255,255,255]}', 'vehicle', 1, NULL, NULL, 0),
('29a9462e64ddfed46096292b656966175087ffd9', 'TOIO781', '{\"modLivery\":-1,\"modTransmission\":-1,\"modAirFilter\":-1,\"modBackWheels\":3,\"modSideSkirt\":-1,\"wheels\":1,\"modDial\":-1,\"pearlescentColor\":120,\"modHood\":-1,\"wheelColor\":88,\"fuelLevel\":37.4,\"modSpeakers\":-1,\"modSeats\":-1,\"engineHealth\":1000.0,\"modSuspension\":-1,\"modShifterLeavers\":-1,\"modFrontBumper\":-1,\"modRoof\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"extras\":{\"1\":false,\"2\":true,\"3\":false},\"modSteeringWheel\":-1,\"xenonColor\":255,\"modStruts\":-1,\"neonEnabled\":[false,false,false,false],\"modTrimA\":-1,\"plate\":\"TOIO781\",\"model\":-1361687965,\"modOrnaments\":-1,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"modArmor\":-1,\"modAerials\":-1,\"tyreSmokeColor\":[255,255,255],\"modBrakes\":-1,\"modHorns\":-1,\"modRightFender\":-1,\"modGrille\":-1,\"color2\":25,\"color1\":142,\"modTurbo\":false,\"modArchCover\":-1,\"modFrame\":-1,\"bodyHealth\":1000.0,\"modSpoilers\":-1,\"modFrontWheels\":-1,\"neonColor\":[255,0,255],\"modDoorSpeaker\":-1,\"modFender\":-1,\"modVanityPlate\":-1,\"modXenon\":false,\"modAPlate\":-1,\"modSmokeEnabled\":false,\"modEngine\":-1,\"plateIndex\":0,\"tankHealth\":1000.0,\"modRearBumper\":-1,\"dirtLevel\":0.0,\"windowTint\":-1,\"modDashboard\":-1,\"modTank\":-1,\"modTrunk\":-1,\"modWindows\":-1,\"modHydrolic\":-1}', 'vehicle', 1, NULL, NULL, 0),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', 'TZIF571', '{\"modFrame\":-1,\"modTank\":-1,\"modRoof\":-1,\"modLivery\":-1,\"modAirFilter\":-1,\"model\":-591610296,\"modDashboard\":-1,\"tankHealth\":1000.0,\"modEngineBlock\":-1,\"modTrimA\":-1,\"dirtLevel\":8.0,\"pearlescentColor\":60,\"modRightFender\":-1,\"modFrontBumper\":-1,\"modExhaust\":-1,\"plate\":\"TZIF571\",\"modEngine\":-1,\"modHorns\":-1,\"modWindows\":-1,\"modHood\":-1,\"modSideSkirt\":-1,\"modRoofLivery\":-1,\"dashboardColor\":0,\"plateIndex\":0,\"modBackWheels\":-1,\"modTurbo\":false,\"modHydrolic\":-1,\"modSteeringWheel\":-1,\"modCustomFrontWheels\":false,\"color2\":52,\"modSuspension\":-1,\"modOrnaments\":-1,\"modDial\":-1,\"bodyHealth\":1000.0,\"tyreSmokeColor\":[255,255,255],\"modStruts\":-1,\"interiorColor\":0,\"modSeats\":-1,\"modAPlate\":-1,\"modTransmission\":-1,\"neonEnabled\":[false,false,false,false],\"tyreBurst\":{\"5\":false,\"1\":false,\"0\":false,\"4\":false},\"fuelLevel\":65.0,\"modArmor\":-1,\"tyresCanBurst\":1,\"modPlateHolder\":-1,\"modSpoilers\":-1,\"modArchCover\":-1,\"extras\":{\"10\":false,\"12\":1},\"neonColor\":[255,0,255],\"modRearBumper\":-1,\"xenonColor\":255,\"windowsBroken\":{\"1\":false,\"2\":false,\"3\":false,\"4\":true,\"5\":true,\"6\":false,\"7\":false,\"0\":false},\"wheelColor\":156,\"modSpeakers\":-1,\"color1\":52,\"doorsBroken\":{\"1\":false,\"2\":false,\"3\":false,\"4\":false,\"0\":false},\"modAerials\":-1,\"modTrunk\":-1,\"modShifterLeavers\":-1,\"windowTint\":-1,\"modVanityPlate\":-1,\"wheels\":7,\"modXenon\":false,\"modGrille\":-1,\"engineHealth\":1000.0,\"modDoorSpeaker\":-1,\"modSmokeEnabled\":false,\"modTrimB\":-1,\"modFender\":-1,\"modLightbar\":-1,\"modCustomBackWheels\":false,\"modBrakes\":-1,\"modFrontWheels\":-1}', 'vehicle', 0, NULL, NULL, 0),
('a023603b196b40b4a683b77429127786974fefc1', 'UCAS421', '{\"modTrunk\":-1,\"modStruts\":-1,\"modXenon\":false,\"plate\":\"UCAS421\",\"color1\":33,\"modTrimA\":-1,\"modSideSkirt\":-1,\"modExhaust\":-1,\"modSteeringWheel\":-1,\"modTransmission\":-1,\"modRoof\":-1,\"modFrontBumper\":-1,\"modRearBumper\":-1,\"modSmokeEnabled\":false,\"modWindows\":-1,\"modHood\":-1,\"modArchCover\":-1,\"modSpoilers\":-1,\"modVanityPlate\":-1,\"modShifterLeavers\":-1,\"modPlateHolder\":-1,\"tankHealth\":997.8,\"neonEnabled\":[false,false,false,false],\"modTrimB\":-1,\"wheelColor\":156,\"modSpeakers\":-1,\"modOrnaments\":-1,\"modHydrolic\":-1,\"color2\":118,\"modTank\":-1,\"modBackWheels\":-1,\"model\":-440768424,\"modHorns\":-1,\"modGrille\":-1,\"wheels\":4,\"modDial\":-1,\"modRightFender\":-1,\"modLivery\":-1,\"windowTint\":-1,\"xenonColor\":255,\"modAPlate\":-1,\"modAerials\":-1,\"tyreSmokeColor\":[255,255,255],\"engineHealth\":906.7,\"modFrontWheels\":-1,\"extras\":[],\"modSeats\":-1,\"dirtLevel\":12.0,\"fuelLevel\":23.9,\"modBrakes\":-1,\"bodyHealth\":994.9,\"plateIndex\":0,\"modSuspension\":-1,\"pearlescentColor\":38,\"modDashboard\":-1,\"modArmor\":-1,\"modFender\":-1,\"neonColor\":[255,0,255],\"modTurbo\":false,\"modEngineBlock\":-1,\"modEngine\":-1,\"modFrame\":-1,\"modDoorSpeaker\":-1,\"modAirFilter\":-1}', 'vehicle', 1, NULL, NULL, 0),
('29a9462e64ddfed46096292b656966175087ffd9', 'VOAJ432', '{\"modLivery\":-1,\"modTransmission\":-1,\"modAirFilter\":-1,\"modBackWheels\":-1,\"modSideSkirt\":-1,\"wheels\":5,\"modDial\":-1,\"pearlescentColor\":138,\"modHood\":-1,\"wheelColor\":156,\"fuelLevel\":44.3,\"modSpeakers\":-1,\"modSeats\":-1,\"engineHealth\":1000.0,\"modSuspension\":-1,\"modShifterLeavers\":-1,\"modFrontBumper\":-1,\"modRoof\":-1,\"modExhaust\":-1,\"modTrimB\":-1,\"extras\":[],\"modSteeringWheel\":-1,\"xenonColor\":255,\"modStruts\":-1,\"neonEnabled\":[false,false,false,false],\"modTrimA\":-1,\"plate\":\"VOAJ432\",\"model\":1118611807,\"modOrnaments\":-1,\"modPlateHolder\":-1,\"modEngineBlock\":-1,\"modArmor\":-1,\"modAerials\":-1,\"tyreSmokeColor\":[255,255,255],\"modBrakes\":-1,\"modHorns\":-1,\"modRightFender\":-1,\"modGrille\":-1,\"color2\":111,\"color1\":29,\"modTurbo\":false,\"modArchCover\":-1,\"modFrame\":-1,\"bodyHealth\":1000.0,\"modSpoilers\":-1,\"modFrontWheels\":-1,\"neonColor\":[255,0,255],\"modDoorSpeaker\":-1,\"modFender\":-1,\"modVanityPlate\":-1,\"modXenon\":false,\"modAPlate\":-1,\"modSmokeEnabled\":false,\"modEngine\":-1,\"plateIndex\":0,\"tankHealth\":1000.0,\"modRearBumper\":-1,\"dirtLevel\":0.0,\"windowTint\":-1,\"modDashboard\":-1,\"modTank\":-1,\"modTrunk\":-1,\"modWindows\":-1,\"modHydrolic\":-1}', 'vehicle', 1, NULL, NULL, 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'VXTD249', '{\"tankHealth\":998.0,\"modTank\":-1,\"modArchCover\":-1,\"modTrimB\":-1,\"wheels\":0,\"modXenon\":false,\"modDial\":-1,\"modHydrolic\":-1,\"windowTint\":-1,\"plate\":\"VXTD249\",\"modRearBumper\":-1,\"modSteeringWheel\":-1,\"modEngine\":-1,\"modOrnaments\":-1,\"modArmor\":-1,\"modEngineBlock\":-1,\"modSuspension\":-1,\"modVanityPlate\":-1,\"modGrille\":-1,\"modTrunk\":-1,\"modTrimA\":-1,\"plateIndex\":0,\"modLivery\":-1,\"modWindows\":-1,\"modSpoilers\":-1,\"modAerials\":-1,\"modFender\":-1,\"neonEnabled\":[false,false,false,false],\"modHorns\":-1,\"modBackWheels\":-1,\"modAPlate\":-1,\"model\":-1858654120,\"modTransmission\":-1,\"modShifterLeavers\":-1,\"modAirFilter\":-1,\"modStruts\":-1,\"modSpeakers\":-1,\"engineHealth\":885.7,\"modPlateHolder\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrontBumper\":-1,\"modTurbo\":false,\"bodyHealth\":991.1,\"modHood\":-1,\"modFrontWheels\":-1,\"modSeats\":-1,\"modExhaust\":-1,\"xenonColor\":255,\"dirtLevel\":7.5,\"neonColor\":[255,0,255],\"modFrame\":-1,\"pearlescentColor\":6,\"wheelColor\":118,\"modRightFender\":-1,\"modRoof\":-1,\"modSmokeEnabled\":false,\"fuelLevel\":51.7,\"modBrakes\":-1,\"modSideSkirt\":-1,\"extras\":[],\"color1\":2,\"color2\":6,\"modDoorSpeaker\":-1,\"modDashboard\":-1}', 'vehicle', 1, NULL, NULL, 0),
('64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'XFRL274', '{\"modPlateHolder\":-1,\"modStruts\":-1,\"modWindows\":-1,\"model\":-570033273,\"modRoof\":-1,\"plate\":\"XFRL274\",\"modTrunk\":-1,\"modSpoilers\":-1,\"modSideSkirt\":-1,\"modVanityPlate\":-1,\"tyreSmokeColor\":[255,255,255],\"modArchCover\":-1,\"modExhaust\":-1,\"xenonColor\":255,\"modFrame\":-1,\"modBrakes\":-1,\"modFender\":-1,\"modTurbo\":false,\"modTransmission\":-1,\"extras\":[],\"modXenon\":false,\"modRightFender\":-1,\"modSmokeEnabled\":false,\"modFrontBumper\":-1,\"modOrnaments\":-1,\"modGrille\":-1,\"modSeats\":-1,\"plateIndex\":0,\"modDial\":-1,\"modAPlate\":-1,\"modHydrolic\":-1,\"modTrimA\":-1,\"modHorns\":-1,\"modLivery\":-1,\"modRearBumper\":-1,\"modArmor\":-1,\"modBackWheels\":-1,\"modShifterLeavers\":-1,\"tankHealth\":995.2,\"modAerials\":-1,\"neonColor\":[255,0,255],\"pearlescentColor\":0,\"modFrontWheels\":-1,\"windowTint\":-1,\"modTrimB\":-1,\"color2\":118,\"modDoorSpeaker\":-1,\"modHood\":-1,\"color1\":30,\"modSteeringWheel\":-1,\"modEngine\":-1,\"wheelColor\":35,\"modSpeakers\":-1,\"modAirFilter\":-1,\"dirtLevel\":1.5,\"wheels\":6,\"engineHealth\":921.5,\"modTank\":-1,\"modEngineBlock\":-1,\"modDashboard\":-1,\"neonEnabled\":[false,false,false,false],\"fuelLevel\":42.1,\"modSuspension\":-1,\"bodyHealth\":989.9}', 'motorcycles', 1, NULL, NULL, 0),
('28c4253db1bf82a66a8645b7e97de77334f61a9f', 'YTHZ225', '{\"modEngine\":-1,\"modHydrolic\":-1,\"modArmor\":-1,\"modVanityPlate\":-1,\"fuelLevel\":65.0,\"modRearBumper\":-1,\"wheelColor\":0,\"modStruts\":-1,\"extras\":[],\"color2\":0,\"modAPlate\":-1,\"modTank\":-1,\"tyreSmokeColor\":[255,255,255],\"modSmokeEnabled\":false,\"modTrunk\":-1,\"modOrnaments\":-1,\"modWindows\":-1,\"modPlateHolder\":-1,\"modLivery\":-1,\"modFender\":-1,\"tankHealth\":1000.0,\"modEngineBlock\":-1,\"modFrame\":-1,\"bodyHealth\":1000.0,\"neonEnabled\":[false,false,false,false],\"modExhaust\":-1,\"modDashboard\":-1,\"modRightFender\":-1,\"model\":-619930876,\"dirtLevel\":10.0,\"modHood\":-1,\"modBrakes\":-1,\"modTurbo\":false,\"modTrimA\":-1,\"modArchCover\":-1,\"xenonColor\":255,\"pearlescentColor\":111,\"modTrimB\":-1,\"modFrontWheels\":-1,\"modGrille\":-1,\"plate\":\"YTHZ225\",\"modSuspension\":-1,\"modAirFilter\":-1,\"modDial\":-1,\"modXenon\":false,\"modHorns\":-1,\"modBackWheels\":-1,\"modTransmission\":-1,\"modSteeringWheel\":-1,\"color1\":111,\"modAerials\":-1,\"modSpeakers\":-1,\"modSeats\":-1,\"modDoorSpeaker\":-1,\"modShifterLeavers\":-1,\"modFrontBumper\":-1,\"modSideSkirt\":-1,\"modSpoilers\":-1,\"plateIndex\":0,\"wheels\":0,\"modRoof\":-1,\"windowTint\":-1,\"engineHealth\":1000.0,\"neonColor\":[255,0,255]}', 'vehicle', 1, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `ox_inventory`
--

CREATE TABLE `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext DEFAULT NULL,
  `lastupdated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ox_inventory`
--

INSERT INTO `ox_inventory` (`owner`, `name`, `data`, `lastupdated`) VALUES
('', 'evidence-1', '[{\"name\":\"money\",\"slot\":8,\"count\":600443795}]', '2024-09-02 13:35:00'),
('a023603b196b40b4a683b77429127786974fefc1', 'policelocker', NULL, '2024-08-02 07:30:00');

-- --------------------------------------------------------

--
-- Structure de la table `pedoffline`
--

CREATE TABLE `pedoffline` (
  `identifier` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `pedoffline`
--

INSERT INTO `pedoffline` (`identifier`) VALUES
('a023603b196b40b4a683b77429127786974fefc1'),
('e43f74527c88cd8ff058f922bbb8ecaaf6fffc83');

-- --------------------------------------------------------

--
-- Structure de la table `playlist`
--

CREATE TABLE `playlist` (
  `id` int(11) NOT NULL,
  `job` varchar(25) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `url` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `playlist`
--

INSERT INTO `playlist` (`id`, `job`, `nom`, `url`) VALUES
(5, 'bahamas', 'TakeOFF Casper', 'https://www.youtube.com/watch?v=vnddx3dS6Ks'),
(6, 'bahamas', 'WERENOI - TUCIBI', 'https://www.youtube.com/watch?v=__B8wKj0uXc&list=RD__B8wKj0uXc&index=1&ab_channel=KoreVEVO');

-- --------------------------------------------------------

--
-- Structure de la table `rented_vehicles`
--

CREATE TABLE `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `tig`
--

CREATE TABLE `tig` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `nbrMission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `trunk_inventory`
--

CREATE TABLE `trunk_inventory` (
  `id` int(11) NOT NULL,
  `plate` varchar(8) NOT NULL,
  `data` text NOT NULL,
  `owned` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `trunk_inventory`
--

INSERT INTO `trunk_inventory` (`id`, `plate`, `data`, `owned`) VALUES
(46, '20XPD994', '{\"coffre\":[{\"name\":\"petit_appat\",\"count\":2}]}', 0),
(50, '21LTZ994', '{\"coffre\":[]}', 0),
(51, 'ZSDS 845', '{}', 1),
(52, '66ENC447', '{\"money\":[{\"amount\":1}]}', 0),
(53, '48SXF184', '{}', 0),
(54, '62MIX249', '{}', 0),
(55, '27ZNU178', '{}', 0),
(56, '02CVU812', '{}', 0),
(57, '82QJB243', '{}', 0),
(58, '64ERJ715', '{}', 0),
(59, '82QVY555', '{\"coffre\":[{\"count\":1,\"name\":\"pistol_ammo\"}]}', 0),
(61, '82QVY555', '{\"coffre\":[{\"count\":1,\"name\":\"pistol_ammo\"}]}', 0),
(62, '82QVY555', '{\"coffre\":[{\"count\":1,\"name\":\"pistol_ammo\"}]}', 0),
(63, '82QVY555', '{\"coffre\":[{\"count\":1,\"name\":\"pistol_ammo\"}]}', 0),
(64, '82QVY555', '{}', 0),
(65, '82QVY555', '{}', 0),
(66, '82QVY555', '{}', 0),
(67, '82QVY555', '{}', 0),
(68, '82QVY555', '{}', 0),
(69, '80NVL766', '{}', 0),
(70, '46NEB758', '{}', 0),
(71, '82TFF583', '{\"coffre\":[]}', 0),
(72, '45SSA836', '{\"coffre\":[]}', 0),
(73, '67VJN647', '{\"black_money\":[{\"amount\":3}]}', 0),
(74, 'ADMINCAR', '{\"coffre\":[{\"name\":\"grappe_raisin\",\"count\":2}]}', 0);

-- --------------------------------------------------------

--
-- Structure de la table `uniqueid`
--

CREATE TABLE `uniqueid` (
  `id` int(11) NOT NULL,
  `identifier` varchar(70) NOT NULL,
  `coins` int(11) NOT NULL DEFAULT 0,
  `vip` tinyint(1) NOT NULL DEFAULT 0,
  `expiration` bigint(25) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `uniqueid`
--

INSERT INTO `uniqueid` (`id`, `identifier`, `coins`, `vip`, `expiration`) VALUES
(38, 'a023603b196b40b4a683b77429127786974fefc1', 0, 0, 0),
(39, 'e43f74527c88cd8ff058f922bbb8ecaaf6fffc83', 0, 0, 0),
(40, 'ab7cdc233d113bbd0e9ded9a324cd87e9c269278', 0, 0, 0),
(41, '2dfb9bdbffc4cb57908e5edae96117ec6e5f8621', 0, 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `identifier` varchar(60) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `playtime` int(11) NOT NULL DEFAULT 0,
  `groupa` varchar(50) DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(50) NOT NULL DEFAULT 'unemployed',
  `job2_grade` int(11) NOT NULL DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `metadata` longtext DEFAULT NULL,
  `position` longtext DEFAULT '\'{"x": -1037.78,"y":-2738.03,"z":19.18,"heading":333.27}\'',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `tattoos` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `iban` varchar(255) DEFAULT NULL,
  `pincode` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`identifier`, `accounts`, `group`, `playtime`, `groupa`, `inventory`, `job`, `job_grade`, `job2`, `job2_grade`, `loadout`, `metadata`, `position`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `skin`, `tattoos`, `status`, `is_dead`, `iban`, `pincode`) VALUES
('2dfb9bdbffc4cb57908e5edae96117ec6e5f8621', '{\"bank\":50000,\"money\":0,\"black_money\":0}', 'user', 0, NULL, '[]', 'unemployed', 0, 'unemployed', 0, '[]', '{\"armor\":0,\"health\":200}', '{\"y\":-2723.498779296875,\"x\":-1032.764892578125,\"z\":-200.3157958984375}', 'Billy', 'Legrand', '1992/03/07', 'm', 175, '{\"pants_1\":0,\"eyebrows_1\":0,\"sex\":0,\"tshirt_1\":0,\"cheeks_1\":0,\"blush_1\":0,\"beard_1\":0,\"moles_2\":0,\"torso_2\":0,\"eyebrows_4\":0,\"chin_3\":0,\"sun_1\":0,\"watches_1\":-1,\"lipstick_1\":0,\"cheeks_2\":0,\"eyebrows_6\":0,\"eye_squint\":0,\"eye_color\":0,\"hair_color_2\":0,\"lipstick_3\":32,\"nose_1\":0,\"skin_md_weight\":50,\"blush_3\":\"2\",\"arms_2\":0,\"moles_1\":0,\"age_1\":0,\"tshirt_2\":0,\"cheeks_3\":0,\"nose_2\":0,\"nose_3\":0,\"beard_2\":0,\"jaw_1\":0,\"lipstick_2\":0,\"chain_1\":0,\"makeup_3\":0,\"shoes_1\":0,\"glasses_1\":-1,\"sun_2\":0,\"helmet_1\":-1,\"eyebrows_5\":0,\"nose_5\":0,\"pants_2\":0,\"blush_2\":0,\"hair_color_1\":0,\"shoes_2\":0,\"makeup_2\":0,\"beard_3\":61,\"face_md_weight\":50,\"lip_thickness\":0,\"ears_2\":-1,\"torso_1\":0,\"nose_4\":0,\"helmet_2\":-1,\"neck_thickness\":0,\"glasses_2\":-1,\"complexion_2\":0,\"chain_2\":0,\"chin_2\":0,\"ears_1\":-1,\"hair_1\":0,\"age_2\":0,\"nose_6\":0,\"eyebrows_2\":10,\"chin_1\":0,\"eyebrows_3\":0,\"complexion_1\":0,\"makeup_4\":0,\"chin_4\":0,\"arms\":0,\"watches_2\":-1,\"hair_2\":0,\"jaw_2\":0,\"makeup_1\":0}', NULL, '[{\"name\":\"hunger\",\"percent\":99.11,\"val\":991100},{\"name\":\"thirst\",\"percent\":99.3325,\"val\":993325}]', 0, NULL, NULL),
('a023603b196b40b4a683b77429127786974fefc1', '{\"bank\":49440,\"black_money\":0,\"money\":0}', 'admin', 1420, 'fondateur', '[]', 'lssd', 20, 'unemployed', 0, '[]', '{\"armor\":0,\"health\":170}', '{\"z\":13.9296875,\"y\":-3092.808837890625,\"x\":-949.6483764648438}', 'Tipi', 'Mathieu', '1999/11/11', 'm', 180, '{\"chest_1\":0,\"makeup_4\":0,\"jaw_1\":1,\"bags_1\":0,\"helmet_2\":-1,\"bodyb_2\":0,\"mask_1\":0,\"skin_md_weight\":50,\"blush_3\":\"2\",\"neck_thickness\":1,\"chin_2\":1,\"complexion_1\":0,\"nose_3\":1,\"makeup_2\":0,\"makeup_3\":0,\"face_md_weight\":50,\"chain_2\":0,\"blush_1\":0,\"dad\":15,\"moles_1\":0,\"sun_2\":0,\"cheeks_2\":1,\"chain_1\":0,\"torso_1\":135,\"age_1\":0,\"lipstick_1\":0,\"torso_2\":6,\"bodyb_4\":0,\"bodyb_3\":-1,\"glasses_1\":0,\"bracelets_1\":1,\"chest_2\":0,\"sex\":0,\"blemishes_2\":0,\"jaw_2\":1,\"mom\":23,\"arms\":0,\"lipstick_4\":0,\"watches_1\":3,\"bags_2\":0,\"nose_6\":1,\"arms_2\":0,\"lipstick_2\":0,\"ears_1\":-1,\"hair_2\":0,\"bproof_2\":0,\"helmet_1\":-1,\"lip_thickness\":1,\"chin_4\":1,\"decals_1\":0,\"tshirt_2\":0,\"eyebrows_4\":1,\"shoes_1\":10,\"hair_color_2\":0,\"watches_2\":0,\"tshirt_1\":15,\"cheeks_1\":1,\"eyebrows_2\":10,\"blush_2\":0,\"chin_1\":1,\"eyebrows_3\":1,\"age_2\":0,\"lipstick_3\":32,\"glasses_2\":0,\"chest_3\":0,\"cheeks_3\":1,\"beard_2\":10,\"bproof_1\":0,\"eyebrows_6\":1,\"blemishes_1\":0,\"eye_squint\":1,\"bodyb_1\":-1,\"decals_2\":0,\"nose_5\":1,\"complexion_2\":0,\"eyebrows_5\":1,\"hair_1\":76,\"ears_2\":-1,\"beard_3\":61,\"hair_color_1\":0,\"nose_4\":1,\"beard_1\":10,\"moles_2\":0,\"pants_1\":49,\"shoes_2\":0,\"sun_1\":0,\"eyebrows_1\":6,\"beard_4\":0,\"makeup_1\":1,\"nose_2\":1,\"mask_2\":0,\"bracelets_2\":0,\"chin_3\":1,\"eye_color\":1,\"pants_2\":1,\"nose_1\":1}', '[{\"Count\":1,\"nameHash\":\"MP_MP_Stunt_tat_006_M\",\"collection\":\"mpstunt_overlays\"},{\"Count\":1,\"nameHash\":\"FM_Tat_M_038\",\"collection\":\"multiplayer_overlays\"},{\"Count\":1,\"nameHash\":\"FM_Hip_M_Tat_003\",\"collection\":\"mphipster_overlays\"},{\"Count\":1,\"nameHash\":\"FM_Hip_M_Tat_007\",\"collection\":\"mphipster_overlays\"},{\"Count\":1,\"nameHash\":\"FM_Tat_M_006\",\"collection\":\"multiplayer_overlays\"}]', '[{\"name\":\"hunger\",\"val\":216700,\"percent\":21.67},{\"name\":\"thirst\",\"val\":287525,\"percent\":28.75249999999999}]', 0, NULL, NULL),
('ab7cdc233d113bbd0e9ded9a324cd87e9c269278', '{\"bank\":50000,\"black_money\":0,\"money\":0}', 'admin', 70, 'fondateur', '[]', 'unemployed', 0, 'unemployed', 0, '[]', '{\"armor\":0,\"health\":200}', '{\"y\":-1456.193359375,\"x\":-4.23296737670898,\"z\":45.3546142578125}', 'Ledada', 'Dada', '2000/05/07', 'm', 200, '{\"decals_2\":0,\"chest_1\":0,\"sex\":0,\"decals_1\":0,\"arms_2\":0,\"lip_thickness\":0,\"cheeks_1\":0,\"blemishes_2\":0,\"bags_1\":0,\"eyebrows_1\":0,\"chest_2\":0,\"jaw_1\":0,\"beard_4\":0,\"makeup_1\":0,\"sun_1\":0,\"mask_1\":0,\"ears_1\":-1,\"moles_2\":0,\"makeup_2\":0,\"nose_4\":0,\"bracelets_2\":0,\"makeup_4\":0,\"blemishes_1\":0,\"hair_color_2\":0,\"chin_1\":0,\"torso_2\":0,\"bodyb_4\":0,\"arms\":0,\"mask_2\":0,\"nose_1\":0,\"blush_1\":0,\"bodyb_2\":0,\"beard_1\":0,\"dad\":3,\"bags_2\":0,\"skin_md_weight\":50,\"bodyb_3\":-1,\"hair_2\":0,\"hair_1\":0,\"neck_thickness\":0,\"jaw_2\":0,\"chest_3\":0,\"lipstick_3\":32,\"tshirt_2\":0,\"eyebrows_2\":10,\"age_2\":0,\"hair_color_1\":0,\"cheeks_3\":0,\"glasses_2\":-1,\"glasses_1\":-1,\"beard_3\":61,\"face_md_weight\":50,\"lipstick_4\":0,\"eyebrows_5\":0,\"nose_3\":0,\"eye_squint\":0,\"tshirt_1\":0,\"beard_2\":0,\"mom\":23,\"eye_color\":0,\"chain_1\":0,\"chin_3\":0,\"nose_2\":0,\"shoes_1\":0,\"age_1\":0,\"chin_4\":0,\"lipstick_1\":0,\"bodyb_1\":-1,\"bproof_1\":0,\"complexion_1\":0,\"cheeks_2\":0,\"chain_2\":0,\"eyebrows_6\":0,\"makeup_3\":0,\"watches_1\":-1,\"torso_1\":0,\"lipstick_2\":0,\"helmet_2\":-1,\"sun_2\":0,\"eyebrows_4\":0,\"watches_2\":-1,\"pants_1\":0,\"chin_2\":0,\"ears_2\":-1,\"blush_3\":\"2\",\"helmet_1\":-1,\"eyebrows_3\":0,\"blush_2\":0,\"nose_5\":0,\"moles_1\":0,\"shoes_2\":0,\"pants_2\":0,\"bracelets_1\":-1,\"bproof_2\":0,\"nose_6\":0,\"complexion_2\":0}', NULL, '[{\"val\":776800,\"name\":\"hunger\",\"percent\":77.68},{\"val\":832600,\"name\":\"thirst\",\"percent\":83.26}]', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_licenses`
--

CREATE TABLE `user_licenses` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `owner` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_licenses`
--

INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
(1000, 'theory_a', 'a023603b196b40b4a683b77429127786974fefc1'),
(1001, 'drive', 'a023603b196b40b4a683b77429127786974fefc1');

-- --------------------------------------------------------

--
-- Structure de la table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  `stockage` int(10) DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicles`
--

INSERT INTO `vehicles` (`id`, `name`, `model`, `price`, `category`, `stockage`) VALUES
(1, 'Adder', 'adder', 400000, 'super', 30),
(2, 'Akuma', 'AKUMA', 35000, 'motorcycles', 15),
(3, 'Alpha', 'alpha', 47999, 'sports', 30),
(4, 'Asbo', 'asbo', 3400, 'compacts', 30),
(5, 'Asea', 'asea', 7500, 'sedans', 30),
(6, 'Asterope', 'asterope', 14500, 'sedans', 40),
(7, 'Astron', 'astron', 61000, 'suvs', 150),
(8, 'Autarch', 'autarch', 374500, 'super', 30),
(9, 'Avarus', 'avarus', 48500, 'motorcycles', 15),
(10, 'Bagger', 'bagger', 53750, 'motorcycles', 15),
(11, 'Baller', 'baller', 48950, 'suvs', 150),
(12, 'Baller', 'baller2', 56850, 'suvs', 150),
(13, 'Baller Sport', 'baller3', 59450, 'suvs', 150),
(14, 'Baller LE LWB', 'baller4', 63800, 'suvs', 150),
(15, 'Banshee', 'banshee', 39450, 'sports', 30),
(16, 'Banshee 900R', 'banshee2', 212000, 'super', 30),
(17, 'Bati 801', 'bati', 72000, 'motorcycles', 15),
(18, 'Bati 801RR', 'bati2', 84000, 'motorcycles', 15),
(19, 'Bestia GTS', 'bestiagts', 50250, 'sports', 30),
(20, 'BF400', 'bf400', 42500, 'motorcycles', 15),
(21, 'Bf Injection', 'bfinjection', 18450, 'offroad', 20),
(22, 'Bifta', 'bifta', 58500, 'offroad', 20),
(23, 'Bison', 'bison', 13800, 'vans', 150),
(24, 'BeeJay XL', 'bjxl', 48650, 'suvs', 150),
(25, 'Blade', 'blade', 29400, 'muscle', 30),
(26, 'Blazer', 'blazer', 16500, 'offroad', 15),
(27, 'Blazer Custom', 'blazer3', 22500, 'motorcycles', 15),
(28, 'Blazer Sport', 'blazer4', 26000, 'offroad', 15),
(29, 'Blista', 'blista', 4250, 'compacts', 30),
(30, 'Blista Compact', 'blista2', 34600, 'sports', 30),
(31, 'BMX (velo)', 'bmx', 50, 'motorcycles', 0),
(32, 'Bobcat XL', 'bobcatxl', 23500, 'vans', 150),
(33, 'Bodhi', 'bodhi2', 22000, 'offroad', 20),
(34, 'Brawler', 'brawler', 54800, 'offroad', 150),
(35, 'Brioso R/A', 'brioso', 6500, 'compacts', 30),
(36, 'Brioso 300', 'brioso2', 6750, 'compacts', 30),
(37, 'Btype', 'btype', 55000, 'sportsclassics', 30),
(38, 'Btype Luxe', 'btype3', 60000, 'sportsclassics', 30),
(39, 'Buccaneer', 'buccaneer', 30000, 'muscle', 30),
(40, 'Buccaneer Rider', 'buccaneer2', 34500, 'muscle', 30),
(41, 'Buffalo', 'buffalo', 52000, 'sports', 30),
(42, 'Buffalo S', 'buffalo2', 68250, 'sports', 30),
(43, 'Buffalo STX', 'buffalo4', 82500, 'sports', 30),
(44, 'Bullet', 'bullet', 101500, 'super', 30),
(45, 'Burrito', 'burrito', 21500, 'vans', 150),
(46, 'Burrito 2', 'burrito3', 22500, 'vans', 150),
(47, 'Caddie', 'caddy', 5000, 'utility', 0),
(48, 'Calico GTF', 'calico', 47500, 'sports', 30),
(49, 'Camper', 'camper', 37500, 'vans', 150),
(50, 'Caracara 4x4', 'caracara2', 83450, 'offroad', 150),
(51, 'Carbonizzare', 'carbonizzare', 67000, 'sports', 30),
(52, 'Carbon RS', 'carbonrs', 67000, 'motorcycles', 15),
(53, 'Casco', 'casco', 34500, 'sportsclassics', 30),
(54, 'Cavalcade', 'cavalcade', 42500, 'suvs', 150),
(55, 'Cavalcade', 'cavalcade2', 54500, 'suvs', 150),
(56, 'Champion', 'champion', 349100, 'super', 30),
(57, 'Cheburek', 'cheburek', 26000, 'sportsclassics', 30),
(58, 'Cheetah', 'cheetah', 385000, 'super', 30),
(59, 'Cheetah classique', 'cheetah2', 84500, 'sportsclassics', 30),
(60, 'Chimera', 'chimera', 26850, 'motorcycles', 15),
(61, 'Chino', 'chino', 27500, 'muscle', 30),
(62, 'Chino Luxe', 'chino2', 31650, 'muscle', 30),
(63, 'Cinquemila', 'cinquemila', 43900, 'coupés', 30),
(64, 'Cliffhanger', 'cliffhanger', 62500, 'motorcycles', 15),
(65, 'Clique', 'clique', 48500, 'muscle', 30),
(66, 'Club', 'club', 3250, 'compacts', 30),
(67, 'Cognoscenti 55', 'cog55', 34950, 'sedans', 40),
(68, 'Cognoscenti Cabrio', 'cogcabrio', 43900, 'coupés', 30),
(69, 'Cognoscenti', 'cognoscenti', 36750, 'sedans', 40),
(70, 'Comet', 'comet2', 105000, 'sports', 30),
(71, 'Comet Retro Custom', 'comet3', 115000, 'sports', 30),
(72, 'Comet Safari', 'comet4', 110500, 'sports', 30),
(73, 'Comet 5', 'comet5', 149999, 'sports', 30),
(74, 'Comet S2', 'comet6', 139100, 'sports', 30),
(75, 'Comet S2 Cabrio', 'comet7', 549500, 'super', 30),
(76, 'Contender', 'contender', 75450, 'suvs', 150),
(77, 'Coquette', 'coquette', 94850, 'sports', 30),
(78, 'Coquette Classic', 'coquette2', 59000, 'sportsclassics', 30),
(79, 'Coquette BlackFin', 'coquette3', 56400, 'muscle', 30),
(80, 'Coquette D10', 'coquette4', 224600, 'sports', 30),
(81, 'Corsita', 'corsita', 234000, 'sports', 30),
(82, 'Cruiser (velo)', 'cruiser', 65, 'motorcycles', 0),
(83, 'Cyclone', 'cyclone', 295000, 'super', 30),
(84, 'cypher', 'cypher', 56450, 'sports', 30),
(85, 'Daemon', 'daemon', 49500, 'motorcycles', 15),
(86, 'Daemon High', 'daemon2', 51000, 'motorcycles', 15),
(87, 'Defiler', 'defiler', 54600, 'motorcycles', 15),
(88, 'Deity', 'deity', 46500, 'coupés', 30),
(89, 'Deveste', 'deveste', 412800, 'super', 30),
(90, 'Deviant', 'deviant', 42000, 'muscle', 30),
(91, 'Diabolus', 'diablous', 72500, 'super', 30),
(92, 'Diabolus custom', 'diablous2', 84500, 'motorcycles', 15),
(93, 'Dilettante', 'dilettante', 4950, 'compacts', 30),
(94, 'Dinghy', 'dinghy', 20000, 'boat', 150),
(95, 'Duneloader', 'dloader', 36500, 'offroad', 20),
(96, 'Dominator', 'dominator', 56750, 'muscle', 30),
(97, 'Dominator GTX', 'dominator3', 78500, 'muscle', 30),
(98, 'Dominator ASP', 'dominator7', 103500, 'muscle', 30),
(99, 'Dominator GTT', 'dominator8', 61450, 'muscle', 30),
(100, 'Double T', 'double', 74600, 'motorcycles', 15),
(101, '8F Drafter', 'drafter ', 61000, 'sports', 30),
(102, 'Draugur', 'draugur', 194650, 'offroad', 150),
(103, 'Dubsta', 'dubsta', 53450, 'suvs', 150),
(104, 'Dubsta Luxuary', 'dubsta2', 68500, 'suvs', 150),
(105, 'Bubsta 6x6', 'dubsta3', 61000, 'offroad', 150),
(106, 'Dune Buggy', 'dune', 49500, 'offroad', 20),
(107, 'Dynasty', 'dynasty', 38750, 'sportsclassics', 30),
(108, 'Elegy Retro Custom', 'elegy', 45650, 'sports', 30),
(109, 'Elegy', 'elegy2', 59450, 'sports', 30),
(110, 'Emerus', 'emerus', 315000, 'super', 30),
(111, 'Emperor', 'emperor', 22500, 'sedans', 40),
(112, 'Emperor2', 'emperor2', 14950, 'sedans', 40),
(113, 'Enduro', 'enduro', 32000, 'motorcycles', 15),
(114, 'Entity XXR', 'entity2', 345000, 'super', 30),
(115, 'Entity XF', 'entityxf', 325000, 'super', 30),
(116, 'Esskey', 'esskey', 42000, 'motorcycles', 15),
(117, 'Euros', 'euros', 60000, 'sports', 30),
(118, 'Exemplar', 'exemplar', 32800, 'coupes', 30),
(119, 'F620', 'f620', 30000, 'coupes', 30),
(120, 'Faction Rider', 'faction2', 43750, 'muscle', 30),
(121, 'Faction XL', 'faction3', 47950, 'muscle', 30),
(122, 'Fagaloa', 'fagaloa', 29150, 'sportsclassics', 30),
(123, 'Faggio', 'faggio', 1000, 'motorcycles', 15),
(124, 'Vespa', 'faggio2', 2000, 'motorcycles', 15),
(125, 'Faggio mod', 'faggio3', 1500, 'motorcycles', 15),
(126, 'FCR 1000', 'fcr', 37500, 'motorcycles', 15),
(127, 'FCR 1000 custom', 'fcr2', 43500, 'motorcycles', 15),
(128, 'Felon', 'felon', 28500, 'coupes', 30),
(129, 'Felon GT', 'felon2', 31500, 'coupes', 30),
(130, 'Feltzer', 'feltzer2', 49850, 'sports', 30),
(131, 'Stirling GT', 'feltzer3', 64000, 'sportsclassics', 30),
(132, 'Fixter (velo)', 'fixter', 70, 'motorcycles', 0),
(133, 'Flash GT', 'flashgt', 52500, 'sports', 30),
(134, 'FMJ', 'fmj', 274500, 'super', 30),
(135, 'Fhantom', 'fq2', 58450, 'suvs', 150),
(136, 'Freecrawler', 'freecrawler', 114500, 'offroad', 20),
(137, 'Fugitive', 'fugitive', 28500, 'sedans', 40),
(138, 'Furia', 'furia', 284250, 'super', 30),
(139, 'Furore GT', 'furoregt', 69950, 'sports', 30),
(140, 'Fusilade', 'fusilade', 64750, 'sports', 30),
(141, 'Futo', 'futo', 42350, 'sports', 30),
(142, 'Futo GTX', 'futo2', 44350, 'sports', 30),
(143, 'Gargoyle', 'gargoyle', 82500, 'motorcycles', 15),
(144, 'Gauntlet', 'gauntlet', 36750, 'muscle', 30),
(145, 'Gauntlet classique', 'gauntlet3', 34650, 'muscle', 30),
(146, 'Gauntlet hellfire', 'gauntlet4', 53450, 'muscle', 30),
(147, 'Gauntlet classique custom', 'gauntlet5', 47600, 'muscle', 30),
(148, 'GB200', 'gb200', 84650, 'sports', 30),
(149, 'Gang Burrito', 'gburrito', 28500, 'vans', 150),
(150, 'Gang Burrito 2', 'gburrito2', 32500, 'vans', 150),
(151, 'Glendale', 'glendale', 18450, 'sedans', 40),
(152, 'Glendale custom', 'glendale2', 26250, 'sedans', 40),
(153, 'GP1', 'gp1', 235000, 'super', 30),
(154, 'Granger', 'granger', 62350, 'suvs', 150),
(155, 'Granger 3600LX', 'granger2', 53750, 'suvs', 150),
(156, 'Greenwood', 'greenwood', 47500, 'muscle', 30),
(157, 'Gresley', 'gresley', 58500, 'suvs', 150),
(158, 'Growler', 'growler', 124600, 'sports', 30),
(159, 'GT 500', 'gt500', 56450, 'sportsclassics', 30),
(160, 'Guardian', 'guardian', 148000, 'offroad', 150),
(161, 'Habanero', 'habanero', 52850, 'suvs', 150),
(162, 'Hakuchou', 'hakuchou', 115800, 'motorcycles', 15),
(163, 'Hakuchou Sport', 'hakuchou2', 124600, 'motorcycles', 15),
(164, 'Hellion', 'hellion', 45000, 'offroad', 150),
(165, 'Hermes', 'hermes', 52850, 'muscle', 30),
(166, 'Hexer', 'hexer', 64800, 'motorcycles', 15),
(167, 'Hotknife', 'hotknife', 48250, 'muscle', 30),
(168, 'Hotring Sabre', 'hotring', 74650, 'sports', 30),
(169, 'Huntley S', 'huntley', 70250, 'suvs', 150),
(170, 'Hustler', 'hustler', 36750, 'muscle', 30),
(171, 'Ignus', 'ignus', 1250000, 'super', 30),
(172, 'Imorgon', 'imorgon', 199500, 'sports', 30),
(173, 'Impaler', 'impaler', 41500, 'muscle', 30),
(174, 'Infernus', 'infernus', 215000, 'super', 30),
(175, 'Infernus classique', 'infernus2', 64200, 'sportsclassics', 30),
(176, 'Ingot', 'ingot', 19450, 'sedans', 40),
(177, 'Innovation', 'innovation', 72800, 'motorcycles', 15),
(178, 'Intruder', 'intruder', 23000, 'sedans', 40),
(179, 'Issi', 'issi2', 5500, 'compacts', 30),
(180, 'Issi classique', 'issi3', 7450, 'compacts', 30),
(181, 'Issi Sport', 'issi7', 179450, 'sports', 30),
(182, 'Itali GTB', 'italigtb', 274600, 'super', 30),
(183, 'Itali GTB Custom', 'italigtb2', 282500, 'super', 30),
(184, 'Itali GTO', 'italigto', 324600, 'super', 30),
(185, 'Itali RSX', 'italirsx', 385000, 'super', 30),
(186, 'Jackal', 'jackal', 33500, 'coupes', 30),
(187, 'Jester', 'jester', 114850, 'sports', 30),
(188, 'Jester(Racecar)', 'jester2', 122500, 'sports', 30),
(189, 'Jester Classique', 'jester3', 129100, 'sports', 30),
(190, 'Jester RR', 'jester4', 134600, 'sports', 30),
(191, 'Jetmax', 'jetmax', 22500, 'boat', 50),
(192, 'Journey', 'journey', 33000, 'vans', 150),
(193, 'Jubilee', 'jubilee', 74500, 'suvs', 150),
(194, 'Jugular', 'jugular', 180000, 'sports', 30),
(195, 'Kalahari', 'kalahari', 42750, 'offroad', 20),
(196, 'Kamacho', 'kamacho', 85200, 'offroad', 150),
(197, 'Blista Kanjo', 'kanjo', 3500, 'compacts', 30),
(198, 'Kanjo SJ', 'kanjosj', 25350, 'sedans', 40),
(199, 'Khamelion', 'khamelion', 58450, 'sports', 30),
(200, 'Krieger', 'krieger', 450000, 'super', 30),
(201, 'Kuruma', 'kuruma', 43750, 'sports', 30),
(202, 'Landstalker', 'landstalker', 58500, 'suvs', 150),
(203, 'Landstalker XL', 'landstalker2', 63500, 'suvs', 150),
(204, 'RE-7B', 'le7b', 194850, 'super', 30),
(205, 'LM87', 'lm87', 849900, 'super', 30),
(206, 'Locust', 'locust', 119150, 'sports', 30),
(207, 'Longfin', 'longfin', 40000, 'boat', 150),
(208, 'Lynx', 'lynx', 73950, 'sports', 30),
(209, 'Mamba', 'mamba', 84950, 'sportsclassics', 30),
(210, 'Manana', 'manana', 26750, 'sportsclassics', 30),
(211, 'Manana custom', 'manana2', 36700, 'muscle', 30),
(212, 'Manchez', 'manchez', 68500, 'motorcycles', 15),
(213, 'Manchez Scout', 'manchez2', 73450, 'motorcycles', 15),
(214, 'Marquis', 'marquis', 12500, 'boat', 50),
(215, 'Massacro', 'massacro', 93450, 'sports', 30),
(216, 'Massacro(Racecar)', 'massacro2', 102800, 'sports', 30),
(217, 'Mesa', 'mesa', 65500, 'suvs', 150),
(218, 'Mesa Trail', 'mesa3', 39000, 'suvs', 150),
(219, 'Minivan', 'minivan', 11000, 'vans', 150),
(220, 'Minivan custom', 'minivan2', 12500, 'vans', 150),
(221, 'Monroe', 'monroe', 73950, 'sportsclassics', 30),
(222, 'Moonbeam', 'moonbeam', 24000, 'vans', 150),
(223, 'Moonbeam Custom', 'moonbeam2', 15000, 'vans', 150),
(224, 'Nebula turbo', 'nebula', 26750, 'sportsclassics', 30),
(225, 'Nemesis', 'nemesis', 48500, 'motorcycles', 15),
(226, 'Neo', 'neo', 204950, 'sports', 30),
(227, 'Neon', 'neon', 174950, 'sports', 30),
(228, 'Nero', 'nero', 684600, 'super', 30),
(229, 'Nero Custom', 'nero2', 749300, 'super', 30),
(230, 'Nightblade', 'nightblade', 82100, 'motorcycles', 15),
(231, 'Nightshade', 'nightshade', 43500, 'muscle', 30),
(232, '9F', 'ninef', 58950, 'sports', 30),
(233, '9F Cabrio', 'ninef2', 62450, 'sports', 30),
(234, 'Novak', 'novak', 72500, 'suvs', 150),
(235, 'Omnis', 'omnis', 74950, 'sports', 30),
(236, 'Omnis e-GT', 'omnisegt', 249100, 'super', 30),
(237, 'Oracle', 'oracle', 24850, 'coupes', 30),
(238, 'Oracle XS', 'oracle2', 29200, 'coupes', 30),
(239, 'Osiris', 'osiris', 215000, 'super', 30),
(240, 'Outlaw', 'outlaw', 29450, 'offroad', 20),
(241, 'Panto', 'panto', 4000, 'compacts', 30),
(242, 'Paradise', 'paradise', 3500, 'vans', 150),
(243, 'Paragon R', 'paragon', 164600, 'sports', 30),
(244, 'Pariah', 'pariah', 214900, 'sports', 30),
(245, 'Patriot', 'patriot', 64350, 'suvs', 150),
(246, 'Patriot Stretch', 'patriot2', 64450, 'suvs', 150),
(247, 'Patriot Mil-Spec', 'patriot3', 65950, 'suvs', 150),
(248, 'PCJ-600', 'pcj', 34650, 'motorcycles', 15),
(249, 'Penetrator', 'penetrator', 234950, 'super', 30),
(250, 'Penumbra', 'penumbra', 64450, 'sports', 30),
(251, 'Penumbra FF', 'penumbra2', 72500, 'sports', 30),
(252, 'Peyote Gasser', 'peyote', 24000, 'sportsclassics', 30),
(253, 'Peyote Gasser', 'peyote2', 46400, 'muscle', 30),
(254, 'Peyote custom', 'peyote3', 26000, 'sportsclassics', 30),
(255, 'Pfister', 'pfister811', 214650, 'super', 30),
(256, 'Phoenix', 'phoenix', 39700, 'muscle', 30),
(257, 'Picador', 'picador', 37500, 'muscle', 30),
(258, 'Pigalle', 'pigalle', 41000, 'sportsclassics', 30),
(259, 'Pony', 'pony', 4500, 'vans', 150),
(260, 'Pony Green', 'pony2', 5000, 'vans', 150),
(261, 'Postlude', 'postlude', 17650, 'sedans', 40),
(262, 'Prairie', 'prairie', 8750, 'compacts', 30),
(263, 'Premier', 'premier', 28500, 'sedans', 40),
(264, 'Previon', 'previon', 37500, 'sedans', 40),
(265, 'Primo', 'primo', 27450, 'sedans', 40),
(266, 'Primo Custom', 'primo2', 36750, 'sedans', 40),
(267, 'X80 Proto', 'prototipo', 414600, 'super', 30),
(268, 'Radius', 'radi', 68450, 'suvs', 150),
(269, 'raiden', 'raiden', 145500, 'sports', 30),
(270, 'Rancher XL', 'rancherxl', 23450, 'offroad', 20),
(271, 'Rapid GT', 'rapidgt', 84650, 'sports', 30),
(272, 'Rapid GT Convertible', 'rapidgt2', 82500, 'sports', 30),
(273, 'Rapid GT3', 'rapidgt3', 49500, 'sportsclassics', 30),
(274, 'Raptor', 'raptor', 42850, 'sports', 30),
(275, 'Rat bike', 'ratbike', 44500, 'motorcycles', 15),
(276, 'Rat-loader', 'ratloader', 18500, 'muscle', 30),
(277, 'Rat-truck', 'ratloader2', 26750, 'muscle', 30),
(278, 'Reaper', 'reaper', 230000, 'super', 30),
(279, 'Rebel rouillé', 'rebel', 16850, 'offroad', 150),
(280, 'Rebel', 'rebel2', 19200, 'offroad', 150),
(281, 'Rebla GTS', 'rebla', 72500, 'suvs', 150),
(282, 'Reever', 'reever', 62000, 'motorcycles', 15),
(283, 'Regina', 'regina', 28450, 'sedans', 40),
(284, 'Remus', 'remus', 36800, 'sports', 30),
(285, 'Retinue', 'retinue', 31600, 'sportsclassics', 30),
(286, 'Retinue MK 2', 'retinue2', 37450, 'sportsclassics', 30),
(287, 'Revolter', 'revolter', 245000, 'sports', 30),
(288, 'Rhapsody', 'rhapsody', 3250, 'compacts', 30),
(289, 'Ubermarcht Rhinehart ', 'rhinehart', 53450, 'coupés', 30),
(290, 'riata', 'riata', 34650, 'offroad', 150),
(291, 'Rocoto', 'rocoto', 70250, 'suvs', 150),
(292, 'RT3000', 'rt3000', 76950, 'sports', 30),
(293, 'Ruffian', 'ruffian', 38600, 'motorcycles', 15),
(294, 'Ruiner', 'ruiner', 31000, 'muscle', 30),
(295, 'Ruiner ZZ-8', 'ruiner4', 36400, 'muscle', 30),
(296, 'Rumpo', 'rumpo', 13000, 'vans', 150),
(297, 'Rumpo Trail', 'rumpo3', 20000, 'vans', 150),
(298, 'Ruston', 'ruston', 134600, 'sports', 30),
(299, 'Sabre Turbo', 'sabregt', 29500, 'muscle', 30),
(300, 'Sabre GT', 'sabregt2', 37450, 'muscle', 30),
(301, 'Sadler', 'sadler', 68200, 'suvs', 150),
(302, 'Sanchez', 'sanchez', 23450, 'motorcycles', 15),
(303, 'Sanchez Sport', 'sanchez2', 24850, 'motorcycles', 15),
(304, 'Sanctus', 'sanctus', 114650, 'motorcycles', 15),
(305, 'Sandking', 'sandking', 34500, 'offroad', 20),
(306, 'Sandking SWB', 'sandking2', 38250, 'offroad', 20),
(307, 'Savestra', 'savestra', 42800, 'sportsclassics', 30),
(308, 'SC 1', 'sc1', 274850, 'super', 30),
(309, 'Schafter', 'schafter2', 36750, 'sedans', 40),
(310, 'Schafter V12', 'schafter3', 65000, 'sports', 40),
(311, 'Schafter LWB', 'schafter4', 48500, 'sedans', 40),
(312, 'Schlagen', 'schlagen', 92500, 'sports', 30),
(313, 'Schwartzer', 'schwarzer', 51800, 'sports', 30),
(314, 'Scorcher (velo)', 'scorcher', 65, 'motorcycles', 0),
(315, 'Seashark', 'seashark', 21500, 'boat', 0),
(316, 'Seminole', 'seminole', 54600, 'suvs', 150),
(317, 'Seminole Frontier', 'seminole2', 55000, 'suvs', 150),
(318, 'Sentinel', 'sentinel', 22500, 'coupes', 30),
(319, 'Sentinel XS', 'sentinel2', 29500, 'coupes', 30),
(320, 'Sentinel3', 'sentinel3', 46800, 'sports', 30),
(321, 'Sentinel Classique Large', 'sentinel4', 57450, 'sports', 30),
(322, 'Serrano', 'serrano', 63700, 'suvs', 150),
(323, 'Seven 70', 'seven70', 39100, 'sports', 150),
(324, 'ETR1', 'sheava', 234900, 'super', 30),
(325, 'Shinobi', 'shinobi', 73500, 'motorcycles', 15),
(326, 'Slamvan', 'slamvan', 37500, 'muscle', 50),
(327, 'Slamvan lost', 'slamvan2', 29000, 'muscle', 50),
(328, 'Slam Van', 'slamvan3', 33700, 'muscle', 30),
(329, 'SM722', 'sm722', 78450, 'sports', 30),
(330, 'Sovereign', 'sovereign', 43500, 'motorcycles', 15),
(331, 'Specter', 'specter', 76500, 'sports', 30),
(332, 'Specter Custom', 'specter2', 78000, 'sports', 30),
(333, 'Speeder', 'speeder', 29000, 'boat', 50),
(334, 'Speedo', 'speedo', 17500, 'vans', 150),
(335, 'Speedo custom', 'speedo4', 17500, 'vans', 150),
(336, 'Squalo', 'squalo', 30000, 'boat', 50),
(337, 'Stafford', 'stafford', 38950, 'sedans', 40),
(338, 'Stallion', 'stalion', 35000, 'muscle', 30),
(339, 'Stanier', 'stanier', 32750, 'sedans', 40),
(340, 'Stinger', 'stinger', 38000, 'sportsclassics', 30),
(341, 'Stinger GT', 'stingergt', 40000, 'sportsclassics', 30),
(342, 'Stratum', 'stratum', 36450, 'sedans', 40),
(343, 'Streiter', 'streiter', 74500, 'suvs', 150),
(344, 'Stretch', 'stretch', 62500, 'sedans', 40),
(345, 'Stryder', 'stryder', 96450, 'motorcycles', 15),
(346, 'Sugoi', 'sugoi', 54600, 'sports', 30),
(347, 'Sultan', 'sultan', 45950, 'sports', 30),
(348, 'Sultan classique', 'sultan2', 59100, 'sports', 30),
(349, 'Sultan RS Classique', 'sultan3', 62800, 'sports', 30),
(350, 'Sultan RS', 'sultanrs', 134650, 'super', 30),
(351, 'Super Diamond', 'superd', 52450, 'sedans', 40),
(352, 'Surano', 'surano', 78450, 'sports', 30),
(353, 'Surfer', 'surfer', 4500, 'vans', 150),
(354, 'Surfer 2', 'surfer2', 3500, 'vans', 150),
(355, 'Surge', 'surge', 38000, 'sedans', 40),
(356, 'Swinger', 'swinger', 59450, 'sportsclassics', 30),
(357, 'T20', 't20', 324000, 'super', 30),
(358, 'Tailgater', 'tailgater', 50500, 'sedans', 40),
(359, 'Tailgater S', 'tailgater2', 52000, 'coupés', 30),
(360, 'Taipan', 'taipan', 250000, 'super', 30),
(361, 'Tampa', 'tampa', 29450, 'muscle', 30),
(362, 'Drift Tampa', 'tampa2', 75850, 'sports', 30),
(363, 'Tempesta', 'tempesta', 315450, 'super', 30),
(364, '10F', 'tenf', 434500, 'sports', 30),
(365, '10F Large', 'tenf2', 474650, 'sports', 30),
(366, 'Tezeract', 'tezeract', 374600, 'super', 30),
(367, 'Thrax', 'thrax', 815350, 'super', 30),
(368, 'Thrust', 'thrust', 63750, 'motorcycles', 15),
(369, 'Tigon', 'tigon', 224600, 'super', 30),
(370, 'Torero', 'torero', 79150, 'sportsclassics', 30),
(371, 'Torero XO', 'torero2', 264600, 'super', 30),
(372, 'Tornado rouillé', 'tornado3', 19100, 'sportsclassics', 30),
(373, 'Tornado custom', 'tornado5', 26850, 'sportsclassics', 30),
(374, 'Toro', 'toro', 23000, 'boat', 50),
(375, 'Toros', 'toros', 82850, 'suvs', 150),
(376, 'Whippet', 'tribike', 400, 'cycles', 0),
(377, 'Endurex', 'tribike2', 500, 'cycles', 0),
(378, 'Tri-Cycles', 'tribike3', 60, 'cycles', 0),
(379, 'Trophy Truck', 'trophytruck', 31650, 'offroad', 20),
(380, 'Trophy Truck Limited', 'trophytruck2', 34600, 'offroad', 20),
(381, 'Tropos', 'tropos', 72850, 'sports', 30),
(382, 'Tulip', 'tulip', 32800, 'muscle', 30),
(383, 'Turismo classique', 'turismo2', 71400, 'sportsclassics', 30),
(384, 'Turismo R', 'turismor', 320000, 'super', 30),
(385, 'Tyrus', 'tyrus', 264800, 'super', 30),
(386, 'Vacca', 'vacca', 224650, 'super', 30),
(387, 'Vader', 'vader', 38500, 'motorcycles', 15),
(388, 'Vagner', 'vagner', 300000, 'super', 30),
(389, 'Vagrant', 'vagrant', 55250, 'offroad', 20),
(390, 'Vamos', 'vamos', 26450, 'muscle', 30),
(391, 'Vectre', 'vectre', 61850, 'sports', 30),
(392, 'Verlierer', 'verlierer2', 84500, 'sports', 30),
(393, 'Vigero', 'vigero', 28900, 'muscle', 30),
(394, 'Vigero ZX', 'vigero2', 36400, 'muscle', 30),
(395, 'Virgo', 'virgo', 24000, 'muscle', 30),
(396, 'Virgo classique custom', 'virgo2', 25000, 'muscle', 30),
(397, 'Virgo classique', 'virgo3', 24500, 'muscle', 30),
(398, 'Viseris', 'viseris', 84950, 'sportsclassics', 30),
(399, 'Visione', 'visione', 294500, 'super', 30),
(400, 'Voltic', 'voltic', 210000, 'super', 30),
(401, 'Voodoo', 'voodoo', 27450, 'muscle', 30),
(402, 'Voodoo rouillé', 'voodoo2', 26500, 'muscle', 30),
(403, 'Vortex', 'vortex', 55200, 'motorcycles', 15),
(404, 'V-STR', 'vstr', 88000, 'sports', 30),
(405, 'Warrener', 'warrener', 32950, 'sedans', 40),
(406, 'Warrener HKR', 'warrener2', 38500, 'coupés', 30),
(407, 'Washington', 'washington', 42850, 'sedans', 40),
(408, 'Weevil', 'weevil', 8500, 'compacts', 30),
(409, 'Weevil Custom', 'weevil2', 47350, 'muscle', 30),
(410, 'Windsor', 'windsor', 43500, 'coupes', 30),
(411, 'Windsor Drop', 'windsor2', 46750, 'coupes', 30),
(412, 'Woflsbane', 'wolfsbane', 69000, 'motorcycles', 15),
(413, 'Xa 21', 'xa21', 400000, 'super', 30),
(414, 'XLS', 'xls', 65000, 'suvs', 150),
(415, 'Yosemite', 'yosemite', 27000, 'muscle', 50),
(416, 'Yosemite drift', 'yosemite2', 34000, 'muscle', 50),
(417, 'Yosemite Rancher', 'yosemite3', 26850, 'offroad', 150),
(418, 'Youga', 'youga', 16500, 'vans', 150),
(419, 'Youga Luxuary', 'youga2', 7500, 'vans', 150),
(420, 'Youga classique 4x4', 'youga3', 12500, 'vans', 150),
(421, 'Z190', 'z190', 36500, 'sportsclassics', 30),
(422, 'Zeno', 'zeno', 424600, 'super', 30),
(423, 'Zentorno', 'zentorno', 635000, 'super', 30),
(424, 'Zion', 'zion', 41850, 'coupes', 30),
(425, 'Zion Cabrio', 'zion2', 43500, 'coupes', 30),
(426, 'Zion classique', 'zion3', 48500, 'sportsclassics', 30),
(427, 'Zombie', 'zombiea', 46350, 'motorcycles', 15),
(428, 'Zombie Luxuary', 'zombieb', 48500, 'motorcycles', 15),
(429, 'Zorusso', 'zorrusso', 465000, 'super', 30),
(430, 'ZR350', 'zr350', 69450, 'sports', 30),
(431, 'Z-Type', 'ztype', 76000, 'sportsclassics', 30),
(432, 'Injection', 'bfinjection', 18450, 'cayo', 20),
(433, 'Bifta', 'bifta', 58500, 'cayo', 20),
(434, 'Bodhi', 'bodhi2', 22000, 'cayo', 20),
(435, 'Brawler', 'brawler', 54800, 'cayo', 150),
(436, 'Caracara 4x4', 'caracara2', 83450, 'cayo', 150),
(438, 'Duneloader', 'dloader', 36500, 'cayo', 20),
(439, 'Dubsta 6x6', 'dubsta3', 61000, 'cayo', 150),
(440, 'Dune Buggy', 'dune', 49500, 'cayo', 150),
(441, 'Draugur', 'draugur', 194650, 'cayo', 150),
(442, 'Everon', 'everon', 75000, 'cayo', 150),
(443, 'Freecrawler', 'freecrawler', 114500, 'cayo', 150),
(444, 'Hellion', 'hellion', 45000, 'cayo', 150),
(445, 'Kalahari', 'kalahari', 42750, 'cayo', 150),
(446, 'Kamacho', 'kamacho', 85200, 'cayo', 150),
(447, 'Mesa Trail', 'mesa3', 39000, 'cayo', 150),
(448, 'Outlaw', 'outlaw', 29450, 'cayo', 150),
(449, 'Rancher XL', 'rancherxl', 23450, 'cayo', 150),
(450, 'Rebel rouillé', 'rebel', 16850, 'cayo', 150),
(451, 'Rebel', 'rebel2', 19200, 'cayo', 150),
(452, 'Riata', 'riata', 34650, 'cayo', 150),
(453, 'Sandking', 'sandking', 34500, 'cayo', 150),
(454, 'Sandking SWB', 'sandking2', 38250, 'cayo', 150),
(455, 'Trophy truck', 'trophytruck', 31650, 'cayo', 150),
(456, 'Trophy Truck Limited', 'trophytruck2', 34600, 'cayo', 150),
(457, 'Vagrant', 'vagrant', 55250, 'cayo', 150),
(458, 'Yosemite Rancher', 'yosemite3', 26850, 'cayo', 150),
(459, 'Squaddie', 'squaddie', 58000, 'cayo', 150),
(460, 'Cavalcade', 'cavalcade', 42500, 'cayo', 150),
(461, 'Cavalcade 2', 'cavalcade2', 54500, 'cayo', 150),
(462, 'Landstalker XL', 'landstalker2', 63500, 'cayo', 150),
(463, 'Mesa', 'mesa', 65500, 'cayo', 150),
(464, 'Seminole', 'seminole', 54600, 'cayo', 150),
(465, 'Baller', 'baller', 48950, 'cayo', 150),
(466, 'Contender', 'contender', 75450, 'cayo', 150),
(467, 'Blazer', 'blazer', 16500, 'cayo', 150),
(468, 'Blazer Custom', 'blazer3', 22500, 'cayo', 15),
(469, 'Blazer Street', 'blazer4', 26000, 'cayo', 15),
(470, 'Cliffhanger', 'cliffhanger', 62500, 'cayo', 15),
(471, 'Enduro', 'enduro', 32000, 'cayo', 15),
(472, 'Esskey', 'esskey', 42000, 'cayo', 15),
(473, 'Sanchez', 'sanchez', 23450, 'cayo', 15),
(474, 'Sanchez 2', 'sanchez2', 24850, 'cayo', 15),
(475, 'BF400', 'bf400', 42500, 'cayo', 15),
(476, 'Gargoyle', 'gargoyle', 82500, 'cayo', 15),
(477, 'Manchez', 'manchez', 68500, 'cayo', 15),
(478, 'Manchez Scout', 'manchez2', 73450, 'cayo', 15),
(479, 'Guardian', 'guardian', 148000, 'cayo', 150),
(480, 'Sadler', 'sadler', 68200, 'cayo', 150),
(481, 'Bobcat XL', 'bobcatxl', 23500, 'cayo', 150),
(482, 'Youga classique 4x4', 'youga3', 12500, 'cayo', 150),
(483, 'Rumpo custom', 'rumpo3', 20000, 'cayo', 150),
(484, 'Winky', 'winky', 17850, 'cayo', 20),
(485, 'Buffalo H', 'buffaloh', 98350, 'sports', 30);

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_categories`
--

CREATE TABLE `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicle_categories`
--

INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
('boat', 'Bateau'),
('cayo', 'Cayo'),
('compacts', 'Compacts'),
('coupes', 'Coupés'),
('moddees', 'Moddées'),
('motorcycles', 'Motos'),
('muscle', 'Muscle'),
('offroad', 'Off Road'),
('sedans', 'Sedans'),
('sports', 'Sports'),
('sportsclassics', 'SportClassics'),
('super', 'Super'),
('suvs', 'SUVs'),
('vans', 'Vans');

-- --------------------------------------------------------

--
-- Structure de la table `vehicle_sold`
--

CREATE TABLE `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule_entreprise`
--

CREATE TABLE `vehicule_entreprise` (
  `id` int(11) NOT NULL,
  `job` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(30) NOT NULL,
  `number` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `plate` varchar(11) NOT NULL,
  `custom` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vehicule_entreprise`
--

INSERT INTO `vehicule_entreprise` (`id`, `job`, `name`, `label`, `number`, `grade`, `plate`, `custom`, `price`, `type`) VALUES
(211, 'police', 'pmaverick', 'Test', 1, 19, '06RFI805', '{\"modBrakes\":-1,\"modFrame\":-1,\"neonColor\":[255,0,255],\"modVanityPlate\":-1,\"modSteeringWheel\":-1,\"modRightFender\":-1,\"model\":1496743164,\"modAirFilter\":-1,\"modTrunk\":-1,\"color1\":134,\"modWindows\":-1,\"extras\":{\"10\":true,\"7\":true,\"1\":true,\"2\":true,\"12\":true,\"11\":true},\"engineHealth\":1000.0,\"modAerials\":-1,\"bodyHealth\":1000.0,\"wheelColor\":156,\"modShifterLeavers\":-1,\"modEngine\":-1,\"modDashboard\":-1,\"tankHealth\":1000.0,\"xenonColor\":255,\"modOrnaments\":-1,\"modTrimA\":-1,\"modTrimB\":-1,\"modTank\":-1,\"modBackWheels\":-1,\"modSpoilers\":-1,\"plate\":\"06RFI805\",\"modSmokeEnabled\":false,\"modPlateHolder\":-1,\"tyreSmokeColor\":[255,255,255],\"modFrontWheels\":-1,\"modExhaust\":-1,\"modFender\":-1,\"modSpeakers\":-1,\"modSeats\":-1,\"modSideSkirt\":-1,\"modLivery\":0,\"modArchCover\":-1,\"pearlescentColor\":0,\"modDoorSpeaker\":-1,\"color2\":134,\"modAPlate\":-1,\"modRoof\":-1,\"modArmor\":-1,\"modSuspension\":-1,\"modTurbo\":false,\"modDial\":-1,\"modGrille\":-1,\"wheels\":0,\"modHydrolic\":-1,\"modXenon\":false,\"neonEnabled\":[false,false,false,false],\"modRearBumper\":-1,\"modTransmission\":-1,\"modHorns\":-1,\"modHood\":-1,\"modEngineBlock\":-1,\"dirtLevel\":0.0,\"modStruts\":-1,\"windowTint\":-1,\"modFrontBumper\":-1,\"fuelLevel\":36.5,\"plateIndex\":4}', 10000, 'Heli');

-- --------------------------------------------------------

--
-- Structure de la table `venteoccasion`
--

CREATE TABLE `venteoccasion` (
  `id` int(11) NOT NULL,
  `identifier` text NOT NULL,
  `time` int(11) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `model` int(25) NOT NULL,
  `label` varchar(50) NOT NULL,
  `vehicleCustom` longtext NOT NULL,
  `pointParking` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `vente_darme`
--

CREATE TABLE `vente_darme` (
  `id` int(11) NOT NULL,
  `shop` varchar(25) NOT NULL,
  `identifier` varchar(80) NOT NULL,
  `expiration` bigint(20) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vente_darme`
--

INSERT INTO `vente_darme` (`id`, `shop`, `identifier`, `expiration`, `number`) VALUES
(45, 'Gangster', '817aa0958f90b4388610e105f880a2b9f70d5c9d', 1684497788, 3),
(46, 'Bandit', '817aa0958f90b4388610e105f880a2b9f70d5c9d', 1684497909, 3),
(48, 'Sicario', '817aa0958f90b4388610e105f880a2b9f70d5c9d', 1684498301, 3);

-- --------------------------------------------------------

--
-- Structure de la table `vestiaire`
--

CREATE TABLE `vestiaire` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `job` varchar(50) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `tenue` longtext NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `vestiaire`
--

INSERT INTO `vestiaire` (`id`, `identifier`, `job`, `nom`, `tenue`, `grade`) VALUES
(54, 'a023603b196b40b4a683b77429127786974fefc1', 'police', 'Recrut', '{\"watches_2\":-1,\"watches_1\":-1,\"torso_2\":0,\"tshirt_1\":0,\"chain_1\":0,\"ears_1\":-1,\"glasses_1\":-1,\"helmet_1\":-1,\"shoes_2\":0,\"shoes_1\":0,\"arms\":0,\"torso_1\":0,\"pants_1\":0,\"tshirt_2\":0,\"glasses_2\":-1,\"pants_2\":0,\"chain_2\":0,\"helmet_2\":-1,\"ears_2\":-1}', 0);

-- --------------------------------------------------------

--
-- Structure de la table `warn`
--

CREATE TABLE `warn` (
  `id` int(11) NOT NULL,
  `identifier` varchar(50) NOT NULL,
  `steam` varchar(50) DEFAULT NULL,
  `liveid` varchar(50) DEFAULT NULL,
  `xblid` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `nameplayer` varchar(50) NOT NULL,
  `nameadmin` varchar(50) NOT NULL,
  `reason` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `warn`
--

INSERT INTO `warn` (`id`, `identifier`, `steam`, `liveid`, `xblid`, `ip`, `discord`, `nameplayer`, `nameadmin`, `reason`) VALUES
(5, '29a9462e64ddfed46096292b656966175087ffd9', NULL, 'live:985154360305076', 'xbl:2535448780914909', 'ip:89.91.136.112', 'discord:325008274497732609', 'Fif Fif', 'Tipi Mathieu', 'Tes bo'),
(6, 'd84442731b732e8a5f0502a4a9e54caa798d1037', NULL, 'live:1055518507109773', 'xbl:2535445998339876', 'ip:176.172.195.6', 'discord:305298311693205504', 'Barksdale Bodie', 'Tipi Mathieu', 'Coucoucoouc'),
(7, 'd84442731b732e8a5f0502a4a9e54caa798d1037', NULL, 'live:1055518507109773', 'xbl:2535445998339876', 'ip:176.172.195.6', 'discord:305298311693205504', 'Barksdale Bodie', 'Tipi Mathieu', 'mamaam'),
(8, 'd84442731b732e8a5f0502a4a9e54caa798d1037', NULL, 'live:1055518507109773', 'xbl:2535445998339876', 'ip:176.172.195.6', 'discord:305298311693205504', 'Barksdale Bodie', 'Tipi Mathieu', 'mdmmd');

-- --------------------------------------------------------

--
-- Structure de la table `weapon_society`
--

CREATE TABLE `weapon_society` (
  `id` int(11) NOT NULL,
  `job` varchar(25) NOT NULL,
  `label` varchar(25) NOT NULL,
  `name` varchar(25) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `zk_clothe`
--

CREATE TABLE `zk_clothe` (
  `id` int(11) NOT NULL,
  `type` varchar(60) NOT NULL,
  `identifier` varchar(100) DEFAULT NULL,
  `nom` longtext DEFAULT NULL,
  `clothe` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `zk_clothe`
--

INSERT INTO `zk_clothe` (`id`, `type`, `identifier`, `nom`, `clothe`) VALUES
(474, 'clotheswatches_1', 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'Montre n°11', '{\"watches_1\":11,\"watches_2\":0}'),
(476, 'clotheswatches_1', 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'Montre n°6', '{\"watches_1\":6,\"watches_2\":0}'),
(477, 'clotheswatches_1', 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'Montre n°6', '{\"watches_1\":6,\"watches_2\":0}'),
(480, 'clothestshirt_1', '6c6d0d4e656ec565b227a1ec23ae4bd19c297a38', 'T-Shirt n°1', '{\"tshirt_1\":1,\"tshirt_2\":0}'),
(481, 'clothestorso_1', '6c6d0d4e656ec565b227a1ec23ae4bd19c297a38', 'Torse n°3', '{\"torso_1\":3,\"torso_2\":0}'),
(482, 'clothespants_1', '6c6d0d4e656ec565b227a1ec23ae4bd19c297a38', 'Jambes n°4', '{\"pants_2\":0,\"pants_1\":4}'),
(483, 'clothesarms', '6c6d0d4e656ec565b227a1ec23ae4bd19c297a38', 'Bras n°15', '{\"arms\":0}'),
(484, 'clothesarms', '6c6d0d4e656ec565b227a1ec23ae4bd19c297a38', 'Bras n°29', '{\"arms\":0}'),
(497, 'clothestenue', '241a8e5bf0c1c0095ccf914f0d039e7feb93ba21', 'Tenue N°3326', '{\"watches_2\":0,\"bproof_2\":0,\"age_2\":0,\"neck_thickness\":0,\"chest_3\":0,\"glasses_1\":5,\"bracelets_2\":0,\"makeup_1\":0,\"hair_color_2\":0,\"hair_1\":71,\"nose_2\":0,\"hair_2\":0,\"watches_1\":34,\"ears_2\":0,\"chest_2\":0,\"eye_open\":0.0,\"eyebrows_2\":10,\"cheeks_1\":0,\"moles_2\":0,\"chin_width\":0.0,\"torso_2\":1,\"helmet_1\":-1,\"lip_thickness\":0,\"eyebrows_3\":0,\"moles_1\":0,\"eye_squint\":0,\"blush_3\":\"2\",\"jaw_1\":0,\"lips_thick\":0.0,\"arms\":0,\"blush_1\":0,\"blemishes_2\":0,\"shoes_2\":1,\"chin_1\":0,\"complexion_2\":0,\"blush_2\":0,\"beard_3\":61,\"mask_2\":0,\"glasses_2\":0,\"nose_5\":0,\"chin_3\":0,\"bags_1\":0,\"tshirt_2\":2,\"sun_2\":0,\"nose_6\":0,\"complexion_1\":0,\"bproof_1\":0,\"jaw_2\":0,\"bags_2\":0,\"cheeks_2\":0,\"chin_hole\":0.0,\"bodyb_2\":0,\"face_md_weight\":50,\"decals_1\":0,\"face\":0,\"tshirt_1\":28,\"lipstick_1\":0,\"lipstick_4\":0,\"bracelets_1\":-1,\"sex\":0,\"chest_1\":0,\"hair_color_1\":0,\"decals_2\":0,\"beard_4\":0,\"sun_1\":0,\"eyebrows_1\":0,\"eyebrows_4\":0,\"ears_1\":8,\"makeup_3\":0,\"age_1\":0,\"pants_2\":1,\"mom\":23,\"skin\":0,\"torso_1\":60,\"neck_thick\":0.0,\"blemishes_1\":0,\"chin_lenght\":0.0,\"pants_1\":35,\"lipstick_3\":32,\"makeup_4\":0,\"beard_2\":10,\"bodyb_1\":0,\"eyebrows_5\":0,\"nose_4\":0,\"helmet_2\":-1,\"eyebrows_6\":0,\"mask_1\":0,\"chin_height\":0.0,\"chin_4\":0,\"dad\":2,\"nose_3\":0,\"chin_2\":0,\"nose_1\":0,\"arms_2\":0,\"beard_1\":3,\"shoes_1\":28,\"chain_1\":60,\"cheeks_3\":0,\"lipstick_2\":0,\"skin_md_weight\":50,\"eye_color\":0,\"makeup_2\":0,\"chain_2\":0}'),
(498, 'clothestshirt_1', '29a9462e64ddfed46096292b656966175087ffd9', 'T-Shirt n°15', '{\"tshirt_1\":15,\"tshirt_2\":0}'),
(499, 'clotheshelmet_1', '241a8e5bf0c1c0095ccf914f0d039e7feb93ba21', 'Casque n°41', '{\"helmet_2\":1,\"helmet_1\":41}'),
(500, 'clothestorso_1', '241a8e5bf0c1c0095ccf914f0d039e7feb93ba21', 'Torse n°26', '{\"torso_2\":0,\"torso_1\":26}'),
(501, 'clothesarms', '241a8e5bf0c1c0095ccf914f0d039e7feb93ba21', 'Bras n°5', '{\"arms\":0}'),
(502, 'clothesarms', '241a8e5bf0c1c0095ccf914f0d039e7feb93ba21', 'Bras n°5', '{\"arms\":0}'),
(503, 'clothesmask_1', '241a8e5bf0c1c0095ccf914f0d039e7feb93ba21', 'Masque n°12', '{\"mask_2\":1,\"mask_1\":12}'),
(504, 'clotheswatches_1', 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'Montre n°2', '{\"watches_2\":0,\"watches_1\":2}'),
(508, 'clothesarms', 'f030939c0e9e6a6f851e1e30ca8c69b1f76bd349', 'Bras n°4', '{\"arms\":0}'),
(509, 'clothestshirt_1', 'f030939c0e9e6a6f851e1e30ca8c69b1f76bd349', 'T-Shirt n°15', '{\"tshirt_2\":0,\"tshirt_1\":15}'),
(513, 'clothesarms', '29a9462e64ddfed46096292b656966175087ffd9', 'Bras n°15', '{\"arms\":0}'),
(515, 'clothestorso_1', 'f030939c0e9e6a6f851e1e30ca8c69b1f76bd349', 'Torse n°204', '{\"torso_1\":204,\"torso_2\":2}'),
(516, 'clothestorso_1', 'f030939c0e9e6a6f851e1e30ca8c69b1f76bd349', 'Torse n°204', '{\"torso_1\":204,\"torso_2\":2}'),
(517, 'clothestshirt_1', '8f6ab849d5f5e321e763b5afddaa20c319111a7f', 'T-Shirt n°15', '{\"tshirt_2\":0,\"tshirt_1\":15}'),
(518, 'clothestorso_1', '8f6ab849d5f5e321e763b5afddaa20c319111a7f', 'Torse n°185', '{\"torso_1\":185,\"torso_2\":0}'),
(519, 'clothestorso_1', '8f6ab849d5f5e321e763b5afddaa20c319111a7f', 'Torse n°19', '{\"torso_1\":19,\"torso_2\":0}'),
(520, 'clothestorso_1', '8f6ab849d5f5e321e763b5afddaa20c319111a7f', 'Torse n°98', '{\"torso_1\":98,\"torso_2\":0}'),
(521, 'clothespants_1', '8f6ab849d5f5e321e763b5afddaa20c319111a7f', 'Jambes n°28', '{\"pants_2\":3,\"pants_1\":28}'),
(522, 'clothesshoes_1', '8f6ab849d5f5e321e763b5afddaa20c319111a7f', 'Chaussures n°19', '{\"shoes_1\":19,\"shoes_2\":1}'),
(523, 'clothestshirt_1', '47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 'T-Shirt n°15', '{\"tshirt_1\":15,\"tshirt_2\":0}'),
(524, 'clothesdecals_1', '47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 'Calques n°1', '{\"decals_2\":0,\"decals_1\":1}'),
(525, 'clothestorso_1', '47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 'Torse n°106', '{\"torso_2\":8,\"torso_1\":106}'),
(526, 'clothespants_1', '47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 'Jambes n°42', '{\"pants_2\":0,\"pants_1\":42}'),
(527, 'clothespants_1', '47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 'Jambes n°48', '{\"pants_2\":7,\"pants_1\":48}'),
(528, 'clothesshoes_1', '47f4b8176dff09360d433f8bfca8f1e3d1af3adb', 'Chaussures n°20', '{\"shoes_1\":20,\"shoes_2\":0}'),
(529, 'clothestorso_1', 'f1a8560cd57df1afe50222ff6f15997fbc7b2874', 'Torse n°113', '{\"torso_2\":0,\"torso_1\":113}'),
(530, 'clothestshirt_1', 'f1a8560cd57df1afe50222ff6f15997fbc7b2874', 'T-Shirt n°154', '{\"tshirt_1\":154,\"tshirt_2\":0}'),
(531, 'clothespants_1', 'f1a8560cd57df1afe50222ff6f15997fbc7b2874', 'Jambes n°67', '{\"pants_2\":0,\"pants_1\":67}'),
(532, 'clothesshoes_1', 'f1a8560cd57df1afe50222ff6f15997fbc7b2874', 'Chaussures n°39', '{\"shoes_1\":39,\"shoes_2\":0}'),
(533, 'clotheschain_1', 'f1a8560cd57df1afe50222ff6f15997fbc7b2874', 'Chaine n°49', '{\"chain_2\":0,\"chain_1\":49}'),
(534, 'clothestshirt_1', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'T-Shirt n°15', '{\"tshirt_2\":0,\"tshirt_1\":15}'),
(539, 'clothestorso_1', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Torse n°64', '{\"torso_1\":64,\"torso_2\":0}'),
(542, 'clothespants_1', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Jambes n°29', '{\"pants_2\":0,\"pants_1\":29}'),
(543, 'clothesarms', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Bras n°5', '{\"arms\":0}'),
(544, 'clothesshoes_1', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Chaussures n°34', '{\"shoes_2\":1,\"shoes_1\":34}'),
(545, 'clotheschain_1', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Chaine n°70', '{\"chain_1\":70,\"chain_2\":0}'),
(546, 'clothestenue', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Tenue N°2641', '{\"eyebrows_6\":0,\"hair_color_1\":0,\"face\":0,\"hair_2\":0,\"nose_5\":0,\"pants_1\":29,\"helmet_2\":-1,\"chin_height\":0.0,\"bproof_2\":0,\"makeup_3\":0,\"mask_1\":0,\"nose_6\":0,\"arms_2\":0,\"age_2\":0,\"ears_1\":-1,\"chin_lenght\":0.0,\"chest_3\":0,\"chin_2\":0,\"lipstick_4\":0,\"face_md_weight\":50,\"sun_2\":0,\"bodyb_1\":0,\"skin_md_weight\":50,\"hair_color_2\":0,\"beard_1\":18,\"lipstick_3\":32,\"bags_2\":0,\"eyebrows_4\":0,\"makeup_4\":0,\"beard_3\":61,\"pants_2\":0,\"chin_hole\":0.0,\"makeup_2\":0,\"eyebrows_3\":0,\"chin_width\":0.0,\"jaw_2\":0,\"sex\":0,\"hair_1\":14,\"mask_2\":0,\"dad\":2,\"moles_1\":0,\"arms\":5,\"skin\":0,\"eye_open\":0.0,\"sun_1\":0,\"chin_3\":0,\"bodyb_2\":0,\"complexion_1\":0,\"shoes_2\":1,\"decals_1\":0,\"neck_thickness\":0,\"complexion_2\":0,\"eye_color\":0,\"helmet_1\":-1,\"nose_1\":0,\"watches_2\":-1,\"shoes_1\":34,\"bproof_1\":0,\"lipstick_1\":0,\"torso_1\":64,\"beard_4\":0,\"lip_thickness\":0,\"eyebrows_2\":10,\"lips_thick\":0.0,\"bags_1\":0,\"lipstick_2\":0,\"glasses_1\":-1,\"decals_2\":0,\"blush_2\":0,\"blush_1\":0,\"chin_1\":0,\"eyebrows_1\":0,\"mom\":23,\"tshirt_2\":0,\"nose_2\":0,\"blemishes_2\":0,\"blemishes_1\":0,\"chain_1\":70,\"chest_2\":0,\"chin_4\":0,\"neck_thick\":0.0,\"age_1\":0,\"nose_4\":0,\"bracelets_2\":0,\"watches_1\":-1,\"chain_2\":0,\"tshirt_1\":15,\"torso_2\":0,\"jaw_1\":0,\"cheeks_2\":0,\"glasses_2\":-1,\"moles_2\":0,\"eye_squint\":0,\"nose_3\":0,\"blush_3\":\"2\",\"makeup_1\":0,\"bracelets_1\":-1,\"cheeks_3\":0,\"cheeks_1\":0,\"chest_1\":0,\"eyebrows_5\":0,\"beard_2\":10,\"ears_2\":-1}'),
(547, 'clothestshirt_1', 'a023603b196b40b4a683b77429127786974fefc1', 'T-Shirt n°2', '{\"tshirt_1\":2,\"tshirt_2\":0}'),
(548, 'clothestshirt_1', 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'T-Shirt n°1', '{\"tshirt_1\":1,\"tshirt_2\":0}'),
(549, 'clothestshirt_1', 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'T-Shirt n°8', '{\"tshirt_1\":8,\"tshirt_2\":0}'),
(550, 'clothestshirt_1', 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'T-Shirt n°8', '{\"tshirt_1\":8,\"tshirt_2\":0}'),
(551, 'clothestshirt_1', 'd84442731b732e8a5f0502a4a9e54caa798d1037', 'T-Shirt n°6', '{\"tshirt_1\":6,\"tshirt_2\":0}'),
(552, 'clothestorso_1', 'a023603b196b40b4a683b77429127786974fefc1', 'Torse n°6', '{\"torso_1\":6,\"torso_2\":0}'),
(553, 'clothestshirt_1', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'T-Shirt n°15', '{\"tshirt_1\":15,\"tshirt_2\":0}'),
(554, 'clothesarms', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Bras n°1', '{\"arms\":0}'),
(555, 'clothestorso_1', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Torse n°151', '{\"torso_2\":0,\"torso_1\":151}'),
(556, 'clothespants_1', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Jambes n°60', '{\"pants_1\":60,\"pants_2\":0}'),
(557, 'clothesshoes_1', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Chaussures n°52', '{\"shoes_2\":0,\"shoes_1\":52}'),
(558, 'clothestenue', '64d9c0c44bbe26e7da4db79f901e420a76ba6a73', 'Tenue N°9097', '{\"beard_4\":0,\"arms\":1,\"complexion_2\":0,\"chest_3\":0,\"cheeks_1\":0,\"bracelets_2\":0,\"lipstick_4\":0,\"chin_4\":0,\"eyebrows_2\":10,\"decals_1\":0,\"beard_2\":10,\"hair_1\":14,\"glasses_2\":-1,\"lips_thick\":0.0,\"face\":0,\"complexion_1\":0,\"sex\":0,\"bproof_1\":0,\"cheeks_3\":0,\"eyebrows_3\":0,\"watches_1\":-1,\"bodyb_1\":0,\"skin\":0,\"jaw_2\":0,\"shoes_1\":52,\"age_1\":0,\"lipstick_1\":0,\"shoes_2\":0,\"face_md_weight\":50,\"eyebrows_4\":0,\"chest_2\":0,\"hair_color_1\":0,\"nose_2\":0,\"helmet_1\":-1,\"mask_1\":0,\"arms_2\":0,\"makeup_2\":0,\"chain_2\":0,\"chin_height\":0.0,\"nose_1\":0,\"makeup_4\":0,\"tshirt_1\":15,\"eye_open\":0.0,\"chin_1\":0,\"sun_2\":0,\"eyebrows_5\":0,\"bracelets_1\":-1,\"blush_1\":0,\"hair_color_2\":0,\"beard_3\":61,\"torso_2\":0,\"makeup_3\":0,\"ears_1\":-1,\"tshirt_2\":0,\"nose_5\":0,\"blush_3\":\"2\",\"chin_width\":0.0,\"glasses_1\":-1,\"chest_1\":0,\"chin_3\":0,\"torso_1\":151,\"neck_thick\":0.0,\"mom\":23,\"age_2\":0,\"ears_2\":-1,\"blemishes_1\":0,\"lipstick_2\":0,\"eye_squint\":0,\"chin_hole\":0.0,\"pants_2\":0,\"lipstick_3\":32,\"moles_2\":0,\"chin_2\":0,\"lip_thickness\":0,\"bags_1\":0,\"nose_3\":0,\"bproof_2\":0,\"blemishes_2\":0,\"chain_1\":70,\"beard_1\":18,\"nose_4\":0,\"eyebrows_6\":0,\"cheeks_2\":0,\"jaw_1\":0,\"eyebrows_1\":0,\"chin_lenght\":0.0,\"nose_6\":0,\"neck_thickness\":0,\"makeup_1\":0,\"blush_2\":0,\"dad\":2,\"decals_2\":0,\"bodyb_2\":0,\"helmet_2\":-1,\"bags_2\":0,\"mask_2\":0,\"skin_md_weight\":50,\"pants_1\":60,\"eye_color\":0,\"watches_2\":-1,\"moles_1\":0,\"sun_1\":0,\"hair_2\":0}');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `addon_account`
--
ALTER TABLE `addon_account`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  ADD KEY `index_addon_account_data_account_name` (`account_name`);

--
-- Index pour la table `addon_inventory`
--
ALTER TABLE `addon_inventory`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`),
  ADD KEY `index_addon_inventory_inventory_name` (`inventory_name`);

--
-- Index pour la table `banking`
--
ALTER TABLE `banking`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `banlist`
--
ALTER TABLE `banlist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `bansql`
--
ALTER TABLE `bansql`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `billing_entreprise`
--
ALTER TABLE `billing_entreprise`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `blanchiment`
--
ALTER TABLE `blanchiment`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `blanchiment_entreprise`
--
ALTER TABLE `blanchiment_entreprise`
  ADD PRIMARY KEY (`society`);

--
-- Index pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chestobject`
--
ALTER TABLE `chestobject`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `chestweapon`
--
ALTER TABLE `chestweapon`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coffrebuilder`
--
ALTER TABLE `coffrebuilder`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coffregang`
--
ALTER TABLE `coffregang`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coffrehouse`
--
ALTER TABLE `coffrehouse`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `datastore`
--
ALTER TABLE `datastore`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  ADD KEY `index_datastore_data_name` (`name`);

--
-- Index pour la table `fill_type`
--
ALTER TABLE `fill_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `garage`
--
ALTER TABLE `garage`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gav`
--
ALTER TABLE `gav`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gestionadmin`
--
ALTER TABLE `gestionadmin`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gofast`
--
ALTER TABLE `gofast`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `historyboss`
--
ALTER TABLE `historyboss`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `houseimmo`
--
ALTER TABLE `houseimmo`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `jail`
--
ALTER TABLE `jail`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `job_grades`
--
ALTER TABLE `job_grades`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `keysvehi`
--
ALTER TABLE `keysvehi`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `licenses`
--
ALTER TABLE `licenses`
  ADD PRIMARY KEY (`type`);

--
-- Index pour la table `open_car`
--
ALTER TABLE `open_car`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `owned_vehicles`
--
ALTER TABLE `owned_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `ox_inventory`
--
ALTER TABLE `ox_inventory`
  ADD UNIQUE KEY `owner` (`owner`,`name`);

--
-- Index pour la table `pedoffline`
--
ALTER TABLE `pedoffline`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `rented_vehicles`
--
ALTER TABLE `rented_vehicles`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `tig`
--
ALTER TABLE `tig`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `uniqueid`
--
ALTER TABLE `uniqueid`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`identifier`);

--
-- Index pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vehicle_categories`
--
ALTER TABLE `vehicle_categories`
  ADD PRIMARY KEY (`name`);

--
-- Index pour la table `vehicle_sold`
--
ALTER TABLE `vehicle_sold`
  ADD PRIMARY KEY (`plate`);

--
-- Index pour la table `vehicule_entreprise`
--
ALTER TABLE `vehicule_entreprise`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `venteoccasion`
--
ALTER TABLE `venteoccasion`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vente_darme`
--
ALTER TABLE `vente_darme`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `vestiaire`
--
ALTER TABLE `vestiaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `warn`
--
ALTER TABLE `warn`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `weapon_society`
--
ALTER TABLE `weapon_society`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `zk_clothe`
--
ALTER TABLE `zk_clothe`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `addon_account_data`
--
ALTER TABLE `addon_account_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT pour la table `addon_inventory_items`
--
ALTER TABLE `addon_inventory_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT pour la table `banking`
--
ALTER TABLE `banking`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `banlist`
--
ALTER TABLE `banlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `bansql`
--
ALTER TABLE `bansql`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT pour la table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `billing_entreprise`
--
ALTER TABLE `billing_entreprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `cardealer_vehicles`
--
ALTER TABLE `cardealer_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `chestobject`
--
ALTER TABLE `chestobject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `chestweapon`
--
ALTER TABLE `chestweapon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `coffrebuilder`
--
ALTER TABLE `coffrebuilder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `coffregang`
--
ALTER TABLE `coffregang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `coffrehouse`
--
ALTER TABLE `coffrehouse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `datastore_data`
--
ALTER TABLE `datastore_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pour la table `garage`
--
ALTER TABLE `garage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gav`
--
ALTER TABLE `gav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT pour la table `gestionadmin`
--
ALTER TABLE `gestionadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `gofast`
--
ALTER TABLE `gofast`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `historyboss`
--
ALTER TABLE `historyboss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT pour la table `houseimmo`
--
ALTER TABLE `houseimmo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT pour la table `jail`
--
ALTER TABLE `jail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `job_grades`
--
ALTER TABLE `job_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3990;

--
-- AUTO_INCREMENT pour la table `open_car`
--
ALTER TABLE `open_car`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `tig`
--
ALTER TABLE `tig`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT pour la table `trunk_inventory`
--
ALTER TABLE `trunk_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT pour la table `uniqueid`
--
ALTER TABLE `uniqueid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT pour la table `user_licenses`
--
ALTER TABLE `user_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT pour la table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=486;

--
-- AUTO_INCREMENT pour la table `vehicule_entreprise`
--
ALTER TABLE `vehicule_entreprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT pour la table `venteoccasion`
--
ALTER TABLE `venteoccasion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT pour la table `vente_darme`
--
ALTER TABLE `vente_darme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `vestiaire`
--
ALTER TABLE `vestiaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT pour la table `warn`
--
ALTER TABLE `warn`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `weapon_society`
--
ALTER TABLE `weapon_society`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `zk_clothe`
--
ALTER TABLE `zk_clothe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=559;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
