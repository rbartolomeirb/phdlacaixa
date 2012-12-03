--
-- Table structure for table `jos_phd_scientific_discipline`
--

CREATE TABLE IF NOT EXISTS `jos_phd_scientific_discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) NOT NULL,
  `short_description` varchar(50) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `jos_phd_scientific_discipline`
--

INSERT INTO `jos_phd_scientific_discipline` (`id`, `description`, `short_description`, `order`) VALUES
(1, 'Biochemistry', 'Biochemistry', 1),
(2, 'Bioengineering', 'Bioengineering', 2),
(3, 'Bioinformatics', 'Bioinformatics', 3),
(4, 'Biology', 'Biology', 4),
(5, 'Biomedicine', 'Biomedicine', 5),
(6, 'Biophysics', 'Biophysics', 6),
(7, 'Biotechnology', 'Biotechnology', 7),
(8, 'Cell Biology', 'Cell Biology', 8),
(9, 'Chemistry', 'Chemistry', 9),
(10, 'Genetics', 'Genetics', 10),
(11, 'Immunology', 'Immunology', 11),
(12, 'Mathematics', 'Mathematics', 12),
(13, 'Medicine', 'Medicine', 13),
(14, 'Microbiology', 'Microbiology', 14),
(15, 'Molecular Bioengineering', 'MMolecular Bioengineering', 15),
(16, 'Molecular Biology', 'Molecular Biology', 16),
(17, 'Molecular Biotechnology', 'Molecular Biotechnology', 17),
(18, 'Nanotechnology', 'Nanotechnology', 18),
(19, 'Neuroscience', 'Neuroscience', 19),
(20, 'Nutrition', 'Nutrition', 20),
(21, 'Oncology', 'Oncology', 21),
(22, 'Organic Chemistry', 'Organic Chemistry', 22),
(23, 'Pharmaceutical Chemistry', 'Pharmaceutical Chemistry', 23),
(24, 'Pharmacology', 'Pharmacology', 24),
(25, 'Pharmacy', 'Pharmacy', 25),
(26, 'Physics', 'Physics', 26),
(27, 'Veterinary', 'Veterinary', 27),
(28, 'Zoology', 'Zoology', 28),
(29, 'Other', 'Other', 29);
