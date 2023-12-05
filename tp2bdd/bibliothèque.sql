-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Mar 05 Décembre 2023 à 15:29
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bibliothèque`
--

-- --------------------------------------------------------

--
-- Structure de la table `adherents`
--

CREATE TABLE IF NOT EXISTS `adherents` (
  `Id_Adherent` int(11) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) NOT NULL,
  `Prenom` varchar(50) NOT NULL,
  `Date_naissance` date NOT NULL,
  `Date_adhesion` date NOT NULL,
  `Adresse` varchar(50) NOT NULL,
  `Num_tel` varchar(50) NOT NULL,
  `Mail` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_Adherent`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `adherents`
--

INSERT INTO `adherents` (`Id_Adherent`, `Nom`, `Prenom`, `Date_naissance`, `Date_adhesion`, `Adresse`, `Num_tel`, `Mail`) VALUES
(1, 'Benterki', 'Mahmoud', '0000-00-00', '0000-00-00', '', '', ''),
(2, 'Oussama', 'Zta', '0000-00-00', '0000-00-00', '', '', ''),
(3, 'Halima', 'Benzenma', '0000-00-00', '0000-00-00', '', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `auteurs`
--

CREATE TABLE IF NOT EXISTS `auteurs` (
  `ID_Auteur` varchar(20) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Date_naissance` date NOT NULL,
  PRIMARY KEY (`ID_Auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `auteurs`
--

INSERT INTO `auteurs` (`ID_Auteur`, `Nom`, `Prenom`, `Date_naissance`) VALUES
('001', 'Baudelaire', 'Riyad', '0000-00-00'),
('002', 'Michel', 'Hakim', '0000-00-00'),
('003', 'Mane', 'Sadio', '0000-00-00');

-- --------------------------------------------------------

--
-- Structure de la table `emprunts`
--

CREATE TABLE IF NOT EXISTS `emprunts` (
  `Id_emprunt` int(11) NOT NULL AUTO_INCREMENT,
  `Date_emprunt` date NOT NULL,
  `Duree` int(11) NOT NULL,
  `Id_Adherent` int(11) NOT NULL,
  `Reference_livre` varchar(20) NOT NULL,
  PRIMARY KEY (`Id_emprunt`),
  KEY `Id_Adherent` (`Id_Adherent`,`Reference_livre`),
  KEY `Reference_livre` (`Reference_livre`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `emprunts`
--

INSERT INTO `emprunts` (`Id_emprunt`, `Date_emprunt`, `Duree`, `Id_Adherent`, `Reference_livre`) VALUES
(1, '2023-12-13', 3, 3, '002'),
(2, '2023-12-14', 2, 2, '001'),
(3, '2023-12-13', 8, 1, '001');

-- --------------------------------------------------------

--
-- Structure de la table `livres`
--

CREATE TABLE IF NOT EXISTS `livres` (
  `Reference_livre` varchar(20) NOT NULL,
  `Nbre_pages` int(11) NOT NULL,
  `Date_publication` date NOT NULL,
  `Genre` varchar(20) NOT NULL,
  `Disponibilite` tinyint(1) NOT NULL,
  `Nbre_emprunts` int(11) NOT NULL,
  `Etat` varchar(20) NOT NULL,
  `Nbre_exemplaire` int(11) NOT NULL,
  `ID_Auteur` varchar(20) NOT NULL,
  PRIMARY KEY (`Reference_livre`),
  KEY `ID_Auteur` (`ID_Auteur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `livres`
--

INSERT INTO `livres` (`Reference_livre`, `Nbre_pages`, `Date_publication`, `Genre`, `Disponibilite`, `Nbre_emprunts`, `Etat`, `Nbre_exemplaire`, `ID_Auteur`) VALUES
('001', 234, '2023-12-15', 'Humour', 0, 3, 'Neuf', 3, '001'),
('002', 213, '2023-12-06', 'Philo', 0, 43, 'Neuf', 3, '002'),
('003', 432, '2023-12-07', 'Humour', 0, 5, 'Neuf', 54, '001');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `emprunts`
--
ALTER TABLE `emprunts`
  ADD CONSTRAINT `emprunts_ibfk_2` FOREIGN KEY (`Reference_livre`) REFERENCES `livres` (`Reference_livre`),
  ADD CONSTRAINT `emprunts_ibfk_1` FOREIGN KEY (`Id_Adherent`) REFERENCES `adherents` (`Id_Adherent`);

--
-- Contraintes pour la table `livres`
--
ALTER TABLE `livres`
  ADD CONSTRAINT `livres_ibfk_1` FOREIGN KEY (`ID_Auteur`) REFERENCES `auteurs` (`ID_Auteur`);
