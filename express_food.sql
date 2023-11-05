-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 09 Novembre 2017 à 13:22
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `express_food`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE `administrateur` (
  `utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `administrateur`
--

INSERT INTO `administrateur` (`utilisateur_id`) VALUES
(4);

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `reference` varchar(20) NOT NULL,
  `nom` varchar(40) NOT NULL,
  `descriptif` varchar(1000) DEFAULT NULL,
  `composition` varchar(1000) DEFAULT NULL,
  `date_ajout` date NOT NULL,
  `quantite_en_stock` int(11) NOT NULL,
  `prix_unitaire_ht` decimal(4,2) NOT NULL,
  `taux_tva_100` decimal(6,4) NOT NULL,
  `categorie_nom` varchar(40) NOT NULL,
  `administrateur_utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`reference`, `nom`, `descriptif`, `composition`, `date_ajout`, `quantite_en_stock`, `prix_unitaire_ht`, `taux_tva_100`, `categorie_nom`, `administrateur_utilisateur_id`) VALUES
('DE_CLAFOUTIS_GRIOTTE', 'Clafoutis aux griottes', 'Un clafoutis moelleux au lait entier, au beurre et à la crème fraîche, et généreux en griottes. C\'est incontestablement la petite touche sucrée pour achever un repas sur le pouce ou satisfaire une pause gourmande.\r\nPoids net: 130g', 'Lait entier, griottes dénoyautées, sucre, œufs, farine de blé, crème, beurre demi-sel.', '2017-01-11', 40, '2.50', '20.0000', 'Dessert', 4),
('DE_MOELLEUX_NXCOCO', 'Moelleux à la noix de coco', 'Succombez au plaisir d\'un dessert minute avec ce moelleux pur beurre à la noix de coco au format nomade. Une petite touche sucrée pour finir en beauté le repas ou pour un goûter gourmand !\r\nPoids net: 80g', 'Noix de coco râpée, oeufs, sucre, beurre, farine de blé, poudre de lait', '2017-01-11', 40, '2.80', '20.0000', 'Dessert', 4),
('PL_COLOMBO_PORC', 'Colombo de porc et riz façon pilaf', 'Ce délicieux colombo de porc est accompagné de riz et d’une sauce onctueuse aux épices.Parfait pour faire voyager vos papilles !\r\nPoids net: 350g', 'Riz cuisiné, huile de tournesol, porc, oignon grillé, courgette grillée, compote de pomme sucrée, tomate, huile de tournesol, purée de gingembre, farine de blé, épices, sucre, purée d\'ail, piment, purée de tomate, poivrons, persil, sel.', '2017-01-11', 40, '4.20', '20.0000', 'Plat', 4),
('PL_RISOTTO_STJACQUE', 'Risotto aux St-Jacques', 'Au coeur d\'un risotto crémeux aux notes de vin blanc et de parmesan, se glissent de tendres noix de Saint-Jacques et quelques fèves de soja et épinards. Une recette pleine de saveurs et de textures pour un repas qui sort de l\'ordinaire.\r\nPoids net: 350g', 'Crème fraiche, noix de saint Jacques, riz, fèves de soja, épinard, échalotes, oignons, vin blanc, parmesan, huile d\'olive, épices et plantes aromatiques, sel, jus de citron.', '2017-01-11', 40, '5.80', '20.0000', 'Plat', 4);

-- --------------------------------------------------------

--
-- Structure de la table `avis`
--

