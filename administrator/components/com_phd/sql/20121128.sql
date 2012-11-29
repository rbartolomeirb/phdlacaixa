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
(1, 'Biology', 'Biology', 1),
(2, 'Molecular Biology', 'Molecular Biology', 2),
(3, 'Biochemistry', 'Biochemistry', 3),
(4, 'Biochemistry and Molecular Biology', 'Biochemistry and Molecular Biology', 4),
(5, 'Biotechnology', 'Biotechnology', 5),
(6, 'Molecular Biotechnology', 'Molecular Biotechnology', 6),
(7, 'Molecular Bioengineering', 'Molecular Bioengineering', 7),
(8, 'Medical Sciences', 'Medical Sciences', 8),
(9, 'Pharmacy', 'Pharmacy', 9),
(10, 'Physics', 'Physics', 10),
(11, 'Biophysics', 'Biophysics', 11),
(13, 'Neuroscience', 'Neuroscience', 13),
(12, 'Genetics', 'Genetics', 12),
(14, 'Bioinformatics', 'Bioinformatics', 14),
(15, 'Biomedicine and Biotechnology', 'Biomedicine and Biotechnology', 15),
(16, 'Pharmaceutical Chemistry', 'Pharmaceutical Chemistry', 16),
(17, 'Bioengineering', 'Bioengineering', 17);
