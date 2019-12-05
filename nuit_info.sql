-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 05 déc. 2019 à 23:47
-- Version du serveur :  5.7.21
-- Version de PHP :  5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `nuit_info`
--

-- --------------------------------------------------------

--
-- Structure de la table `forum`
--

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `id_forum` int(255) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `texte` varchar(255) DEFAULT NULL,
  `id_pers_Personne` int(255) DEFAULT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id_forum`),
  KEY `FK_Forum_id_pers_Personne` (`id_pers_Personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
CREATE TABLE IF NOT EXISTS `groupe` (
  `id_groupe` int(255) NOT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `droit` varchar(255) DEFAULT NULL,
  `id_pers_Personne` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_groupe`),
  KEY `FK_Groupe_id_pers_Personne` (`id_pers_Personne`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `information`
--

DROP TABLE IF EXISTS `information`;
CREATE TABLE IF NOT EXISTS `information` (
  `id_info` int(255) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `texte` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_info`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int(255) NOT NULL,
  `texte` varchar(255) DEFAULT NULL,
  `id_forum_Forum` int(255) DEFAULT NULL,
  `id_pers` int(11) NOT NULL,
  PRIMARY KEY (`id_message`),
  KEY `FK_Message_id_forum_Forum` (`id_forum_Forum`),
  KEY `FK_message_pers` (`id_pers`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `personne`
--

DROP TABLE IF EXISTS `personne`;
CREATE TABLE IF NOT EXISTS `personne` (
  `id_pers` int(255) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `pseudo` varchar(100) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `date_naiss` date DEFAULT NULL,
  `id_groupe_Groupe` int(255) DEFAULT NULL,
  PRIMARY KEY (`id_pers`),
  KEY `FK_Personne_id_groupe_Groupe` (`id_groupe_Groupe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `FK_Forum_id_pers_Personne` FOREIGN KEY (`id_pers_Personne`) REFERENCES `personne` (`id_pers`);

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `FK_Groupe_id_pers_Personne` FOREIGN KEY (`id_pers_Personne`) REFERENCES `personne` (`id_pers`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_Message_id_forum_Forum` FOREIGN KEY (`id_forum_Forum`) REFERENCES `forum` (`id_forum`),
  ADD CONSTRAINT `FK_message_pers` FOREIGN KEY (`id_pers`) REFERENCES `personne` (`id_pers`);

--
-- Contraintes pour la table `personne`
--
ALTER TABLE `personne`
  ADD CONSTRAINT `FK_Personne_id_groupe_Groupe` FOREIGN KEY (`id_groupe_Groupe`) REFERENCES `groupe` (`id_groupe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