CREATE TABLE `avis` (
  `id` int(11) NOT NULL,
  `note_sur_10` tinyint(2) NOT NULL,
  `commentaire` varchar(1000) DEFAULT NULL,
  `client_utilisateur_id` int(11) NOT NULL,
  `service_client_utilisateur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `avis`
--

INSERT INTO `avis` (`id`, `note_sur_10`, `commentaire`, `client_utilisateur_id`, `service_client_utilisateur_id`) VALUES
(1, 8, 'Réponse rapide et satisfaisante ! J\'adore Express Food !', 3, 2);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `nom` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`nom`) VALUES
('Dessert'),
('Plat');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `utilisateur_id` int(11) NOT NULL,
  `numero_telephone` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`utilisateur_id`, `numero_telephone`) VALUES
(3, '0615028557'),
(5, '0658504021'),
(6, '0628527496'),
(8, '0682744085'),
(9, '0658855224');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `numero` int(11) NOT NULL,
  `date` timestamp NOT NULL,
  `adresse_destinataire` varchar(45) NOT NULL,
  `adresse_complement_destinataire` varchar(45) DEFAULT NULL,
  `adresse_voie` varchar(45) NOT NULL,
  `adresse_complement_construction` varchar(45) DEFAULT NULL,
  `adresse_complement_localisation` varchar(45) DEFAULT NULL,
  `adresse_code_postal` char(5) NOT NULL,
  `adresse_localite` varchar(45) NOT NULL,
  `statut_libelle` enum('Terminée','En cours de livraison','En attente','Annulée') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`numero`, `date`, `adresse_destinataire`, `adresse_complement_destinataire`, `adresse_voie`, `adresse_complement_construction`, `adresse_complement_localisation`, `adresse_code_postal`, `adresse_localite`, `statut_libelle`) VALUES
(1, '2017-11-01 11:30:40', 'Carre Laurent', NULL, '10 Rue de Rivoli', NULL, NULL, '75004', 'Paris', 'Terminée'),
(2, '2017-11-01 11:40:20', 'Andre Eric', NULL, '8 Rue Aubriot', NULL, NULL, '75004', 'Paris', 'Terminée'),
(3, '2017-11-01 11:45:00', 'Quiers Isabelle', NULL, '31 Rue Copernic', NULL, NULL, '75116', 'Paris', 'En cours de livraison'),
(4, '2017-11-01 11:50:00', 'Rado Pierre', NULL, '5 Rue Kepler', NULL, NULL, '75116', 'Paris', 'En cours de livraison'),
(5, '2017-11-01 11:52:00', 'Ourtant Maxime', NULL, '8 Avenue Georges Mandel', NULL, NULL, '75116', 'Paris', 'En attente');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `numero` int(11) NOT NULL,
  `montant_total_ht` decimal(5,2) NOT NULL,
  `montant_total_ttc` decimal(5,2) NOT NULL,
  `date` date NOT NULL,
  `commande_numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `facture`
--

INSERT INTO `facture` (`numero`, `montant_total_ht`, `montant_total_ttc`, `date`, `commande_numero`) VALUES
(1, '7.00', '8.40', '2017-11-01', 1),
(2, '10.80', '12.96', '2017-11-01', 2),
(3, '6.70', '8.04', '2017-11-01', 3),
(4, '11.20', '13.44', '2017-11-01', 4),
(5, '8.30', '9.96', '2017-11-01', 5);

-- --------------------------------------------------------

--
-- Structure de la table `historique_statut`
--

CREATE TABLE `historique_statut` (
  `date` timestamp NOT NULL,
  `commande_numero` int(11) NOT NULL,
  `statut_libelle` enum('Terminée','En cours de livraison','En attente','Annulée') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `historique_statut`
--

INSERT INTO `historique_statut` (`date`, `commande_numero`, `statut_libelle`) VALUES
('2017-11-01 12:05:00', 1, 'Terminée'),
('2017-11-01 11:32:00', 1, 'En cours de livraison'),
('2017-11-01 11:30:40', 1, 'En attente'),
('2017-11-01 11:54:20', 2, 'Terminée'),
('2017-11-01 11:41:00', 2, 'En cours de livraison'),
('2017-11-01 11:40:20', 2, 'En attente'),
('2017-11-01 11:55:00', 3, 'En cours de livraison'),
('2017-11-01 11:45:00', 3, 'En attente'),
('2017-11-01 12:06:00', 4, 'En cours de livraison'),
('2017-11-01 11:50:00', 4, 'En attente'),
('2017-11-01 11:52:00', 5, 'En attente');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `commande_numero` int(11) NOT NULL,
  `article_reference` varchar(20) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ligne_commande`
--

INSERT INTO `ligne_commande` (`commande_numero`, `article_reference`, `quantite`) VALUES
(1, 'DE_MOELLEUX_NXCOCO', 1),
(1, 'PL_COLOMBO_PORC', 1),
(2, 'DE_CLAFOUTIS_GRIOTTE', 2),
(2, 'PL_RISOTTO_STJACQUE', 1),
(3, 'DE_CLAFOUTIS_GRIOTTE', 1),
(3, 'PL_COLOMBO_PORC', 1),
(4, 'DE_MOELLEUX_NXCOCO', 1),
(4, 'PL_COLOMBO_PORC', 2),
(5, 'DE_CLAFOUTIS_GRIOTTE', 1),
(5, 'PL_RISOTTO_STJACQUE', 1);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_livraison`
--

CREATE TABLE `ligne_livraison` (
  `temps_estime` time NOT NULL,
  `livreur_utilisateur_id` int(11) NOT NULL,
  `commande_numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ligne_livraison`
--

INSERT INTO `ligne_livraison` (`temps_estime`, `livreur_utilisateur_id`, `commande_numero`) VALUES
('00:10:00', 1, 1),
('00:18:00', 1, 4),
('00:15:00', 7, 2),
('00:12:00', 7, 3);

-- --------------------------------------------------------

--
-- Structure de la table `ligne_paiement`
--

CREATE TABLE `ligne_paiement` (
  `client_utilisateur_id` int(11) NOT NULL,
  `commande_numero` int(11) NOT NULL,
  `moyen_paiement` varchar(30) NOT NULL,
  `montant_ttc` decimal(5,2) NOT NULL,
  `date` timestamp NOT NULL,
  `statut` enum('En cours de vérification','Accepté','Refusé') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ligne_paiement`
--

INSERT INTO `ligne_paiement` (`client_utilisateur_id`, `commande_numero`, `moyen_paiement`, `montant_ttc`, `date`, `statut`) VALUES
(3, 1, 'Visa', '8.40', '2017-11-01 11:32:00', 'Accepté'),
(5, 2, 'MasterCard', '12.96', '2017-11-01 11:41:00', 'Accepté'),
(6, 3, 'Paypal', '8.04', '2017-11-01 11:46:00', 'Accepté'),
(8, 4, 'Visa', '13.44', '2017-11-01 11:51:10', 'Accepté'),
(9, 5, 'MasterCard', '9.96', '2017-11-01 11:53:00', 'Accepté');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `utilisateur_id` int(11) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `position_x` decimal(8,6) NOT NULL,
  `position_y` decimal(8,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `livreur`
--

INSERT INTO `livreur` (`utilisateur_id`, `statut`, `position_x`, `position_y`) VALUES
(1, 0, '2.329745', '48.867142'),
(7, 0, '2.331992', '48.870628');

-- --------------------------------------------------------

--
-- Structure de la table `service_client`
--

CREATE TABLE `service_client` (
  `utilisateur_id` int(11) NOT NULL,
  `note_moyenne_sur_10` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `service_client`
--

INSERT INTO `service_client` (`utilisateur_id`, `note_moyenne_sur_10`) VALUES
(2, 8);

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

CREATE TABLE `statut` (
  `libelle` enum('Terminée','En cours de livraison','En attente','Annulée') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `statut`
--

INSERT INTO `statut` (`libelle`) VALUES
('Terminée'),
('En cours de livraison'),
('En attente'),
('Annulée');

-- --------------------------------------------------------

--
-- Structure de la table `stock_livreur`
--

CREATE TABLE `stock_livreur` (
  `livreur_utilisateur_id` int(11) NOT NULL,
  `article_reference` varchar(20) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `stock_livreur`
--

INSERT INTO `stock_livreur` (`livreur_utilisateur_id`, `article_reference`, `quantite`) VALUES
(1, 'DE_CLAFOUTIS_GRIOTTE', 10),
(1, 'DE_MOELLEUX_NXCOCO', 9),
(1, 'PL_COLOMBO_PORC', 9),
(1, 'PL_RISOTTO_STJACQUE', 10),
(7, 'DE_CLAFOUTIS_GRIOTTE', 8),
(7, 'DE_MOELLEUX_NXCOCO', 10),
(7, 'PL_COLOMBO_PORC', 10),
(7, 'PL_RISOTTO_STJACQUE', 9);

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `numero` int(11) NOT NULL,
  `titre` varchar(300) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `statut` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL,
  `service_client_utilisateur_id` int(11) NOT NULL,
  `client_utilisateur_id` int(11) NOT NULL,
  `commande_numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `ticket`
--

INSERT INTO `ticket` (`numero`, `titre`, `message`, `statut`, `date`, `service_client_utilisateur_id`, `client_utilisateur_id`, `commande_numero`) VALUES
(1, 'Problème commande ', 'Bonjour, après avoir passer commande j\'ai du attendre 35 min avant d\'être livré ! Je n\'ai même pas eu le temps de manger que je reparter deja au travail.\r\nMerci de votre compréhension', 1, '2017-11-01 13:00:00', 2, 3, 1),
(2, '[Re] Problème commande', 'Bonjour, excusez nous pour notre retard notre livreur a eu un problème de vélo.\r\nJe lance immédiatement un remboursement de votre commande ! Merci et à bientot', 0, '2017-11-01 14:00:00', 2, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `nom_utilisateur` varchar(30) NOT NULL,
  `mot_de_passe_utilisateur` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `nom_utilisateur`, `mot_de_passe_utilisateur`, `email`) VALUES
(1, 'Illan', 'Mathieu', 'Mathieu1402', '1a7e607c0ca86a4b5ab82ea204568f0b92a68919', 'mathieuillan@yahoo.fr'),
(2, 'Aubert', 'Julie', 'Juliaub98', '8a7e207c0ca46a4b5ab82ea204568f0b92a68911', 'julieaubert@orange.fr'),
(3, 'Carre', 'Laurent', 'Laurent788', '4a7e826c0ca86a4b6ab95ea204518f0b92a68919', 'laurentcarre@laposte.net'),
(4, 'Lambat', 'Christophe', 'Christof54', '5a2e375c8ca46a2b5ab02ea244128f0b92a68919', 'christophelambat@gmail.com'),
(5, 'Andre', 'Eric', 'Eric44', '2a8e097c4ca28a455ab82ea204568f0b92a68942', 'ericandre@gmail.com'),
(6, 'Quiers', 'Isabelle', 'Isa88', '7a4e500c5ca42a5b5ab82ea204568f0b92a62445', 'isabellequiers@hotmail.com'),
(7, 'Jordan', 'Maxence', 'Maxjor52', '4a2e854c2ca05a4b5ab82ea204568f0b92a45680', 'maxence-jordan@gmail.com'),
(8, 'Rado', 'Pierre', 'Pierrerado10', '7a9e245c8ca86a4b5ab82ea204568f0b92a12568', 'pierrerado@yahoo.fr'),
(9, 'Ourtant', 'Maxime', 'Maxime85', '3b8e207c0ca86a4b4ab82ea924568f0b26a62445', 'maximeourtant@yahoo.fr');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD PRIMARY KEY (`utilisateur_id`),
  ADD KEY `fk_administrateur_utilisateur_idx` (`utilisateur_id`);

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`reference`),
  ADD KEY `fk_article_administrateur1_idx` (`administrateur_utilisateur_id`),
  ADD KEY `fk_article_categorie1_idx` (`categorie_nom`);

--
-- Index pour la table `avis`
--
ALTER TABLE `avis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Avis_client1_idx` (`client_utilisateur_id`),
  ADD KEY `fk_Avis_service_client1_idx` (`service_client_utilisateur_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`nom`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`utilisateur_id`),
  ADD KEY `fk_client_utilisateur1_idx` (`utilisateur_id`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `fk_commande_statut1_idx` (`statut_libelle`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `fk_facture_commande1_idx` (`commande_numero`);

--
-- Index pour la table `historique_statut`
--
ALTER TABLE `historique_statut`
  ADD PRIMARY KEY (`commande_numero`,`statut_libelle`),
  ADD KEY `fk_historique_statut_statut1_idx` (`statut_libelle`);

--
-- Index pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`commande_numero`,`article_reference`),
  ADD KEY `fk_ligne_commande_article1_idx` (`article_reference`),
  ADD KEY `fk_ligne_commande_commande1_idx` (`commande_numero`);

--
-- Index pour la table `ligne_livraison`
--
ALTER TABLE `ligne_livraison`
  ADD PRIMARY KEY (`livreur_utilisateur_id`,`commande_numero`),
  ADD KEY `fk_ligne_livraison_commande1_idx` (`commande_numero`);

--
-- Index pour la table `ligne_paiement`
--
ALTER TABLE `ligne_paiement`
  ADD PRIMARY KEY (`client_utilisateur_id`,`commande_numero`),
  ADD KEY `fk_ligne_paiement_commande1_idx` (`commande_numero`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`utilisateur_id`),
  ADD KEY `fk_livreur_utilisateur1_idx` (`utilisateur_id`);

--
-- Index pour la table `service_client`
--
ALTER TABLE `service_client`
  ADD PRIMARY KEY (`utilisateur_id`),
  ADD KEY `fk_service_client_utilisateur1_idx` (`utilisateur_id`);

--
-- Index pour la table `statut`
--
ALTER TABLE `statut`
  ADD PRIMARY KEY (`libelle`);

--
-- Index pour la table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD PRIMARY KEY (`livreur_utilisateur_id`,`article_reference`),
  ADD KEY `fk_stock_livreur_article1_idx` (`article_reference`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`numero`),
  ADD KEY `fk_ticket_service_client1_idx` (`service_client_utilisateur_id`),
  ADD KEY `fk_ticket_client1_idx` (`client_utilisateur_id`),
  ADD KEY `fk_ticket_commande1_idx` (`commande_numero`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `avis`
--
ALTER TABLE `avis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `administrateur`
--
ALTER TABLE `administrateur`
  ADD CONSTRAINT `fk_administrateur_utilisateur` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_administrateur1` FOREIGN KEY (`administrateur_utilisateur_id`) REFERENCES `administrateur` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_article_categorie1` FOREIGN KEY (`categorie_nom`) REFERENCES `categorie` (`nom`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `avis`
--
ALTER TABLE `avis`
  ADD CONSTRAINT `fk_Avis_client1` FOREIGN KEY (`client_utilisateur_id`) REFERENCES `client` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Avis_service_client1` FOREIGN KEY (`service_client_utilisateur_id`) REFERENCES `service_client` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_client_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_statut1` FOREIGN KEY (`statut_libelle`) REFERENCES `statut` (`libelle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `fk_facture_commande1` FOREIGN KEY (`commande_numero`) REFERENCES `commande` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `historique_statut`
--
ALTER TABLE `historique_statut`
  ADD CONSTRAINT `fk_historique_statut_commande1` FOREIGN KEY (`commande_numero`) REFERENCES `commande` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_historique_statut_statut1` FOREIGN KEY (`statut_libelle`) REFERENCES `statut` (`libelle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_ligne_commande_article1` FOREIGN KEY (`article_reference`) REFERENCES `article` (`reference`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ligne_commande_commande1` FOREIGN KEY (`commande_numero`) REFERENCES `commande` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligne_livraison`
--
ALTER TABLE `ligne_livraison`
  ADD CONSTRAINT `fk_ligne_livraison_commande1` FOREIGN KEY (`commande_numero`) REFERENCES `commande` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ligne_livraison_livreur1` FOREIGN KEY (`livreur_utilisateur_id`) REFERENCES `livreur` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ligne_paiement`
--
ALTER TABLE `ligne_paiement`
  ADD CONSTRAINT `fk_ligne_paiement_client1` FOREIGN KEY (`client_utilisateur_id`) REFERENCES `client` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ligne_paiement_commande1` FOREIGN KEY (`commande_numero`) REFERENCES `commande` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `fk_livreur_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `service_client`
--
ALTER TABLE `service_client`
  ADD CONSTRAINT `fk_service_client_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD CONSTRAINT `fk_stock_livreur_article1` FOREIGN KEY (`article_reference`) REFERENCES `article` (`reference`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_stock_livreur_livreur1` FOREIGN KEY (`livreur_utilisateur_id`) REFERENCES `livreur` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_ticket_client1` FOREIGN KEY (`client_utilisateur_id`) REFERENCES `client` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_commande1` FOREIGN KEY (`commande_numero`) REFERENCES `commande` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_service_client1` FOREIGN KEY (`service_client_utilisateur_id`) REFERENCES `service_client` (`utilisateur_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
