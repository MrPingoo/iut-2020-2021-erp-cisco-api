-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Dec 15, 2020 at 10:27 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `api-erp-cisco-v2`
--

-- --------------------------------------------------------

--
-- Table structure for table `creneau`
--

CREATE TABLE `creneau` (
  `id` int(11) NOT NULL,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `salle_id` int(11) NOT NULL,
  `nb` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `creneau`
--

INSERT INTO `creneau` (`id`, `begin`, `end`, `salle_id`, `nb`) VALUES
(1, '2020-11-20 15:30:00', '2020-11-20 16:30:00', 1, 4),
(2, '2020-11-20 15:30:00', '2020-11-20 16:30:00', 1, 4),
(3, '2020-11-20 15:30:00', '2020-11-20 16:30:00', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `enfant`
--

CREATE TABLE `enfant` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `enfant`
--

INSERT INTO `enfant` (`id`, `firstname`, `lastname`, `parent_id`) VALUES
(1, 'test', 'test', 4),
(2, 'John1', 'Doe', 7),
(3, 'John2', 'Doe', 7);

-- --------------------------------------------------------

--
-- Table structure for table `matiere`
--

CREATE TABLE `matiere` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `matiere_has_creneau`
--

CREATE TABLE `matiere_has_creneau` (
  `matiere_id` int(11) NOT NULL,
  `creneau_id` int(11) NOT NULL,
  `lvl` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `parent`
--

CREATE TABLE `parent` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parent`
--

INSERT INTO `parent` (`id`, `email`, `password`, `firstname`, `lastname`) VALUES
(1, 'Doe', 'Doe', 'John', 'Doe'),
(2, 'Doe', 'Doe', 'John', 'Doe'),
(3, 'john@google.com', 'ab4f63f9ac65152575886860dde480a1', 'John', 'Doe'),
(4, 'john@google.com', 'ab4f63f9ac65152575886860dde480a1', 'John', 'Doe'),
(5, 'john@google.com', 'ab4f63f9ac65152575886860dde480a1', 'John', 'Doe'),
(6, 'john@google.com', 'ab4f63f9ac65152575886860dde480a1', 'John', 'Doe'),
(7, 'john@google.com', 'ab4f63f9ac65152575886860dde480a1', 'John', 'Doe'),
(8, NULL, 'd41d8cd98f00b204e9800998ecf8427e', NULL, NULL),
(9, 'john@google.com', 'ab4f63f9ac65152575886860dde480a1', 'John', 'Doe'),
(10, 'john@google.com', 'ab4f63f9ac65152575886860dde480a1', 'John', 'Doe');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `id` int(11) NOT NULL,
  `enfant_id` int(11) NOT NULL,
  `creneau_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salle`
--

CREATE TABLE `salle` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zipcode` varchar(5) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salle`
--

INSERT INTO `salle` (`id`, `name`, `address`, `zipcode`, `city`) VALUES
(1, 'Salle 1', '123 rue des pommes', '75001', 'Paris');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `creneau`
--
ALTER TABLE `creneau`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Creneau_salle1_idx` (`salle_id`);

--
-- Indexes for table `enfant`
--
ALTER TABLE `enfant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_enfant_parent1_idx` (`parent_id`);

--
-- Indexes for table `matiere`
--
ALTER TABLE `matiere`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matiere_has_creneau`
--
ALTER TABLE `matiere_has_creneau`
  ADD PRIMARY KEY (`matiere_id`,`creneau_id`),
  ADD KEY `fk_matiere_has_Creneau_Creneau1_idx` (`creneau_id`),
  ADD KEY `fk_matiere_has_Creneau_matiere1_idx` (`matiere_id`);

--
-- Indexes for table `parent`
--
ALTER TABLE `parent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Resa_enfant1_idx` (`enfant_id`),
  ADD KEY `fk_Resa_creneau1_idx` (`creneau_id`);

--
-- Indexes for table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `creneau`
--
ALTER TABLE `creneau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `enfant`
--
ALTER TABLE `enfant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parent`
--
ALTER TABLE `parent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `salle`
--
ALTER TABLE `salle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `creneau`
--
ALTER TABLE `creneau`
  ADD CONSTRAINT `fk_Creneau_salle1` FOREIGN KEY (`salle_id`) REFERENCES `salle` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `enfant`
--
ALTER TABLE `enfant`
  ADD CONSTRAINT `fk_enfant_parent1` FOREIGN KEY (`parent_id`) REFERENCES `parent` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `matiere_has_creneau`
--
ALTER TABLE `matiere_has_creneau`
  ADD CONSTRAINT `fk_matiere_has_Creneau_Creneau1` FOREIGN KEY (`creneau_id`) REFERENCES `creneau` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_matiere_has_Creneau_matiere1` FOREIGN KEY (`matiere_id`) REFERENCES `matiere` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_Resa_creneau1` FOREIGN KEY (`creneau_id`) REFERENCES `creneau` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Resa_enfant1` FOREIGN KEY (`enfant_id`) REFERENCES `enfant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
