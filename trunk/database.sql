-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 17, 2013 at 04:46 PM
-- Server version: 5.5.32
-- PHP Version: 5.3.10-1ubuntu3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `phdlacaixa`
--
CREATE DATABASE `phdlacaixa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `phdlacaixa`;

-- --------------------------------------------------------

--
-- Table structure for table `changelog`
--

CREATE TABLE IF NOT EXISTS `changelog` (
  `change_number` bigint(20) NOT NULL,
  `delta_set` varchar(10) NOT NULL,
  `start_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `complete_dt` timestamp NULL DEFAULT NULL,
  `applied_by` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  PRIMARY KEY (`change_number`,`delta_set`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_banner`
--

CREATE TABLE IF NOT EXISTS `jos_banner` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT 'banner',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `imageurl` varchar(100) NOT NULL DEFAULT '',
  `clickurl` varchar(200) NOT NULL DEFAULT '',
  `date` datetime DEFAULT NULL,
  `showBanner` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `custombannercode` text,
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` text NOT NULL,
  `params` text NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `viewbanner` (`showBanner`),
  KEY `idx_banner_catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_banner`
--

INSERT INTO `jos_banner` (`bid`, `cid`, `type`, `name`, `alias`, `imptotal`, `impmade`, `clicks`, `imageurl`, `clickurl`, `date`, `showBanner`, `checked_out`, `checked_out_time`, `editor`, `custombannercode`, `catid`, `description`, `sticky`, `ordering`, `publish_up`, `publish_down`, `tags`, `params`) VALUES
(1, 1, 'banner', 'OSM 1', 'osm-1', 0, 43, 0, 'osmbanner1.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(2, 1, 'banner', 'OSM 2', 'osm-2', 0, 49, 0, 'osmbanner2.png', 'http://www.opensourcematters.org', '2004-07-07 15:31:29', 1, 0, '0000-00-00 00:00:00', '', '', 13, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(3, 1, '', 'Joomla!', 'joomla', 0, 22, 0, '', 'http://www.joomla.org', '2006-05-29 14:21:28', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomla! The most popular and widely used Open Source CMS Project in the world.', 14, '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(4, 1, '', 'JoomlaCode', 'joomlacode', 0, 22, 0, '', 'http://joomlacode.org', '2006-05-29 14:19:26', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomlaCode, development and distribution made easy.', 14, '', 0, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(5, 1, '', 'Joomla! Extensions', 'joomla-extensions', 0, 17, 0, '', 'http://extensions.joomla.org', '2006-05-29 14:23:21', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nJoomla! Components, Modules, Plugins and Languages by the bucket load.', 14, '', 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(6, 1, '', 'Joomla! Shop', 'joomla-shop', 0, 17, 0, '', 'http://shop.joomla.org', '2006-05-29 14:23:21', 1, 0, '0000-00-00 00:00:00', '', '<a href="{CLICKURL}" target="_blank">{NAME}</a>\r\n<br/>\r\nFor all your Joomla! merchandise.', 14, '', 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(7, 1, '', 'Joomla! Promo Shop', 'joomla-promo-shop', 0, 11, 1, 'shop-ad.jpg', 'http://shop.joomla.org', '2007-09-19 17:26:24', 1, 0, '0000-00-00 00:00:00', '', '', 33, '', 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', ''),
(8, 1, '', 'Joomla! Promo Books', 'joomla-promo-books', 0, 14, 0, 'shop-ad-books.jpg', 'http://shop.joomla.org/amazoncom-bookstores.html', '2007-09-19 17:28:01', 1, 0, '0000-00-00 00:00:00', '', '', 33, '', 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannerclient`
--

CREATE TABLE IF NOT EXISTS `jos_bannerclient` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contact` varchar(255) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `extrainfo` text NOT NULL,
  `checked_out` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out_time` time DEFAULT NULL,
  `editor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_bannerclient`
--

INSERT INTO `jos_bannerclient` (`cid`, `name`, `contact`, `email`, `extrainfo`, `checked_out`, `checked_out_time`, `editor`) VALUES
(1, 'Open Source Matters', 'Administrator', 'admin@opensourcematters.org', '', 0, '00:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jos_bannertrack`
--

CREATE TABLE IF NOT EXISTS `jos_bannertrack` (
  `track_date` date NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_categories`
--

CREATE TABLE IF NOT EXISTS `jos_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor` varchar(50) DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`section`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `jos_categories`
--

INSERT INTO `jos_categories` (`id`, `parent_id`, `title`, `name`, `alias`, `image`, `section`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `editor`, `ordering`, `access`, `count`, `params`) VALUES
(1, 0, 'Latest', '', 'latest-news', 'taking_notes.jpg', '1', 'left', 'The latest news from the Joomla! Team', 1, 0, '0000-00-00 00:00:00', '', 1, 0, 1, ''),
(2, 0, 'Joomla! Specific Links', '', 'joomla-specific-links', 'clock.jpg', 'com_weblinks', 'left', 'A selection of links that are all related to the Joomla! Project.', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, ''),
(3, 0, 'Newsflash', '', 'newsflash', '', '1', 'left', '', 1, 0, '0000-00-00 00:00:00', '', 2, 0, 0, ''),
(4, 0, 'Joomla!', '', 'joomla', '', 'com_newsfeeds', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(5, 0, 'Free and Open Source Software', '', 'free-and-open-source-software', '', 'com_newsfeeds', 'left', 'Read the latest news about free and open source software from some of its leading advocates.', 1, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(6, 0, 'Related Projects', '', 'related-projects', '', 'com_newsfeeds', 'left', 'Joomla builds on and collaborates with many other free and open source projects. Keep up with the latest news from some of them.', 1, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(12, 0, 'Contacts', '', 'contacts', '', 'com_contact_details', 'left', 'Contact Details for this Web site', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(13, 0, 'Joomla', '', 'joomla', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(14, 0, 'Text Ads', '', 'text-ads', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 0, 0, 0, ''),
(15, 0, 'Features', '', 'features', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 6, 0, 0, ''),
(17, 0, 'Benefits', '', 'benefits', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 4, 0, 0, ''),
(18, 0, 'Platforms', '', 'platforms', '', 'com_content', 'left', '', 0, 0, '0000-00-00 00:00:00', NULL, 3, 0, 0, ''),
(19, 0, 'Other Resources', '', 'other-resources', '', 'com_weblinks', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 2, 0, 0, ''),
(33, 0, 'Joomla! Promo', '', 'joomla-promo', '', 'com_banner', 'left', '', 1, 0, '0000-00-00 00:00:00', NULL, 1, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_components`
--

CREATE TABLE IF NOT EXISTS `jos_components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) unsigned NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_menu_link` varchar(255) NOT NULL DEFAULT '',
  `admin_menu_alt` varchar(255) NOT NULL DEFAULT '',
  `option` varchar(50) NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `admin_menu_img` varchar(255) NOT NULL DEFAULT '',
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_option` (`parent`,`option`(32))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `jos_components`
--

INSERT INTO `jos_components` (`id`, `name`, `link`, `menuid`, `parent`, `admin_menu_link`, `admin_menu_alt`, `option`, `ordering`, `admin_menu_img`, `iscore`, `params`, `enabled`) VALUES
(1, 'Banners', '', 0, 0, '', 'Banner Management', 'com_banners', 0, 'js/ThemeOffice/component.png', 0, 'track_impressions=0\ntrack_clicks=0\ntag_prefix=\n\n', 1),
(2, 'Banners', '', 0, 1, 'option=com_banners', 'Active Banners', 'com_banners', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(3, 'Clients', '', 0, 1, 'option=com_banners&c=client', 'Manage Clients', 'com_banners', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(4, 'Web Links', 'option=com_weblinks', 0, 0, '', 'Manage Weblinks', 'com_weblinks', 0, 'js/ThemeOffice/component.png', 0, 'show_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 1),
(5, 'Links', '', 0, 4, 'option=com_weblinks', 'View existing weblinks', 'com_weblinks', 1, 'js/ThemeOffice/edit.png', 0, '', 1),
(6, 'Categories', '', 0, 4, 'option=com_categories&section=com_weblinks', 'Manage weblink categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(7, 'Contacts', 'option=com_contact', 0, 0, '', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/component.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(8, 'Contacts', '', 0, 7, 'option=com_contact', 'Edit contact details', 'com_contact', 0, 'js/ThemeOffice/edit.png', 1, '', 1),
(9, 'Categories', '', 0, 7, 'option=com_categories&section=com_contact_details', 'Manage contact categories', '', 2, 'js/ThemeOffice/categories.png', 1, 'contact_icons=0\nicon_address=\nicon_email=\nicon_telephone=\nicon_fax=\nicon_misc=\nshow_headings=1\nshow_position=1\nshow_email=0\nshow_telephone=1\nshow_mobile=1\nshow_fax=1\nbannedEmail=\nbannedSubject=\nbannedText=\nsession=1\ncustomReply=0\n\n', 1),
(10, 'Polls', 'option=com_poll', 0, 0, 'option=com_poll', 'Manage Polls', 'com_poll', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(11, 'News Feeds', 'option=com_newsfeeds', 0, 0, '', 'News Feeds Management', 'com_newsfeeds', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(12, 'Feeds', '', 0, 11, 'option=com_newsfeeds', 'Manage News Feeds', 'com_newsfeeds', 1, 'js/ThemeOffice/edit.png', 0, 'show_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 1),
(13, 'Categories', '', 0, 11, 'option=com_categories&section=com_newsfeeds', 'Manage Categories', '', 2, 'js/ThemeOffice/categories.png', 0, '', 1),
(14, 'User', 'option=com_user', 0, 0, '', '', 'com_user', 0, '', 1, '', 1),
(15, 'Search', 'option=com_search', 0, 0, 'option=com_search', 'Search Statistics', 'com_search', 0, 'js/ThemeOffice/component.png', 1, 'enabled=0\n\n', 1),
(16, 'Categories', '', 0, 1, 'option=com_categories&section=com_banner', 'Categories', '', 3, '', 1, '', 1),
(17, 'Wrapper', 'option=com_wrapper', 0, 0, '', 'Wrapper', 'com_wrapper', 0, '', 1, '', 1),
(18, 'Mail To', '', 0, 0, '', '', 'com_mailto', 0, '', 1, '', 1),
(19, 'Media Manager', '', 0, 0, 'option=com_media', 'Media Manager', 'com_media', 0, '', 1, 'upload_extensions=bmp,csv,doc,epg,gif,ico,jpg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,EPG,GIF,ICO,JPG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\nupload_maxsize=10000000\nfile_path=images\nimage_path=images/stories\nrestrict_uploads=1\nallowed_media_usergroup=3\ncheck_mime=1\nimage_extensions=bmp,gif,jpg,png\nignore_extensions=\nupload_mime=image/jpeg,image/gif,image/png,image/bmp,application/x-shockwave-flash,application/msword,application/excel,application/pdf,application/powerpoint,text/plain,application/x-zip\nupload_mime_illegal=text/html\nenable_flash=0\n\n', 1),
(20, 'Articles', 'option=com_content', 0, 0, '', '', 'com_content', 0, '', 1, 'show_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=0\n\n', 1),
(21, 'Configuration Manager', '', 0, 0, '', 'Configuration', 'com_config', 0, '', 1, '', 1),
(22, 'Installation Manager', '', 0, 0, '', 'Installer', 'com_installer', 0, '', 1, '', 1),
(23, 'Language Manager', '', 0, 0, '', 'Languages', 'com_languages', 0, '', 1, '', 1),
(24, 'Mass mail', '', 0, 0, '', 'Mass Mail', 'com_massmail', 0, '', 1, 'mailSubjectPrefix=\nmailBodySuffix=\n\n', 1),
(25, 'Menu Editor', '', 0, 0, '', 'Menu Editor', 'com_menus', 0, '', 1, '', 1),
(27, 'Messaging', '', 0, 0, '', 'Messages', 'com_messages', 0, '', 1, '', 1),
(28, 'Modules Manager', '', 0, 0, '', 'Modules', 'com_modules', 0, '', 1, '', 1),
(29, 'Plugin Manager', '', 0, 0, '', 'Plugins', 'com_plugins', 0, '', 1, '', 1),
(30, 'Template Manager', '', 0, 0, '', 'Templates', 'com_templates', 0, '', 1, '', 1),
(31, 'User Manager', '', 0, 0, '', 'Users', 'com_users', 0, '', 1, 'allowUserRegistration=1\nnew_usertype=Registered\nuseractivation=0\nfrontend_userparams=1\n\n', 1),
(32, 'Cache Manager', '', 0, 0, '', 'Cache', 'com_cache', 0, '', 1, '', 1),
(33, 'Control Panel', '', 0, 0, '', 'Control Panel', 'com_cpanel', 0, '', 1, '', 1),
(88, 'Programmes', '', 0, 41, 'option=com_phd&view=programmes', 'Programmes', 'com_phd', 0, 'js/ThemeOffice/component.png', 0, '', 1),
(89, 'Excel file', '', 0, 41, 'option=com_phd&view=applicants&format=raw', 'Excel file', 'com_phd', 1, 'js/ThemeOffice/component.png', 0, '', 1),
(90, 'Version', '', 0, 41, 'option=com_phd&controller=version&task=display', 'Version', 'com_phd', 2, 'js/ThemeOffice/component.png', 0, '', 1),
(41, 'PhD', 'option=com_phd', 0, 0, 'option=com_phd', 'PhD', 'com_phd', 0, 'js/ThemeOffice/component.png', 0, 'phdConfig_AdminName=Roberto Bartolome\nphdConfig_AdminEmail=roberto.bartolome@irbbarcelona.org\nphdConfig_LiveSite=http://localhost/phdlacaixa\nphdConfig_ClosingDateTime=2012-12-21 23:59:00\nphdConfig_LimitAge=99\nphdConfig_DocsPath=/docs_phd\nphdConfig_MaxNumberOfFiles=5\nphdConfig_SendBCC=0\nphdConfig_Application=1\nphdConfig_FirstChoice=1\nphdConfig_InvalidEmailProviders=gmail, yahoo, bing\nphdConfig_EmailRefereeSubject=subject de email a referee\nphdConfig_EmailRefereeBody=<html>\\n\\n<head>\\n\\n<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">\\n\\n<title>email</title>\\n\\n</head>\\n\\n\\n\\n<body>\\n\\n<p>Dear #referee#,</p>\\n\\n<p>My name is #name#, and you can upload the file in the following link:</p>\\n\\n<p>#link#</p>\\n\\n<p>Thanks,</p>\\n\\n<p>#name#</p>\\n\\n</body>\\n\\n</html>\\n\nphdConfig_EmailApplicantSubject1=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody1=Dear #name#,\\nThis email is to inform you that IRB Barcelona has not yet received one of the two letters of recommendation requested for application to IRB Barcelona PhD fellowships. We remind you that these letters must be sent directly to us by your referees (either by e-mail to phd@irbbarcelona.org, by airmail or by fax to our contact address) and that the deadline for receipt is 25 January 2009.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject2=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody2=Dear #name#,\\nThank you for your interest in IRB Barcelona and for submitting your application for a PhD position at our institute.\\nThis e-mail is to confirm that your application has been submitted correctly. You will hear back from us once the call closes and the first part of the evaluation process has been completed, around February 2009.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject3=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody3=Dear #name#,\\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2009 and the first part of the selection process has now been completed.\\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject4=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody4=Dear #name#,\\nThank you once again for your recent application for a PhD grant at IRB Barcelona. After careful evaluation of your merits, I am pleased to inform you that you have been short-listed as a potential candidate for one of the grants currently on offer. You will soon receive an official letter with the invitation to visit our Institute on 30 and 31 of March 2009 for interviews.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject5=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody5=Dear #name#,\\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\\nYours sincerely,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject6=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody6=Dear #name#,\\nAfter completion of the selection process, it is our pleasure to offer you a PhD fellowship at IRB Barcelona. We congratulate you on this achievement. As you know there was considerable competition for these fellowships and the number and quality of applicants were exceptionally high.\\nWe will officially contact you in the near future with more details of our offer.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\nphdConfig_EmailApplicantSubject7=News from IRB Barcelona PhD programme\nphdConfig_EmailApplicantBody7=Dear #name#,\\nThank you for your interest in IRB Barcelona and for submitting your application for a PhD position at our institute.\\nWe regret to inform you that we have received no recommendations letters. You have therefore been excluded from the selection process.\\nBest regards,\\nIRB Barcelona PhD Programme\\nThis is an automatically generated message. Please do not answer.\n\n', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_contact_details`
--

CREATE TABLE IF NOT EXISTS `jos_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `con_position` varchar(255) DEFAULT NULL,
  `address` text,
  `suburb` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postcode` varchar(100) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `misc` mediumtext,
  `image` varchar(255) DEFAULT NULL,
  `imagepos` varchar(20) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) NOT NULL DEFAULT '',
  `webpage` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `jos_contact_details`
--

INSERT INTO `jos_contact_details` (`id`, `name`, `alias`, `con_position`, `address`, `suburb`, `state`, `country`, `postcode`, `telephone`, `fax`, `misc`, `image`, `imagepos`, `email_to`, `default_con`, `published`, `checked_out`, `checked_out_time`, `ordering`, `params`, `user_id`, `catid`, `access`, `mobile`, `webpage`) VALUES
(1, 'Name', 'name', 'Position', 'Street', 'Suburb', 'State', 'Country', 'Zip Code', 'Telephone', 'Fax', 'Miscellanous info', 'powered_by.png', 'top', 'email@email.com', 1, 1, 62, '2012-11-29 13:07:00', 1, 'show_name=1\r\nshow_position=1\r\nshow_email=0\r\nshow_street_address=1\r\nshow_suburb=1\r\nshow_state=1\r\nshow_postcode=1\r\nshow_country=1\r\nshow_telephone=1\r\nshow_mobile=1\r\nshow_fax=1\r\nshow_webpage=1\r\nshow_misc=1\r\nshow_image=1\r\nallow_vcard=0\r\ncontact_icons=0\r\nicon_address=\r\nicon_email=\r\nicon_telephone=\r\nicon_fax=\r\nicon_misc=\r\nshow_email_form=1\r\nemail_description=1\r\nshow_email_copy=1\r\nbanned_email=\r\nbanned_subject=\r\nbanned_text=', 0, 12, 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content`
--

CREATE TABLE IF NOT EXISTS `jos_content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `title_alias` varchar(255) NOT NULL DEFAULT '',
  `introtext` mediumtext NOT NULL,
  `fulltext` mediumtext NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `sectionid` int(11) unsigned NOT NULL DEFAULT '0',
  `mask` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` int(11) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text NOT NULL,
  `urls` text NOT NULL,
  `attribs` text NOT NULL,
  `version` int(11) unsigned NOT NULL DEFAULT '1',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text NOT NULL,
  `metadesc` text NOT NULL,
  `access` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `metadata` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_section` (`sectionid`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `jos_content`
--

INSERT INTO `jos_content` (`id`, `title`, `alias`, `title_alias`, `introtext`, `fulltext`, `state`, `sectionid`, `mask`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `parentid`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`) VALUES
(46, 'Testing and Process Recommendations for Software Engineering', 'testing-and-process-recommendations-for-software-engineering', '', '<p><strong>Overview</strong> <br /> Many small software engineering organizations have problems cooperating and communicating on projects. A primary reason for this is that these small organizations often grow out of the individual efforts of  the one or two initial programmers.   Projects undertaken by an individual programmer are small enough for that one person to understand the requirements,  write the code, find the bugs, produce the deliverable, and provide the ongoing support,  often without really being aware that these are separate tasks.   As a result, comments in the code and user documentation are usually sparse. Other engineering processes and artifacts  - such as repeatable (documented and/or automated) tests, requirement and specification documents,  and records of bugs that were found and fixed - are often extremely informal or completely absent. <br /> <br /> Reasons why this happens include:</p>\r\n<ul>\r\n<li> Many software developers have not had appropriate education in software processes.   Many students have had courses in the details of specific languages and general programming constructs  (linked lists, hash tables, and so on), but few have had specific instruction in how to write a requirements document,  how to think about developing unit tests, etc. </li>\r\n<li> Small projects can and do succeed without these extra documents and processes,  so the need for those processes are not perceived.   An individual engineer who is working on a project small enough to keep in his or her head, may reach  a state that he or she can call "deliverable" much more quickly without producing requirements documents, unit tests, etc.   He or she may not perceive post-delivery support as part of the engineering cost and may not keep careful track  of how much time is spent on that part of the project.   (This is especially true if the end users come to expect and accept low-quality work and don’t bother  the engineer with reports of annoying but non-critical bugs.)   The engineer may therefore not believe in the value of these additional processes and may in fact be openly disdainful. </li>\r\n</ul>\r\n<p>As a software engineering organization achieves successes, it will tend to tackle more ambitious projects.   Soon there are two features of the projects that were extremely minimal or absent earlier on:</p>\r\n<ul>\r\n<li> The organization is working with customers that require some useful estimate of when the project will  be completed and how much it will cost.   Too many inaccurate estimates will ruin the organization’s reputation and could bankrupt it. </li>\r\n<li> Several engineers (and sometimes a newly-promoted or newly-hired engineering team leader or manager)  will have to cooperate closely on facets of the project, and must therefore be able to communicate openly,  freely, and in high detail. </li>\r\n</ul>\r\n<p>These two factors drive the need for improved engineering processes in a small project group. <br /> <br /> The question then is: what processes will provide the payoffs (better cost and time estimates and  efficient cooperation among engineers) without requiring too much overhead (thereby spending more  money and time than will be saved)? <br /> <br /> It is recommended that a small organization should implement lightweight, informal versions  of the following processes:</p>\r\n<ul>\r\n<li> Record user requirements, the engineering organization’s later questions about those requirements,  and subsequent resolutions of those requirements. </li>\r\n<li> Provide source control of tools, deliverables, and documentation. </li>\r\n<li> Record and track bugs. </li>\r\n<li> Record the tests that are to be run against the deliverable. </li>\r\n<li> Record the details of each test run. </li>\r\n<li> Establish standardized coding and commenting guidelines. </li>\r\n<li> Conduct peer code review. </li>\r\n</ul>\r\n<p>This is enough process to show quick payoff without too much time expenditure.   Attempting to implement more process than this too early in the maturation of an engineering organization  is likely to fail.   Individual engineers may be confused and annoyed at the imposition of too much "overhead",  and engineering leadership may not have the time to educate and enforce additional process.   Attempting to implement more processes than can be taught and enforced is a sure road to failure. <br /> <br /> Let’s look at each of those recommendations in a little more detail.   Each recommendation will be kept as separate as possible.   This way, an organization that quickly comes to agreement about how to implement any of these  suggestions can do so without having to implement them all at the same time.   This is extremely important!   The goal is to help the organization be more productive through slow and steady change, and not  to spend all your time implementing and arguing about engineering process improvements. <br /> <br /> <strong>Requirements Documentation</strong> <br /> One problem, which is not unique to small organizations, but which tends to affect them much more  than individual programmers, is incomplete communication and understanding of customer requirements.   One person talks to the customer and finds out what they want, and other people end up writing the actual code.   This results not only in cases where the first person wasn’t clearly communicating with the customer,  but cases where the engineers within the organization weren’t clearly communicating with each other. <br /> <br /> The first step towards solving this problem is to maintain a written users requirements document.   This means more than just the initial document that the first customer contact person writes  while discussing the project with the customer!   All subsequent questions and amendments should be recorded directly in the same document. There are two reasons to do this. <br /> <br /> First, at some point in your organization’s growth and maturation, you will want to be sure that  the customer cannot continually withhold payment with claims of "That wasn’t what I wanted."   Maintaining a customer requirements document means that, at some point, you can easily derive a  contract from the users requirements document, by adding some language like  "...and anything that is not specified above can be implemented in any way we like." <br /> <br /> Second, by recording the questions and amendments to customers’ requirements document,  you build a body of data that can be reviewed before future customer contacts,  so that your people know what issues to clarify in subsequent projects. <br /> <br /> Specific detail about any particular format for these customers’ requirements document will not be discussed.   It is much more important that the document be written down in full, and that subsequent questions and amendments  be written into the same document, than that the document follow any particular format. <br /> <br /> It is strongly recommend that you combine this detailed tracking of customer requirements with source control,  as discussed in the next section. <br /> <br /> <strong>Source Control of Tools, Deliverables, and Documentation</strong> <br /> One problem that crops up when multiple people cooperate on a project is that they are simultaneously  changing the files that make up the project.   This may result in cases where engineers lose each other’s changes, nobody knows which of multiple  versions of the project are the "current" one, etc.   This problem affects not only the actual deliverable product, but also internal documents and tools  used to build, test, and describe that product. <br /> <br /> It is recommend that a small organization use a simple source code control tool -  say SourceSafe for Windows or RCS for Unix - to allow engineers to more easily find (and discuss)  the versions of these files. <br /> <br /> The organization should keep a central version of the project on a server.   This central version should include all source files, internal tools, documentation, and the  fully built version of the product that corresponds exactly to the versions of those files. <br /> <br /> Each engineer should keep a local copy of the entire project on his or her own machine.   When the engineer performs some identifiable chunk of work, the engineer should build the project  on his or her own machine and check for problems.   <br /> <br /> Then he or she should warn the organization that he or she is going to be changing the central repository.   It is very important that only one engineer have the right to update the central repository at one time!   There should be a note on a central whiteboard, or a toy that gets passed around indicating the right to  change the central repository, or some such physical representation of this right.   Once the engineer gains the right to change the repository, he or she should then update their local copy of  the project with any changes that happened to the central repository while he was doing this work,  and build again and check for problems.   Then he or she should submit the changes to the central repository, build again there, and check for problems.   Once the central repository builds with no problems, the engineer should tell the organization that he or she is  done with this batch of work and relinquish the right to change the repository. <br /> <br /> Note that in this section there has been no discussion on what exactly the engineer should do to check for problems.   That is a separate issue.   It is strongly recommend that a small engineering organization be sure to separate the discussion of  source code control from the discussion of how to check for problems! <br /> <br /> The project should be arranged so those tools used to build the project and the documentation about  the project are parallel to the source files for the project.   For example, a simple project that has source files, database definition file(s) for a standard commercial  database, and some documentation, might be arranged with the following directories: <br /> <br /> MyProject/src:  a directory containing all the source files (this directory may of course have additional  structure inside it) <br /> <br /> MyProject/bin:   a directory that starts out empty, into which the executables are placed when the project is built.   (Opinions vary on whether intermediate files - object files etc. - should go into this directory or into the  source directory as the project is being built.) <br /> <br /> MyProject/doc:  a directory that contains documentation relating to the project.   This directory might have further structure to it - for example, if you have some documentation intended for  internal use only, and other documentation intended for end users, you might create a MyProject/doc/internal  directory and a MyProject/doc/external directory.   If you are recording user requirements with the rigor recommended in the previous section, there should  be a MyProject/doc/requirements directory as well. <br /> <br /> MyProject/database:  a directory containing the database-related file(s). <br /> <br /> MyProject/tools:  a directory containing tools relating to the project (test helper programs,  documentation readers, etc.) <br /> <br /> MyProject/tests:  a directory containing the tests. <br /> <br /> Someone in the organization should understand the source code control system well enough to "own"  problems with it, provide information and tools that speed up everyone’s ability to get fresh versions  of the project and build them, etc.   One tool that this person should provide is a single command that will retrieve a clean copy of any version  of the product and copy it into a clean local area on the developer’s machine.   This command might first just completely blow away anything in that local area on the developer’s machine,  or to save time it might simply blow away any built pieces (object files, executables, etc.)  and retrieve source files only.   The source code control system owner will be in the best position to decide how to do this.</p>\r\n<p><strong><br /></strong></p>\r\n<p><strong>Bug tracking</strong> <br /> Bug identification and tracking can be a controversial subject in a small organization.   On the one hand, engineers may not like it when others point out errors in their code.   (Or, to put it another way, they may worry that records of their mistakes may be used against them  in subsequent performance reviews.)   On the other hand, recording bugs helps make sure that a bug, once discovered, is not forgotten.   It’s a delicate balancing act. <br /> <br /> It is recommended that a small organization’s first efforts to track bugs should be extremely informal.   One specific way to do this might be to implement internal newsgroups for the discussion of bugs related to the project(s). <br /> <br /> So, for example, if OurCompany.com is working on a project called Project1, you might want to make two internal  newsgroups in which you can discuss issues relating to that project: <br /> <br /> oc.project1 -- for discussion relating to Project1 <br /> oc.project1.bugs -- for discussion of bugs found in Project1 <br /> <br /> A bug report might then be a message to the bugs newsgroup that looks something like this: <br /> <br /> Subject:  BUG: [jsmith] Tab order in customer-data screen is broken <br /> When you go to the Customer Data screen, click in any of the text fields, and hit the tab key repeatedly,  the order in which the fields get the keyboard focus jumps all around the screen, rather than progressing  through the screen in an orderly fashion. <br /> <br /> The subject line indicates that this is a new bug report, that the reporter thinks that jsmith is the person  who will need to fix it, and includes a short description of the bug. <br /> <br /> Discussion of the bug ticket should be done with the ‘reply’ mechanism, so that the discussion of each bug  is segregated into its own thread. <br /> <br /> Then, when jsmith fixes the bug, he should reply to a message in this bug thread and change the subject line: <br /> <br /> Subject:  FIX: [jsmith]  Tab order in customer-data screen is broken <br /> I found and fixed the problem.  See MyProject/src/customer/foo.asp.   The fix is in the central repository as of 2pm today. <br /> <br /> By using the subject field this way, the discussion of a bug will look like this: <br /> Mary Jones    BUG: [jsmith] Tab order in customer-data screen is broken<br /> John Smith    :Re: BUG: [jsmith] Tab order in customer-data screen is broken<br /> Mary Jones    Re: Re: BUG: [jsmith] Tab order in customer-data screen is broken<br /> John Smith    FIX: [jsmith] Tab order in customer-data screen is broken <br /> <br /> Anyone reading these discussions can easily see which bugs have been fixed and which ones haven’t. <br /> <br /> It is predicted that, some time after the organization is trained to use internal newsgroups  this way, people will want to answer additional questions about bugs:</p>\r\n<ul>\r\n<li> How many bugs are open against the current project? </li>\r\n<li> What bug should I be working on first? </li>\r\n<li> Did John Smith’s fix to this bug really fix the problem? </li>\r\n<li> How many bugs have we been finding against this project, both now and at various times in the past? </li>\r\n</ul>\r\n<p>Be aware that a commercial bug-tracking system will make it easier to answer those questions - but at some cost.   Everyone in the organization has to be consistent in how they report and track bugs.   It often takes a little longer to report, comment on, and move bugs around in the system than with this newsgroup method.   So it is recommended that you wait until you are sure you are spending too much time manually sifting through  newsgroup discussions before you go looking for a commercial bug-tracking solution. By the time you know you are ready for a commercial bug tracking system, you will know how to identify one that  suits your needs (or at least how to start looking). <br /> <br /> <strong>Written Test Scripts and Test Automation</strong> <br /> Finding bugs often begins as a time-consuming and haphazard process.   The easiest (and, in some ways, best) way to find bugs is to have someone use the program exactly as your end users will. Each engineer should run the product in his or her own area after making any significant changes before  committing the results to the central repository.  Engineering organizations soon learn that testing is a costly but unavoidable part of the process.   You must do a lot of testing because usually your organization does not fully appreciate  how "interconnected" everything in the product is.   Changes made in one directory or module may not seem to have effects elsewhere, when they actually do.   Unexpected inter-relationships among modules may result in bugs popping up in unexpected places. <br /> <br /> An organization’s first response should be to have a periodic review of the version of the product in the  central repository, where engineers (and maybe even other people in the organization) play around with  the product in order to find and report bugs. <br /> <br /> After you go through this stage a few times, you will probably notice that "coverage" is haphazard.   Bugs can lurk around for quite a while before being discovered.   The same testing tasks may be repeated many times before other tasks are attempted the first time. <br /> <br /> One way to make this "manual" testing effort more efficient and effective is to write down "scripts"  that are to be periodically executed against the software.   These test scripts should be placed under source code control, just like any other file associated with the project.   The test script should be written in plain English such that someone who is computer-aware but not necessarily  a developer can understand and carry it out. <br /> <br /> For example, consider a simple web page where there are two fields and an "OK" button.   The intention is that the users will type a number into each of the text fields and then hit the "OK" button.   This should cause another page, which says "the sum of your numbers is (whatever)", to load. <br /> <br /> The test script might start out like this: <br /> 1. For each of the following combinations below, enter the first string in the first field, and then  the second string in the second field, and then click OK.  Make sure that the next page shows the correct sum. <br /> a. 3   1<br /> b. 1.2   3.<br /> c. .3   0.2<br /> d. -4   -.3 <br /> <br /> 2. For each of the following combinations below, enter the first string in the first field, and then  the second string in the second field, and then hit OK.  Make sure that an error dialog comes up saying  "Illegal value" and that you can dismiss that error dialog by hitting its OK button. <br /> a.  a   3.0<br /> b. 1.2  #<br /> c. 0   ‘<br /> d. --4   2<br /> e. 3   3..<br /> f. (blank)   4.0<br /> g. 2.1   (blank)<br /> h. (blank)   (blank) <br /> <br /> It might then go on to include test cases for more complicated cases, tab ordering, hitting forward and  back on the browser, etc. <br /> <br /> There are many reasons to produce and use test scripts like this:</p>\r\n<ul>\r\n<li> Written test scripts can be reviewed for ideas that can apply to other test scripts. </li>\r\n<li> Multiple people can more easily discuss and cooperate in testing when a significant portion of the test work  is written down. </li>\r\n<li> Members of your organization who are not programmers can run test scripts and learn how  to write very good test scripts. </li>\r\n</ul>\r\n<p>Note that even when you have test scripts, you should encourage people to do some "free play" with the  product during test cycles.  Encourage people to keep some kind of record of what they’re doing.   Then bugs that are discovered can be more readily reproduced and isolated, and the techniques used  to uncover those bugs can make their way into subsequent versions of test scripts.   "Free play" testing is very valuable. <br /> <br /> After the organization has produced good test scripts and developed the habit of performing periodic tests,  it will become evident that some (or many) of the tests had great value in their first few iterations,  but are much less likely to actually discover bugs later.   You can decrease the rate at which you run those tests, so as not to spend more time (and money)  running those tests than they’re worth.  Another way to attack this problem is by automating those tests. <br /> <br /> Test automation is a fairly sophisticated technique.   It is strongly suggested that your organization go through a few projects with increasingly rigorous  manual test scripts before you embark on any kind of significant test automation plan.   You need to understand many things about your engineering process before you can make a good decision  about test automation. <br /> <br /> It is suggested at this point that, when the time comes to consider test automation,  you think along the lines of purchasing a commercial capture-and-playback test automation tool  (like Segue’s QAPartner/SilkTest package) to automate the rigorous manual test scripts that you have developed.   By the time it is a good business idea to do this test automation, you will recognize the need and  will have had plenty of practice with engineering process improvement.  Do your test automation slowly and carefully! <br /> <br /> <strong>Written Test Results</strong> <br /> Each time someone carries out a test script, or performs some free form testing, he or she should write down  what script was run, what version of the product it was run against, and what the results were.   If you have implemented the simple newsgroup model discussed above, then a test results report might  look something like this: <br /> <br /> Newsgroup: oc.project1<br /> Subject: Test Results - User Data Script 5/13/00 vs. Project1 v1.2.63 <br /> <br /> I ran the User Data script dated 5/13/00 on Project1 version 1.2.63 (the version in the central repository  as of today at 3pm). <br /> <br /> All tests passed except 2c. (the single quote test).    I checked the bugs newsgroup and saw that there is an open bug on this already so I didn’t file a new one. <br /> <br /> Note the distinction between the test script and the test results report.   The script should be submitted to the central repository and versioned the same as source code.   The test results reports can be sent to the project newsgroup. <br /> <br /> These test results reports help engineers reproduce and isolate bugs by eliminating any possible confusion  over when a particular bug was first discovered. <br /> <br /> <strong>Coding and Commenting Guidelines</strong> <br /> Standardized guidelines ensure that code and documentation is uniform in appearance, concept, and presentation,  regardless of who actually does the programming.  In addition, guidelines truly add professionalism to the coding process. <br /> <br /> A set of coding guidelines should be defined for all of the computer languages and technologies that are used inhouse.  It is recommended that the guidelines be arrived at by mutual agreement with all the programmers.  Equally important, is a standardized format for commenting code. Indeed, uncommented code could prove to be a potential financial liability in the future,  while properly commented code will make it easier for developers   to become acquainted with legacy code or code created by other programmers. <br /> <br /> For development environments/languages that offer it,  automated formatting tools can be purchased to help in the application of the standards.   <br /> <br /> <strong>Code Reviews</strong> <br /> It is recommended that code reviews be performed immediately after each significant program module  or function is created.  Ideally, two reviewers should peruse the code independently.  At a minimum, the reviewers should examine the code with respect to:</p>\r\n<ul>\r\n<li> The code must adhere to the coding and comments guidelines. </li>\r\n<li> The code must be clear and understandable. </li>\r\n<li> The code must be efficient and logical. </li>\r\n</ul>\r\n<p>Next, they should meet with the developer to discuss the code and recommend changes.    Such a meeting should stress both the positive and problematic aspects of the code.  All of the agreed upon changes, if any, should be documented.  The developer should then implement the changes and this should then be verified by either one of the  reviewers or a third person.   Finally, the review case is marked closed.   <br /> <br /> As you can gather, the code review process is essentialy treated in the same way as bug reports.  Issues should be properly documented, they should be marked complete once they have been addressed,  and the product should not ship until all matters have been addressed.  <br /> <br /> <strong>Conclusion</strong> <br /> These are the steps that are recommended for a small engineering organization to take in order to make the  difficult transition from individual effort to collaborative effort.   These recommendations have been casted as informally as possible.   It is critical that, for each process improvement, the first step be sufficiently small that you don’t  end up with the organization in an uproar about how exactly to go about implementing the process improvement!   Remember, each of these steps is an attempt to improve the ease with which people can cooperate at their actual work.   None of these processes should grow to dominate over the actual work of designing, implementing, debugging,  and shipping the actual product. <br /> <br /> The <strong>Guru</strong> wishes to thank <strong>J. Michael Hammond</strong> for this article.</p>', '', 1, 1, 0, 1, '2009-10-16 13:16:51', 62, '', '2009-11-26 15:47:55', 62, 0, '0000-00-00 00:00:00', '2009-10-16 13:16:51', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 2, 0, 3, '', '', 0, 7, 'robots=\nauthor='),
(47, 'Users, profiles and pass', 'users-profiles-and-pass', '', '<p>Test users:</p>\r\n<p>Profile Administrator: aalsina:aalsina</p>\r\n<p>Profile Part_administrator: ssaborit:ssaborit</p>\r\n<p>Group Leaders: fazorin:fazorin, jcasanova:jcasanova, cgonzalez:cgonzalez</p>\r\n<p>Reader: mcorominas:mcorominas</p>\r\n<p>Para la aplicación de PhD:</p>\r\n<p>Con perfil <strong>Administrator</strong>: phdadmin, phdadmin2</p>\r\n<p>Con perfil <strong>Group Leader</strong>: mmp, onco, cadb, camp, sacb</p>\r\n<p>Con perfil <strong>Committe</strong>: com1, com2</p>\r\n<p>Con perfil <strong>Applicant</strong>: test1, test2, test3</p>\r\n<p> </p>\r\n<p>{password pass="password" text="Please enter a password to read the content"}</p>', '', 1, 1, 0, 1, '2009-11-26 15:48:02', 62, '', '2011-05-17 06:54:56', 62, 0, '0000-00-00 00:00:00', '2009-11-26 15:48:02', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 7, 0, 1, '', '', 0, 0, 'robots=\nauthor='),
(48, 'Test Collaboration', 'test-collaboration', '', '<table style="width: 100%;" border="0">\r\n<tbody>\r\n<tr>\r\n<td><strong>Profile Administrator: </strong></td>\r\n<td></td>\r\n<td></td>\r\n</tr>\r\n<tr style="text-align: center;">\r\n<td style="text-align: left;">View Table Collaboration</td>\r\n<td style="text-align: left;"><em> comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Edit Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>NOTAS</td>\r\n<td colspan="2">COLLABORATION_DELETE_OK label, de donde sale???</td>\r\n</tr>\r\n<tr>\r\n<td style="background-color: #c0c0c0;" colspan="3"><br /></td>\r\n</tr>\r\n<tr>\r\n<td><strong>Profile Part_administrator: (Reader)</strong></td>\r\n<td></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td>View Table Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Edit Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Add Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Detail Collaboration</td>\r\n<td>-</td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>NOTAS</td>\r\n<td colspan="2">COLLABORATION_DELETE_KO ????<br /></td>\r\n</tr>\r\n<tr>\r\n<td style="background-color: #c0c0c0;" colspan="3"><br /></td>\r\n</tr>\r\n<tr>\r\n<td><strong>Group Leaders:<br /></strong></td>\r\n<td><strong>(Only own)</strong></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td>View Table Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Edit Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>NOTAS</td>\r\n<td colspan="2"><br /></td>\r\n</tr>\r\n<tr>\r\n<td style="background-color: #c0c0c0;" colspan="3"><br /></td>\r\n</tr>\r\n<tr>\r\n<td><strong>Reader:</strong></td>\r\n<td></td>\r\n<td></td>\r\n</tr>\r\n<tr>\r\n<td>View Table Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Add Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Edit Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">SI</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Add Detail Collaboration</td>\r\n<td><em>comprobado</em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>Delete Detail Collaboration</td>\r\n<td><em>-<br /></em></td>\r\n<td style="text-align: center;">NO</td>\r\n</tr>\r\n<tr>\r\n<td>NOTAS</td>\r\n<td colspan="2"><br /></td>\r\n</tr>\r\n<tr>\r\n<td style="background-color: #c0c0c0;" colspan="3"><br /></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<p><br />Microsoft Explorer-&gt; Mas o menos es correcto, pero los titulos Collaboration details form y Collaboration data casi no se ven ! (estan en blanco)<br /><br />link edit<br />index.php?option=com_science&amp;view=collaboration&amp;id=6&amp;Itemid=64<br /><br />link delete<br />index.php?option=com_science&amp;controller=collaborations&amp;task=delete&amp;id=5&amp;Itemid=64</p>\r\n<p> </p>\r\n<p>NOTA General, la estetica no flipa!</p>', '', 1, 1, 0, 1, '2009-12-16 18:59:15', 62, '', '2009-12-16 19:22:22', 62, 0, '0000-00-00 00:00:00', '2009-12-16 18:59:15', '0000-00-00 00:00:00', '', '', 'show_title=\nlink_titles=\nshow_intro=\nshow_section=\nlink_section=\nshow_category=\nlink_category=\nshow_vote=\nshow_author=\nshow_create_date=\nshow_modify_date=\nshow_pdf_icon=\nshow_print_icon=\nshow_email_icon=\nlanguage=\nkeyref=\nreadmore=', 10, 0, 2, '', '', 0, 0, 'robots=\nauthor=');

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_frontpage`
--

CREATE TABLE IF NOT EXISTS `jos_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_content_frontpage`
--

INSERT INTO `jos_content_frontpage` (`content_id`, `ordering`) VALUES
(46, 3),
(47, 1),
(48, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_content_rating`
--

CREATE TABLE IF NOT EXISTS `jos_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(11) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(11) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_value` varchar(240) NOT NULL DEFAULT '0',
  `value` varchar(240) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_section_value_value_aro` (`section_value`(100),`value`(100)),
  KEY `jos_gacl_hidden_aro` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `jos_core_acl_aro`
--

INSERT INTO `jos_core_acl_aro` (`id`, `section_value`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', '62', 0, 'Administrator', 0),
(11, 'users', '63', 0, 'Anna Alsina', 0),
(12, 'users', '64', 0, 'Sonia Saborit', 0),
(13, 'users', '65', 0, 'Ferran Azorin', 0),
(14, 'users', '66', 0, 'Margarida Corominas', 0),
(15, 'users', '67', 0, 'Test1', 0),
(16, 'users', '68', 0, 'Test2', 0),
(17, 'users', '69', 0, 'Test3', 0),
(18, 'users', '70', 0, 'Jordi Casanova', 0),
(19, 'users', '71', 0, 'cgonzalez', 0),
(20, 'users', '72', 0, 'Roberto Bartolomé', 0),
(21, 'users', '73', 0, 'Roberto', 0),
(22, 'users', '74', 0, 'phdadmin', 0),
(23, 'users', '75', 0, 'phdadmin2', 0),
(24, 'users', '76', 0, 'cadb', 0),
(25, 'users', '77', 0, 'mmp', 0),
(26, 'users', '78', 0, 'onco', 0),
(27, 'users', '79', 0, 'camp', 0),
(28, 'users', '80', 0, 'sacb', 0),
(29, 'users', '81', 0, 'com1', 0),
(30, 'users', '82', 0, 'com2', 0),
(31, 'users', '83', 0, 'pepelu', 0),
(32, 'users', '84', 0, 'test11', 0),
(33, 'users', '85', 0, 'ccaelles', 0),
(34, 'users', '86', 0, 'acelada', 0),
(35, 'users', '87', 0, 'Clara Caminal', 0),
(36, 'users', '88', 0, 'Cristina Horcajada', 0),
(37, 'users', '89', 0, 'flozano', 0),
(38, 'users', '90', 0, 'Test5', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_groups`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `jos_gacl_parent_id_aro_groups` (`parent_id`),
  KEY `jos_gacl_lft_rgt_aro_groups` (`lft`,`rgt`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `jos_core_acl_aro_groups`
--

INSERT INTO `jos_core_acl_aro_groups` (`id`, `parent_id`, `name`, `lft`, `rgt`, `value`) VALUES
(17, 0, 'ROOT', 1, 22, 'ROOT'),
(28, 17, 'USERS', 2, 21, 'USERS'),
(29, 28, 'Public Frontend', 3, 12, 'Public Frontend'),
(18, 29, 'Registered', 4, 11, 'Registered'),
(19, 18, 'Author', 5, 10, 'Author'),
(20, 19, 'Editor', 6, 9, 'Editor'),
(21, 20, 'Publisher', 7, 8, 'Publisher'),
(30, 28, 'Public Backend', 13, 20, 'Public Backend'),
(23, 30, 'Manager', 14, 19, 'Manager'),
(24, 23, 'Administrator', 15, 18, 'Administrator'),
(25, 24, 'Super Administrator', 16, 17, 'Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_map` (
  `acl_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(230) NOT NULL DEFAULT '0',
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`acl_id`,`section_value`,`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_aro_sections`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_aro_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(230) NOT NULL DEFAULT '',
  `order_value` int(11) NOT NULL DEFAULT '0',
  `name` varchar(230) NOT NULL DEFAULT '',
  `hidden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `jos_gacl_value_aro_sections` (`value`),
  KEY `jos_gacl_hidden_aro_sections` (`hidden`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_core_acl_aro_sections`
--

INSERT INTO `jos_core_acl_aro_sections` (`id`, `value`, `order_value`, `name`, `hidden`) VALUES
(10, 'users', 1, 'Users', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_acl_groups_aro_map`
--

CREATE TABLE IF NOT EXISTS `jos_core_acl_groups_aro_map` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `section_value` varchar(240) NOT NULL DEFAULT '',
  `aro_id` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `group_id_aro_id_groups_aro_map` (`group_id`,`section_value`,`aro_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_core_acl_groups_aro_map`
--

INSERT INTO `jos_core_acl_groups_aro_map` (`group_id`, `section_value`, `aro_id`) VALUES
(18, '', 11),
(18, '', 12),
(18, '', 13),
(18, '', 14),
(18, '', 15),
(18, '', 16),
(18, '', 17),
(18, '', 18),
(18, '', 19),
(18, '', 20),
(18, '', 21),
(18, '', 22),
(18, '', 23),
(18, '', 24),
(18, '', 25),
(18, '', 26),
(18, '', 27),
(18, '', 28),
(18, '', 29),
(18, '', 30),
(18, '', 31),
(18, '', 32),
(18, '', 33),
(18, '', 34),
(18, '', 35),
(18, '', 36),
(18, '', 37),
(18, '', 38),
(25, '', 10);

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_items`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_items` (
  `time_stamp` date NOT NULL DEFAULT '0000-00-00',
  `item_table` varchar(50) NOT NULL DEFAULT '',
  `item_id` int(11) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_core_log_searches`
--

CREATE TABLE IF NOT EXISTS `jos_core_log_searches` (
  `search_term` varchar(128) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_groups`
--

CREATE TABLE IF NOT EXISTS `jos_groups` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_groups`
--

INSERT INTO `jos_groups` (`id`, `name`) VALUES
(0, 'Public'),
(1, 'Registered'),
(2, 'Special');

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu`
--

CREATE TABLE IF NOT EXISTS `jos_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text,
  `type` varchar(50) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `parent` int(11) unsigned NOT NULL DEFAULT '0',
  `componentid` int(11) unsigned NOT NULL DEFAULT '0',
  `sublevel` int(11) DEFAULT '0',
  `ordering` int(11) DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pollid` int(11) NOT NULL DEFAULT '0',
  `browserNav` tinyint(4) DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `utaccess` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  `lft` int(11) unsigned NOT NULL DEFAULT '0',
  `rgt` int(11) unsigned NOT NULL DEFAULT '0',
  `home` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `componentid` (`componentid`,`menutype`,`published`,`access`),
  KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- Dumping data for table `jos_menu`
--

INSERT INTO `jos_menu` (`id`, `menutype`, `name`, `alias`, `link`, `type`, `published`, `parent`, `componentid`, `sublevel`, `ordering`, `checked_out`, `checked_out_time`, `pollid`, `browserNav`, `access`, `utaccess`, `params`, `lft`, `rgt`, `home`) VALUES
(1, 'mainmenu', 'Home', 'home', 'index.php?option=com_content&view=frontpage', 'component', 1, 0, 20, 0, 7, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'num_leading_articles=1\nnum_intro_articles=4\nnum_columns=1\nnum_links=4\norderby_pri=\norderby_sec=order\nmulti_column_order=1\nshow_pagination=2\nshow_pagination_results=1\nshow_feed_link=1\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=Welcome to the Frontpage\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 1),
(2, 'mainmenu', 'Joomla! License', 'joomla-license', 'index.php?option=com_content&view=article&id=5', 'component', 0, 0, 20, 0, 9, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(41, 'mainmenu', 'FAQ', 'faq', 'index.php?option=com_content&view=section&id=3', 'component', 0, 0, 20, 0, 11, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\nshow_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby=\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1', 0, 0, 0),
(18, 'topmenu', 'News', 'news', 'index.php?option=com_newsfeeds&view=newsfeed&id=1&feedid=1', 'component', -2, 0, 11, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 3, 'show_page_title=1\npage_title=News\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_other_cats=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 0, 0, 0),
(20, 'usermenu', 'Your Details', 'your-details', 'index.php?option=com_user&view=user&task=edit', 'component', 1, 0, 14, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(24, 'usermenu', 'Logout', 'logout', 'index.php?option=com_user&view=login', 'component', 1, 0, 14, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 1, 3, '', 0, 0, 0),
(27, 'mainmenu', 'Joomla! Overview', 'joomla-overview', 'index.php?option=com_content&view=article&id=19', 'component', 0, 0, 20, 0, 8, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(28, 'topmenu', 'Testing', 'testing', 'index.php?option=com_content&view=article&id=46', 'component', 1, 0, 20, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_noauth=0\nshow_title=\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\nfeed_summary=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(29, 'topmenu', 'Features', 'features', 'index.php?option=com_content&view=article&id=22', 'component', -2, 0, 20, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(30, 'topmenu', 'The Community', 'the-community', 'index.php?option=com_content&view=article&id=27', 'component', -2, 0, 20, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(34, 'mainmenu', 'What''s New in 1.5?', 'what-is-new-in-1-5', 'index.php?option=com_content&view=article&id=22', 'component', 0, 27, 20, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'pageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(37, 'mainmenu', 'More about Joomla!', 'more-about-joomla', 'index.php?option=com_content&view=section&id=4', 'component', 0, 0, 20, 0, 10, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\nshow_description=0\nshow_description_image=0\nshow_categories=1\nshow_empty_categories=0\nshow_cat_num_articles=1\nshow_category_description=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby=\nshow_noauth=0\nshow_title=1\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1', 0, 0, 0),
(48, 'mainmenu', 'Web Links', 'web-links', 'index.php?option=com_weblinks&view=categories', 'component', 0, 0, 4, 0, 13, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=Weblinks\nimage=-1\nimage_align=right\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_comp_description=1\ncomp_description=\nshow_link_hits=1\nshow_link_description=1\nshow_other_cats=1\nshow_headings=1\nshow_page_title=1\nlink_target=0\nlink_icons=\n\n', 0, 0, 0),
(49, 'mainmenu', 'News Feeds', 'news-feeds', 'index.php?option=com_newsfeeds&view=categories', 'component', 0, 0, 11, 0, 14, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=Newsfeeds\nshow_comp_description=1\ncomp_description=\nimage=-1\nimage_align=right\npageclass_sfx=\nmenu_image=-1\nsecure=0\nshow_headings=1\nshow_name=1\nshow_articles=1\nshow_link=1\nshow_other_cats=1\nshow_cat_description=1\nshow_cat_items=1\nshow_feed_image=1\nshow_feed_description=1\nshow_item_description=1\nfeed_word_count=0\n\n', 0, 0, 0),
(50, 'mainmenu', 'The News', 'the-news', 'index.php?option=com_content&view=category&layout=blog&id=1', 'component', 0, 0, 20, 0, 12, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_page_title=1\npage_title=The News\nshow_description=0\nshow_description_image=0\nnum_leading_articles=1\nnum_intro_articles=4\nnum_columns=2\nnum_links=4\nshow_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\norderby_pri=\norderby_sec=\nshow_pagination=2\nshow_pagination_results=1\nshow_noauth=0\nlink_titles=0\nshow_intro=1\nshow_section=0\nlink_section=0\nshow_category=0\nlink_category=0\nshow_author=1\nshow_create_date=1\nshow_modify_date=1\nshow_item_navigation=0\nshow_readmore=1\nshow_vote=0\nshow_icons=1\nshow_pdf_icon=1\nshow_print_icon=1\nshow_email_icon=1\nshow_hits=1\n\n', 0, 0, 0),
(51, 'usermenu', 'Submit an Article', 'submit-an-article', 'index.php?option=com_content&view=article&layout=form', 'component', 1, 0, 20, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 2, 0, '', 0, 0, 0),
(52, 'usermenu', 'Submit a Web Link', 'submit-a-web-link', 'index.php?option=com_weblinks&view=weblink&layout=form', 'component', 1, 0, 4, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 2, 0, '', 0, 0, 0),
(54, 'mainmenu', 'Theses', 'theses', 'index.php?option=com_science&view=theses', 'component', -2, 0, 34, 0, 6, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(58, 'mainmenu', 'IRBGoogle', 'irbgoogle', 'index.php?option=com_irbgoogle&view=irbgoogle', 'component', -2, 0, 36, 0, 4, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(59, 'mainmenu', 'IRBGoogle to view', 'irbgoogle-to-view', 'index.php?option=com_irbgoogle&view=default', 'url', -2, 0, 0, 0, 5, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(62, 'mainmenu', 'IRB Google', 'irb-google', 'index.php?option=com_irbgoogle&view=default', 'component', -2, 0, 36, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'google_domain=\ngoogle_user=\ngoogle_password=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(74, 'phd', 'Applicants', 'applicants', 'index.php?option=com_phd&view=applicants', 'component', 1, 0, 41, 0, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_comp_description=\ncomp_description=\nshow_link_hits=\nshow_link_description=\nshow_other_cats=\nshow_headings=\ntarget=\nlink_icons=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(75, 'mainmenu', 'PhD application', 'phd-application', '', 'separator', 1, 0, 0, 0, 15, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(76, 'mainmenu', 'Applicants list', 'applicants-list', 'index.php?option=com_phd&view=applicants', 'component', 1, 75, 41, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_comp_description=\ncomp_description=\nshow_link_hits=\nshow_link_description=\nshow_other_cats=\nshow_headings=\ntarget=\nlink_icons=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(77, 'phd', 'Aplication form', 'aplication-form', 'index.php?option=com_phd&view=applicant', 'component', 1, 0, 41, 0, 2, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'phdConfig_AdminName=\nphdConfig_AdminEmail=\nphdConfig_ClosingDateTime=\nphdConfig_LimitAge=30\nphdConfig_Programme=\nphdConfig_DocsPath=/docs_phd/\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(78, 'mainmenu', 'Aplication form', 'aplication-form', 'index.php?option=com_phd&view=applicant', 'component', 1, 75, 41, 1, 2, 62, '2010-07-09 15:46:28', 0, 0, 0, 0, 'phdConfig_AdminName=\nphdConfig_AdminEmail=\nphdConfig_ClosingDateTime=\nphdConfig_LimitAge=30\nphdConfig_Programme=\nphdConfig_DocsPath=/docs_phd/\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(80, 'mainmenu', 'Scientific Production', 'scientific-production', '', 'separator', -2, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(81, 'mainmenu', 'Publications', 'publications', 'index.php?option=com_science&view=publications', 'component', -2, 0, 43, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(82, 'mainmenu', 'Collaborations', 'collaborations', 'index.php?option=com_science&view=collaborations', 'component', -2, 0, 43, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(83, 'mainmenu', 'Projects', 'projects', 'index.php?option=com_science&view=projects', 'component', -2, 0, 43, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(84, 'mainmenu', 'Theses', 'theses', 'index.php?option=com_science&view=theses', 'component', -2, 0, 43, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(85, 'mainmenu', 'Patents', 'patents', 'index.php?option=com_science&view=patents', 'component', -2, 0, 43, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(86, 'mainmenu', 'Awards', 'awards', 'index.php?option=com_science&view=awards', 'component', -2, 0, 43, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(87, 'mainmenu', 'Reports', 'reports', 'index.php?option=com_science&view=reports', 'component', -2, 0, 43, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'send_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(88, 'mainmenu', 'Congresses', 'congresses', '', 'separator', -2, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(89, 'mainmenu', 'Registrations', 'registrations', 'index.php?option=com_register&view=registrations', 'component', -2, 0, 46, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'id_congress=1\ndisplay_title=0\ndisplay_paid=1\ndisplay_registration_type=1\ndisplay_pdf_button=1\ndisplay_registration_date=1\nshow_comp_description=\ncomp_description=\nshow_link_hits=\nshow_link_description=\nshow_other_cats=\nshow_headings=\ntarget=\nlink_icons=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(90, 'mainmenu', 'Papers', 'papers', 'index.php?option=com_register&view=papers', 'component', -2, 0, 46, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'display_sessions=1\ndisplay_paper_type=1\ndisplay_filename=1\nshow_comp_description=\ncomp_description=\nshow_link_hits=\nshow_link_description=\nshow_other_cats=\nshow_headings=\ntarget=\nlink_icons=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(91, 'mainmenu', 'Publications 2', 'publications-2', 'index.php?option=com_science&view=publications', 'component', -2, 0, 43, 0, 3, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'scienceConfig_ImpactFactorStartYear=2008\nscienceConfig_ImpactFactorEndtYear=2028\nsend_emails=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(92, 'mainmenu', 'IRB Tools', 'irb-tools', '', 'separator', -2, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(93, 'mainmenu', 'Gmail', 'gmail', 'index.php?option=com_irbtools&view=gmail', 'component', -2, 0, 63, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'irbtoolsConfig_GoogleDomain=\nirbtoolsConfig_GoogleUser=\nirbtoolsConfig_GooglePass=\nirbtoolsConfig_Lista1=\nirbtoolsConfig_Lista2=\nirbtoolsConfig_Lista3=\nirbtoolsConfig_Lista4=\nirbtoolsConfig_Lista5=\nirbtoolsConfig_Lista6=\nirbtoolsConfig_Lista7=\nirbtoolsConfig_Lista8=\nirbtoolsConfig_Lista9=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(94, 'mainmenu', 'Exceptions', 'exceptions', 'index.php?option=com_irbtools&view=exceptions', 'component', -2, 0, 70, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'irbtoolsConfig_GoogleDomain=\nirbtoolsConfig_GoogleUser=\nirbtoolsConfig_GooglePass=\nirbtoolsConfig_Lista1=\nirbtoolsConfig_Lista2=\nirbtoolsConfig_Lista3=\nirbtoolsConfig_Lista4=\nirbtoolsConfig_Lista5=\nirbtoolsConfig_Lista6=\nirbtoolsConfig_Lista7=\nirbtoolsConfig_Lista8=\nirbtoolsConfig_Lista9=\nirbtoolsConfig_EmailSubject=\nirbtoolsConfig_EmailBody=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(95, 'mainmenu', 'Send file to Biko', 'send-file-to-biko', 'index.php?option=com_irbtools&view=filemanager', 'component', -2, 0, 70, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'irbtoolsConfig_GoogleDomain=\nirbtoolsConfig_GoogleUser=\nirbtoolsConfig_GooglePass=\nirbtoolsConfig_Lista1=\nirbtoolsConfig_Lista2=\nirbtoolsConfig_Lista3=\nirbtoolsConfig_Lista4=\nirbtoolsConfig_Lista5=\nirbtoolsConfig_Lista6=\nirbtoolsConfig_Lista7=\nirbtoolsConfig_Lista8=\nirbtoolsConfig_Lista9=\nirbtoolsConfig_EmailSubject=\nirbtoolsConfig_EmailBody=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(96, 'mainmenu', 'Layar', 'layar', '', 'separator', -2, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'menu_image=-1\n\n', 0, 0, 0),
(97, 'mainmenu', 'POIs Layar', 'pois-layar', 'index.php?option=com_layar&view=pois', 'component', -2, 0, 75, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'page_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(98, 'mainmenu', 'Private files', 'private-files', 'index.php?option=com_irbtools&view=privatefiles', 'component', -2, 0, 70, 1, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'irbtoolsConfig_GoogleDomain=\nirbtoolsConfig_GoogleUser=\nirbtoolsConfig_GooglePass=\nirbtoolsConfig_Lista1=\nirbtoolsConfig_Lista2=\nirbtoolsConfig_Lista3=\nirbtoolsConfig_Lista4=\nirbtoolsConfig_Lista5=\nirbtoolsConfig_Lista6=\nirbtoolsConfig_Lista7=\nirbtoolsConfig_Lista8=\nirbtoolsConfig_Lista9=\nirbtoolsConfig_EmailSubject=\nirbtoolsConfig_EmailBody=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(99, 'mainmenu', 'Reservas', 'reservas', 'index.php?option=com_bookit&view=bookit', 'component', -2, 0, 78, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'show_year_calendar=0\ncal_cols=3\ncal_rows=4\nmonths_ahead=12\nshow_calendar=1\nmax_adult=4\nmax_child=4\nmax_stay=30\nmin_stay=1\nstart_day=-1\nend_day=-1\ndateformat=\ncurrency=\nwidth=96\nheight=96\nextra_availability=Other\navailable_color=#CCFFCC\nbooked_color=#FF6666\npending_color=#FFCC66\nother_color=#CCCCFF\nshow_available=\nshow_booked=\nshow_pending=\nshow_extra=\nshow_coupons=\ndeposit_percent=0\ndeposit_fixed=0\nterms_conditions=\ncancellation_policy=\nform_msg=\ncontact_details=\nmail_request=\nemail_logo=\npaypal_mail=\nchargeperguest=\nco_id=\npayment_return=\npayment_cancel=\npaypal_in_mail=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(100, 'mainmenu', 'Holidays', 'holidays', 'index.php?option=com_irbtools&view=holidays', 'component', -2, 0, 70, 1, 1, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'irbtoolsConfig_InstallUrl=https://joomlavui.svn.sourceforge.net/svnroot/joomlavui/trunk/\nirbtoolsConfig_GoogleDomain=\nirbtoolsConfig_GoogleUser=\nirbtoolsConfig_GooglePass=\nirbtoolsConfig_Lista1=\nirbtoolsConfig_Lista2=\nirbtoolsConfig_Lista3=\nirbtoolsConfig_Lista4=\nirbtoolsConfig_Lista5=\nirbtoolsConfig_Lista6=\nirbtoolsConfig_Lista7=\nirbtoolsConfig_Lista8=\nirbtoolsConfig_Lista9=\nirbtoolsConfig_EmailSubject=\nirbtoolsConfig_EmailBody=\nirbtoolsConfig_Panic=\nirbtoolsConfig_PrivateFilesFolder=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0),
(101, 'mainmenu', 'Holidays', 'holidays', 'index.php?option=com_irbtools&view=holidays', 'component', -2, 0, 70, 0, 0, 0, '0000-00-00 00:00:00', 0, 0, 0, 0, 'irbtoolsConfig_InstallUrl=https://joomlavui.svn.sourceforge.net/svnroot/joomlavui/trunk/\nirbtoolsConfig_GoogleDomain=\nirbtoolsConfig_GoogleUser=\nirbtoolsConfig_GooglePass=\nirbtoolsConfig_Lista1=\nirbtoolsConfig_Lista2=\nirbtoolsConfig_Lista3=\nirbtoolsConfig_Lista4=\nirbtoolsConfig_Lista5=\nirbtoolsConfig_Lista6=\nirbtoolsConfig_Lista7=\nirbtoolsConfig_Lista8=\nirbtoolsConfig_Lista9=\nirbtoolsConfig_EmailSubject=\nirbtoolsConfig_EmailBody=\nirbtoolsConfig_Panic=\nirbtoolsConfig_PrivateFilesFolder=\npage_title=\nshow_page_title=1\npageclass_sfx=\nmenu_image=-1\nsecure=0\n\n', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_menu_types`
--

CREATE TABLE IF NOT EXISTS `jos_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menutype` varchar(75) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `menutype` (`menutype`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_menu_types`
--

INSERT INTO `jos_menu_types` (`id`, `menutype`, `title`, `description`) VALUES
(1, 'mainmenu', 'Main Menu', 'The main menu for the site'),
(2, 'usermenu', 'User Menu', 'A Menu for logged in Users'),
(3, 'topmenu', 'Top Menu', 'Top level navigation'),
(9, 'phd', 'PhD menu', '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages`
--

CREATE TABLE IF NOT EXISTS `jos_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` int(11) NOT NULL DEFAULT '0',
  `priority` int(1) unsigned NOT NULL DEFAULT '0',
  `subject` text NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_messages_cfg`
--

CREATE TABLE IF NOT EXISTS `jos_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) NOT NULL DEFAULT '',
  `cfg_value` varchar(255) NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_migration_backlinks`
--

CREATE TABLE IF NOT EXISTS `jos_migration_backlinks` (
  `itemid` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `url` text NOT NULL,
  `sefurl` text NOT NULL,
  `newurl` text NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules`
--

CREATE TABLE IF NOT EXISTS `jos_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) DEFAULT NULL,
  `numnews` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  `iscore` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `control` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=50 ;

--
-- Dumping data for table `jos_modules`
--

INSERT INTO `jos_modules` (`id`, `title`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `published`, `module`, `numnews`, `access`, `showtitle`, `params`, `iscore`, `client_id`, `control`) VALUES
(1, 'Main Menu', '', 4, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=mainmenu\nmoduleclass_sfx=_menu\n', 1, 0, ''),
(2, 'Login', '', 1, 'login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, '', 1, 1, ''),
(3, 'Popular', '', 3, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_popular', 0, 2, 1, '', 0, 1, ''),
(4, 'Recent added Articles', '', 4, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_latest', 0, 2, 1, 'ordering=c_dsc\nuser_id=0\ncache=0\n\n', 0, 1, ''),
(5, 'Menu Stats', '', 5, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_stats', 0, 2, 1, '', 0, 1, ''),
(6, 'Unread Messages', '', 1, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_unread', 0, 2, 1, '', 1, 1, ''),
(7, 'Online Users', '', 2, 'header', 0, '0000-00-00 00:00:00', 1, 'mod_online', 0, 2, 1, '', 1, 1, ''),
(8, 'Toolbar', '', 1, 'toolbar', 0, '0000-00-00 00:00:00', 1, 'mod_toolbar', 0, 2, 1, '', 1, 1, ''),
(9, 'Quick Icons', '', 1, 'icon', 0, '0000-00-00 00:00:00', 1, 'mod_quickicon', 0, 2, 1, '', 1, 1, ''),
(10, 'Logged in Users', '', 2, 'cpanel', 0, '0000-00-00 00:00:00', 1, 'mod_logged', 0, 2, 1, '', 0, 1, ''),
(11, 'Footer', '', 0, 'footer', 0, '0000-00-00 00:00:00', 1, 'mod_footer', 0, 0, 1, '', 1, 1, ''),
(12, 'Admin Menu', '', 1, 'menu', 0, '0000-00-00 00:00:00', 1, 'mod_menu', 0, 2, 1, '', 0, 1, ''),
(13, 'Admin SubMenu', '', 1, 'submenu', 0, '0000-00-00 00:00:00', 1, 'mod_submenu', 0, 2, 1, '', 0, 1, ''),
(14, 'User Status', '', 1, 'status', 0, '0000-00-00 00:00:00', 1, 'mod_status', 0, 2, 1, '', 0, 1, ''),
(15, 'Title', '', 1, 'title', 0, '0000-00-00 00:00:00', 1, 'mod_title', 0, 2, 1, '', 0, 1, ''),
(17, 'User Menu', '', 8, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 1, 1, 'menutype=usermenu\nmoduleclass_sfx=_menu\ncache=1', 1, 0, ''),
(18, 'Login Form', '', 1, 'ja-login', 0, '0000-00-00 00:00:00', 1, 'mod_login', 0, 0, 1, 'cache=0\nmoduleclass_sfx=\npretext=\nposttext=\nlogin=\nlogout=\ngreeting=1\nname=0\nusesecure=0\n\n', 1, 0, ''),
(19, 'Latest News', '', 1, 'user1', 0, '0000-00-00 00:00:00', 0, 'mod_latestnews', 0, 0, 1, 'cache=1', 1, 0, ''),
(25, 'Newsflash', '', 1, 'top', 0, '0000-00-00 00:00:00', 1, 'mod_newsflash', 0, 0, 1, 'catid=3\r\nstyle=random\r\nitems=\r\nmoduleclass_sfx=', 0, 0, ''),
(27, 'Search', '', 1, 'user4', 0, '0000-00-00 00:00:00', 1, 'mod_search', 0, 0, 0, 'cache=1', 0, 0, ''),
(29, 'Top Menu', '', 1, 'user3', 0, '0000-00-00 00:00:00', 1, 'mod_mainmenu', 0, 0, 0, 'cache=1\nmenutype=topmenu\nmenu_style=list_flat\nmenu_images=n\nmenu_images_align=left\nexpand_menu=n\nclass_sfx=-nav\nmoduleclass_sfx=\nindent_image1=0\nindent_image2=0\nindent_image3=0\nindent_image4=0\nindent_image5=0\nindent_image6=0', 1, 0, ''),
(33, 'Footer', '', 1, 'footer', 62, '2010-02-03 06:07:15', 0, 'mod_footer', 0, 0, 0, 'cache=1\n\n', 1, 0, ''),
(41, 'Welcome to Joomla!', '<div style="padding: 5px">  <p>   Congratulations on choosing Joomla! as your content management system. To   help you get started, check out these excellent resources for securing your   server and pointers to documentation and other helpful resources. </p> <p>   <strong>Security</strong><br /> </p> <p>   On the Internet, security is always a concern. For that reason, you are   encouraged to subscribe to the   <a href="http://feedburner.google.com/fb/a/mailverify?uri=JoomlaSecurityNews" target="_blank">Joomla!   Security Announcements</a> for the latest information on new Joomla! releases,   emailed to you automatically. </p> <p>   If this is one of your first Web sites, security considerations may   seem complicated and intimidating. There are three simple steps that go a long   way towards securing a Web site: (1) regular backups; (2) prompt updates to the   <a href="http://www.joomla.org/download.html" target="_blank">latest Joomla! release;</a> and (3) a <a href="http://docs.joomla.org/Security_Checklist_2_-_Hosting_and_Server_Setup" target="_blank" title="good Web host">good Web host</a>. There are many other important security considerations that you can learn about by reading the <a href="http://docs.joomla.org/Category:Security_Checklist" target="_blank" title="Joomla! Security Checklist">Joomla! Security Checklist</a>. </p> <p>If you believe your Web site was attacked, or you think you have discovered a security issue in Joomla!, please do not post it in the Joomla! forums. Publishing this information could put other Web sites at risk. Instead, report possible security vulnerabilities to the <a href="http://developer.joomla.org/security/contact-the-team.html" target="_blank" title="Joomla! Security Task Force">Joomla! Security Task Force</a>.</p><p><strong>Learning Joomla!</strong> </p> <p>   A good place to start learning Joomla! is the   "<a href="http://docs.joomla.org/beginners" target="_blank">Absolute Beginner''s   Guide to Joomla!.</a>" There, you will find a Quick Start to Joomla!   <a href="http://help.joomla.org/ghop/feb2008/task048/joomla_15_quickstart.pdf" target="_blank">guide</a>   and <a href="http://help.joomla.org/ghop/feb2008/task167/index.html" target="_blank">video</a>,   amongst many other tutorials. The   <a href="http://community.joomla.org/magazine/view-all-issues.html" target="_blank">Joomla!   Community Magazine</a> also has   <a href="http://community.joomla.org/magazine/article/522-introductory-learning-joomla-using-sample-data.html" target="_blank">articles   for new learners</a> and experienced users, alike. A great place to look for   answers is the   <a href="http://docs.joomla.org/Category:FAQ" target="_blank">Frequently Asked   Questions (FAQ)</a>. If you are stuck on a particular screen in the   Administrator (which is where you are now), try clicking the Help toolbar   button to get assistance specific to that page. </p> <p>   If you still have questions, please feel free to use the   <a href="http://forum.joomla.org/" target="_blank">Joomla! Forums.</a> The forums   are an incredibly valuable resource for all levels of Joomla! users. Before   you post a question, though, use the forum search (located at the top of each   forum page) to see if the question has been asked and answered. </p> <p>   <strong>Getting Involved</strong> </p> <p>   <a name="twjs" title="twjs"></a> If you want to help make Joomla! better, consider getting   involved. There are   <a href="http://www.joomla.org/about-joomla/contribute-to-joomla.html" target="_blank">many ways   you can make a positive difference.</a> Have fun using Joomla!.</p></div>', 0, 'cpanel', 0, '0000-00-00 00:00:00', 0, 'mod_custom', 0, 2, 1, 'moduleclass_sfx=\n\n', 1, 1, ''),
(42, 'Joomla! Security Newsfeed', '', 6, 'cpanel', 62, '2008-10-25 20:15:17', 1, 'mod_feed', 0, 0, 1, 'cache=1\ncache_time=15\nmoduleclass_sfx=\nrssurl=http://feeds.joomla.org/JoomlaSecurityNews\nrssrtl=0\nrsstitle=1\nrssdesc=0\nrssimage=1\nrssitems=1\nrssitemdesc=1\nword_count=0\n\n', 0, 1, ''),
(46, 'AvuiSearch', '', 5, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_avuisearch', 0, 0, 1, 'width=20\nbutton_pos=right\n', 0, 0, ''),
(47, 'PhD menu', '', 3, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_mainmenu', 0, 0, 1, 'menutype=phd', 0, 0, ''),
(49, 'AdvHelloWorld1', '', 9, 'left', 0, '0000-00-00 00:00:00', 0, 'mod_advhelloworld1', 0, 0, 1, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_modules_menu`
--

CREATE TABLE IF NOT EXISTS `jos_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_modules_menu`
--

INSERT INTO `jos_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(17, 0),
(18, 0),
(19, 1),
(19, 2),
(19, 4),
(19, 27),
(19, 36),
(25, 0),
(27, 0),
(29, 0),
(31, 1),
(31, 20),
(31, 24),
(31, 28),
(31, 51),
(31, 52),
(31, 55),
(31, 61),
(31, 62),
(31, 64),
(31, 69),
(31, 70),
(31, 71),
(31, 73),
(31, 75),
(31, 76),
(33, 0),
(40, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_newsfeeds`
--

CREATE TABLE IF NOT EXISTS `jos_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias` varchar(255) NOT NULL DEFAULT '',
  `link` text NOT NULL,
  `filename` varchar(200) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(11) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(11) unsigned NOT NULL DEFAULT '3600',
  `checked_out` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `published` (`published`),
  KEY `catid` (`catid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `jos_newsfeeds`
--

INSERT INTO `jos_newsfeeds` (`catid`, `id`, `name`, `alias`, `link`, `filename`, `published`, `numarticles`, `cache_time`, `checked_out`, `checked_out_time`, `ordering`, `rtl`) VALUES
(4, 1, 'Joomla! Announcements', 'joomla-official-news', 'http://feeds.joomla.org/JoomlaAnnouncements', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 1, 0),
(4, 2, 'Joomla! Core Team Blog', 'joomla-core-team-blog', 'http://feeds.joomla.org/JoomlaCommunityCoreTeamBlog', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 2, 0),
(4, 3, 'Joomla! Community Magazine', 'joomla-community-magazine', 'http://feeds.joomla.org/JoomlaMagazine', '', 1, 20, 3600, 0, '0000-00-00 00:00:00', 3, 0),
(4, 4, 'Joomla! Developer News', 'joomla-developer-news', 'http://feeds.joomla.org/JoomlaDeveloper', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 4, 0),
(4, 5, 'Joomla! Security News', 'joomla-security-news', 'http://feeds.joomla.org/JoomlaSecurityNews', '', 1, 5, 3600, 0, '0000-00-00 00:00:00', 5, 0),
(5, 6, 'Free Software Foundation Blogs', 'free-software-foundation-blogs', 'http://www.fsf.org/blogs/RSS', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 4, 0),
(5, 7, 'Free Software Foundation', 'free-software-foundation', 'http://www.fsf.org/news/RSS', NULL, 1, 5, 3600, 62, '2008-09-14 00:24:25', 3, 0),
(5, 8, 'Software Freedom Law Center Blog', 'software-freedom-law-center-blog', 'http://www.softwarefreedom.org/feeds/blog/', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 2, 0),
(5, 9, 'Software Freedom Law Center News', 'software-freedom-law-center', 'http://www.softwarefreedom.org/feeds/news/', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 1, 0),
(5, 10, 'Open Source Initiative Blog', 'open-source-initiative-blog', 'http://www.opensource.org/blog/feed', NULL, 1, 5, 3600, 0, '0000-00-00 00:00:00', 5, 0),
(6, 11, 'PHP News and Announcements', 'php-news-and-announcements', 'http://www.php.net/feed.atom', NULL, 1, 5, 3600, 62, '2008-09-14 00:25:37', 1, 0),
(6, 12, 'Planet MySQL', 'planet-mysql', 'http://www.planetmysql.org/rss20.xml', NULL, 1, 5, 3600, 62, '2008-09-14 00:25:51', 2, 0),
(6, 13, 'Linux Foundation Announcements', 'linux-foundation-announcements', 'http://www.linuxfoundation.org/press/rss20.xml', NULL, 1, 5, 3600, 62, '2008-09-14 00:26:11', 3, 0),
(6, 14, 'Mootools Blog', 'mootools-blog', 'http://feeds.feedburner.com/mootools-blog', NULL, 1, 5, 3600, 62, '2008-09-14 00:26:51', 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_applicant_ethical_issue`
--

CREATE TABLE IF NOT EXISTS `jos_phd_applicant_ethical_issue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL,
  `ethical_issue_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=57 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_applicant_programme`
--

CREATE TABLE IF NOT EXISTS `jos_phd_applicant_programme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) DEFAULT NULL,
  `programme_id` int(11) DEFAULT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_phd_applicant_programme`
--

INSERT INTO `jos_phd_applicant_programme` (`id`, `applicant_id`, `programme_id`, `order`) VALUES
(1, 2, 1, 1),
(2, 2, 2, 2),
(3, 1, 1, 1),
(4, 1, 2, 2),
(5, 3, 1, 1),
(6, 3, 2, 2),
(7, 5, 5, 1),
(8, 5, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_applicants`
--

CREATE TABLE IF NOT EXISTS `jos_phd_applicants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `passport` varchar(20) NOT NULL DEFAULT '',
  `birth_date` date NOT NULL DEFAULT '0000-00-00',
  `birth_country_id` int(11) NOT NULL,
  `street` varchar(40) NOT NULL DEFAULT '',
  `city` varchar(40) NOT NULL DEFAULT '',
  `postalcode` varchar(10) NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL,
  `telephone` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL,
  `wheredidu_id` int(11) NOT NULL DEFAULT '0',
  `other_fellowships` tinyint(1) DEFAULT NULL,
  `other_fellowships_text` text NOT NULL,
  `career_breaks` tinyint(1) DEFAULT NULL,
  `career_breaks_text` text NOT NULL,
  `career_breaks_filename` varchar(255) DEFAULT NULL,
  `additional_info` text,
  `additional_info_filename` varchar(255) NOT NULL,
  `phd_thesis` text NOT NULL,
  `expected_lecture` varchar(50) NOT NULL,
  `research_experience` text NOT NULL,
  `ethical_issue` tinyint(1) NOT NULL,
  `user_username` varchar(150) NOT NULL,
  `status_id` int(11) NOT NULL DEFAULT '0',
  `submit_date` datetime DEFAULT NULL,
  `committee_username` varchar(150) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `docs_checked` tinyint(1) NOT NULL,
  `missing_docs` text NOT NULL,
  `academic_comments` text NOT NULL,
  `applicant_contacted` tinyint(1) NOT NULL,
  `applicant_contacted_date` date NOT NULL,
  `indian` tinyint(1) NOT NULL,
  `indian_info` text NOT NULL,
  `scientific_discipline_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `jos_phd_applicants`
--

INSERT INTO `jos_phd_applicants` (`id`, `firstname`, `lastname`, `gender_id`, `passport`, `birth_date`, `birth_country_id`, `street`, `city`, `postalcode`, `country_id`, `telephone`, `email`, `wheredidu_id`, `other_fellowships`, `other_fellowships_text`, `career_breaks`, `career_breaks_text`, `career_breaks_filename`, `additional_info`, `additional_info_filename`, `phd_thesis`, `expected_lecture`, `research_experience`, `ethical_issue`, `user_username`, `status_id`, `submit_date`, `committee_username`, `modified`, `docs_checked`, `missing_docs`, `academic_comments`, `applicant_contacted`, `applicant_contacted_date`, `indian`, `indian_info`, `scientific_discipline_id`) VALUES
(1, 'test1', 'test1', 1, '111222333', '1982-09-01', 199, 'Joan Oms', 'Canet de Mar', '08360', 199, '111222333', 'mail@mail.com', 2, 0, '', 0, '', NULL, 'informacion adicional', 'newinvoice.js', 'sdfasdf', 'demo', 'Este es el texto de Research Experience para test1', 0, 'test1', 1, '2011-12-02 10:52:05', 'com1', '2011-12-02 16:40:49', 0, '0', '', 0, '0000-00-00', 0, '', 0),
(2, 'asdf', 'khk', 1, '875687687', '1987-09-22', 199, '234234', '234234', '3434', 199, '34234234', 'sfsd@mail.com', 1, 0, '', 0, '', NULL, 'other comments', '', '', '', '', 0, 'test5', 2, '2011-09-29 09:30:43', NULL, '2013-02-08 09:20:05', 1, 'Missing docs', 'Academic comments', 1, '2013-02-08', 0, 'Indian information', 0),
(4, 'asdf', 'asdf', 1, '868768', '1990-12-11', 13, 'asdf', 'asdf', '97987', 3, '234234', 'ro@mail.com', 1, 0, '', 0, '', NULL, NULL, '', '', '', '', 0, 'test3', 1, NULL, NULL, '2011-10-19 09:31:42', 0, '0', '', 0, '0000-00-00', 0, '', 0),
(5, 'test2', 'test2', 1, '234234234', '1990-12-13', 199, 'asdfas', 'asdf', '23423', 199, '234234234', 'a@mail.com', 2, 0, '', 0, '', NULL, 'Other comments', '', 'asdfasdf', '', '', 0, 'test2', 2, '2011-12-01 11:24:49', 'com1', '2013-02-08 09:19:53', 1, 'Missing docs', 'Academic comments', 1, '2012-12-25', 0, 'Indian information', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_applications`
--

CREATE TABLE IF NOT EXISTS `jos_phd_applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_phd_applications`
--

INSERT INTO `jos_phd_applications` (`id`, `description`) VALUES
(1, 'phd'),
(2, 'postdoc');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_countries`
--

CREATE TABLE IF NOT EXISTS `jos_phd_countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` char(2) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `printable_name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=240 ;

--
-- Dumping data for table `jos_phd_countries`
--

INSERT INTO `jos_phd_countries` (`id`, `iso`, `name`, `printable_name`, `iso3`, `numcode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152),
(44, 'CN', 'CHINA', 'China', 'CHN', 156),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352),
(99, 'IN', 'INDIA', 'India', 'IND', 356),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600),
(168, 'PE', 'PERU', 'Peru', 'PER', 604),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan, Province of China', 'TWN', 158),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_degrees`
--

CREATE TABLE IF NOT EXISTS `jos_phd_degrees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL,
  `degree` text NOT NULL,
  `university` text NOT NULL,
  `institution` text NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `country_id` smallint(11) DEFAULT NULL,
  `director_name` varchar(50) DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `jos_phd_degrees`
--

INSERT INTO `jos_phd_degrees` (`id`, `applicant_id`, `type`, `degree`, `university`, `institution`, `start_date`, `end_date`, `country_id`, `director_name`, `modified`) VALUES
(1, 2, 'academic', 'werqwe', 'wqerqwer', '', NULL, NULL, NULL, NULL, '2011-09-29 07:26:41'),
(2, 3, 'postdoctoral', '', 'Univ. Malaga', '', '2011-11-01', '2011-12-08', 199, NULL, '2011-12-01 10:05:06'),
(3, 3, 'doctoral', 'Doctor', 'Univ. Malaga', '', '2011-11-01', '2011-12-08', 199, 'Luis Cobos', '2011-12-01 10:05:38'),
(4, 3, 'academic', 'Doctor', 'Univ. Malaga', '', NULL, '2011-11-07', 199, NULL, '2011-12-01 10:06:00'),
(5, 1, 'postdoctoral', '', 'asdf', '', '2011-11-01', '2011-12-02', 199, NULL, '2011-12-01 10:16:31'),
(6, 1, 'doctoral', 'asdf', 'asdf', '', '2011-11-09', '2011-12-14', 199, 'asdfasd', '2011-12-01 10:16:51'),
(7, 1, 'doctoral', 'asdf', 'asdf', '', '2011-11-08', '2011-12-07', 199, 'asdfsad', '2011-12-01 10:17:06'),
(8, 1, 'academic', 'asdfas', 'sdf', '', NULL, '2011-11-09', 199, NULL, '2011-12-01 10:17:20'),
(9, 5, 'postdoctoral', '', 'asdf', '', '2011-11-06', '2011-12-07', 199, NULL, '2011-12-01 10:21:19'),
(10, 5, 'doctoral', 'asdfasd', 'sadfsad', '', '2011-11-07', '2011-12-07', 199, 'asdfasdf', '2011-12-01 10:22:58'),
(11, 5, 'academic', 'sdfasd', 'sdfas', '', NULL, '2011-11-08', 199, NULL, '2011-12-01 10:23:12'),
(12, 5, 'academic', 'asdf', 'asdfa', '', NULL, NULL, NULL, NULL, '2012-11-29 15:28:28');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_doc_types`
--

CREATE TABLE IF NOT EXISTS `jos_phd_doc_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `short_description` varchar(30) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_phd_doc_types`
--

INSERT INTO `jos_phd_doc_types` (`id`, `description`, `short_description`, `order`) VALUES
(3, 'Academic record', 'Academic record', 3),
(2, 'Motivation letter', 'Motivation letter', 2),
(1, 'Curriculum Vitae', 'Curriculum Vitae', 1),
(5, 'Recommendation letter', 'Recommendation letter', 5),
(4, 'Eligibility Form', 'Eligibility Form', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_docs`
--

CREATE TABLE IF NOT EXISTS `jos_phd_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_type_id` int(11) NOT NULL DEFAULT '0',
  `applicant_id` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `jos_phd_docs`
--

INSERT INTO `jos_phd_docs` (`id`, `doc_type_id`, `applicant_id`, `filename`, `description`, `modified`) VALUES
(1, 1, 2, 'apktool.yml', 'fasdf', '2011-09-29 07:27:55'),
(2, 2, 2, 'AndroidManifest.xml', 'asdfasdf', '2011-09-29 07:29:55'),
(3, 3, 2, 'default.properties', 'adsfasdf', '2011-09-29 07:30:17'),
(4, 4, 2, 'project', 'asdfasdf', '2011-09-29 07:30:37'),
(5, 1, 3, 'default.php', 'Test', '2011-12-01 10:06:53'),
(6, 2, 3, 'index.php', 'Test', '2011-12-01 10:07:17'),
(7, 3, 3, 'favicon.ico', 'Test', '2011-12-01 10:07:31'),
(8, 4, 3, 'clients.js', 'Test', '2011-12-01 10:09:04'),
(9, 1, 1, 'createinvoice.js', 'asdfasd', '2011-12-01 10:17:34'),
(10, 2, 1, 'bamboo.js', 'asdfasdf', '2011-12-01 10:17:42'),
(11, 3, 1, 'login.js', 'asdfasd', '2011-12-01 10:17:53'),
(12, 4, 1, 'plotr.js', 'asdfasd', '2011-12-01 10:18:02'),
(13, 1, 5, 'prototype.js', 'asdfasd', '2011-12-01 10:23:35'),
(14, 2, 5, 'search.js', 'sadfasdf', '2011-12-01 10:23:42'),
(15, 3, 5, 'settings.js', 'sadfasdf', '2011-12-01 10:23:50'),
(16, 4, 5, 'newinvoice.js', 'asdfasdf', '2011-12-01 10:23:57'),
(26, 4, 5, 'LICENSES.php', '', '2012-11-30 10:15:25');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_ethical_issues`
--

CREATE TABLE IF NOT EXISTS `jos_phd_ethical_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `order` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `jos_phd_ethical_issues`
--

INSERT INTO `jos_phd_ethical_issues` (`id`, `description`, `short_description`, `order`) VALUES
(1, 'Research involving interventions in humans or research using human materials (primary cells, tissues, DNA, RNA, etc., but NOT established cell lines!)', 'Research involving humans', 1),
(2, 'Research on experimental (vertebrate) animals', 'Research on animals', 2),
(3, 'Research involving embryonic stem cells', 'Research involving embryonic stem cells', 3),
(4, 'Research involving biological agents including, genetically modified organisms.', 'Research involving biological agents including, genetically modified organisms.', 4),
(5, 'Research involving data protection and privacy', 'Research involving data protection and privacy', 5);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_genders`
--

CREATE TABLE IF NOT EXISTS `jos_phd_genders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  `short_description` varchar(10) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_phd_genders`
--

INSERT INTO `jos_phd_genders` (`id`, `description`, `short_description`, `order`) VALUES
(2, 'Female', 'Female', 2),
(1, 'Male', 'Male', 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_logs`
--

CREATE TABLE IF NOT EXISTS `jos_phd_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `old_status_id` int(11) NOT NULL DEFAULT '0',
  `new_status_id` int(11) NOT NULL DEFAULT '0',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_programmes`
--

CREATE TABLE IF NOT EXISTS `jos_phd_programmes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(100) NOT NULL,
  `short_description` varchar(50) NOT NULL,
  `user_username` varchar(150) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_phd_programmes`
--

INSERT INTO `jos_phd_programmes` (`id`, `description`, `short_description`, `user_username`, `order`) VALUES
(1, 'Cell and Developmental Biology', 'Cell and Development', 'cadb', 1),
(2, 'Molecular Medicine', 'Molecular Medicine', 'mmp', 2),
(3, 'Oncology', 'Oncology', 'onco', 3),
(4, 'Chemistry and Molecular Pharmacology', 'Chemistry and Molecular Pharmacology', 'camp', 4),
(5, 'Structural and Computational Biology', 'Structural and Computational Biology', 'sacb', 5);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_referees`
--

CREATE TABLE IF NOT EXISTS `jos_phd_referees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `upload_code` varchar(50) DEFAULT NULL,
  `sent_mail` date DEFAULT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_phd_referees`
--

INSERT INTO `jos_phd_referees` (`id`, `applicant_id`, `firstname`, `lastname`, `email`, `filename`, `upload_code`, `sent_mail`, `modified`) VALUES
(1, 1, 'Antonio', 'Jimenez', 'antonio.jimenez@gmail.com', NULL, '270680786', NULL, '2011-09-21 12:39:15'),
(2, 1, 'Roberto', 'Bartolome', 'roberto.bartolome.medina@gmail.com', NULL, '542483949', '2012-05-15', '2012-05-15 06:57:28'),
(3, 2, 'qwerqwe', 'qwerqwe', 'qwer@mail.com', NULL, '563175576', NULL, '2011-09-29 07:28:13'),
(4, 2, 'asdsad', 'qwerwe', 'asdf@mail.com', NULL, '1336415390', NULL, '2011-09-29 07:28:24'),
(5, 2, 'qwer', 'wqer', 'roberto.bartolome@irbbarcelona.com', NULL, '339856603', '2011-09-30', '2011-09-30 05:01:35'),
(6, 3, 'John', 'Mac', 'jb@mail.com', NULL, '631702268', NULL, '2011-12-01 10:08:07'),
(7, 3, 'Pi', 'Com', 'p@mail.com', NULL, '1175321618', NULL, '2011-12-01 10:09:24'),
(8, 5, 'asdfas', 'asdfasd', 'a@mail.com', NULL, '750607589', NULL, '2011-12-01 10:24:09'),
(10, 5, 'adf', 'asdf', 'a@mail.com', 'index.php', '1763279309', NULL, '2012-12-03 17:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_rights`
--

CREATE TABLE IF NOT EXISTS `jos_phd_rights` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_phd_rights`
--

INSERT INTO `jos_phd_rights` (`id`, `description`, `short_description`, `order`) VALUES
(1, 'Read', 'read', 1),
(2, 'Write', 'write', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_role_tab_right`
--

CREATE TABLE IF NOT EXISTS `jos_phd_role_tab_right` (
  `role_id` int(11) NOT NULL,
  `tab_id` int(11) NOT NULL,
  `right_id` int(11) NOT NULL,
  PRIMARY KEY (`role_id`,`tab_id`,`right_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_phd_role_tab_right`
--

INSERT INTO `jos_phd_role_tab_right` (`role_id`, `tab_id`, `right_id`) VALUES
(1, 1, 2),
(1, 2, 2),
(1, 3, 2),
(1, 4, 2),
(1, 5, 2),
(1, 6, 2),
(1, 7, 2),
(1, 8, 2),
(1, 9, 2),
(1, 10, 2),
(2, 1, 2),
(2, 2, 2),
(2, 3, 2),
(2, 4, 2),
(2, 5, 2),
(2, 6, 2),
(2, 7, 2),
(2, 8, 2),
(2, 9, 2),
(2, 10, 2),
(3, 1, 1),
(3, 2, 1),
(3, 3, 1),
(3, 4, 1),
(3, 5, 1),
(3, 6, 1),
(3, 7, 1),
(3, 8, 1),
(3, 9, 1),
(3, 10, 1),
(4, 1, 2),
(4, 2, 2),
(4, 3, 2),
(4, 4, 2),
(4, 5, 2),
(4, 6, 2),
(4, 7, 2),
(4, 8, 2),
(4, 9, 2),
(4, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_roles`
--

CREATE TABLE IF NOT EXISTS `jos_phd_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_phd_roles`
--

INSERT INTO `jos_phd_roles` (`id`, `description`, `short_description`, `order`) VALUES
(1, 'Administrator', 'Administrator', 1),
(2, 'Group Leader', 'Group Leader', 2),
(3, 'Committee', 'Committee', 3),
(4, 'Applicant', 'Applicant', 4);

-- --------------------------------------------------------

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

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_status`
--

CREATE TABLE IF NOT EXISTS `jos_phd_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  `short_description` varchar(40) NOT NULL,
  `mail_subject` varchar(100) NOT NULL,
  `mail_body` text NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `jos_phd_status`
--

INSERT INTO `jos_phd_status` (`id`, `description`, `short_description`, `mail_subject`, `mail_body`, `order`) VALUES
(1, 'Editing', 'Editing', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nThis email is to inform you that IRB Barcelona has not yet received one of the two letters of recommendation requested for application to IRB Barcelona PhD fellowships. We remind you that these letters must be sent directly to us by your referees (either by e-mail to phd@irbbarcelona.org , by airmail or by fax to our contact address) and that the deadline for receipt is 25 January 2009.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 1),
(2, 'Submitted', 'Submitted', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nThank you for your interest in IRB Barcelona and for submitting your application for a PhD position at our institute.\r\n\r\nThis e-mail is to confirm that your application has been submitted correctly. You will hear back from us once the call closes and the first part of the evaluation process has been completed, around February 2009.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 2),
(3, 'Not invited for interviews', 'Not invited for interviews', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nThank you, once again, for applying for a Ph.D. grant at IRB Barcelona. The call closed the 25 January 2009 and the first part of the selection process has now been completed.\r\n\r\nAfter careful evaluation of your considerable merits, I am sorry to inform you that on this occasion you have not been short-listed.\r\n\r\nI thank you once again for your interest in IRB Barcelona and wish you every success in the future.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 3),
(4, 'Invited for interviews', 'Invited for interviews', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nThank you once again for your recent application for a PhD grant at IRB Barcelona. After careful evaluation of your merits, I am pleased to inform you that you have been short-listed as a potential candidate for one of the grants currently on offer. You will soon receive an official letter with the invitation to visit our Institute on 30 and 31 of March 2009 for interviews.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 4),
(5, 'Not accepted', 'Not accepted', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nAfter completion of the selection process for PhD fellowships offered by the Institute for Research in Biomedicine (IRB Barcelona), I regret to inform you than on this occasion your application has not been successful. Given the considerable competition for these fellowships and exceptionally high number and quality of applicants, I congratulate you on being short-listed.\r\n\r\nI thank you once again for your interest in  IRB Barcelona and wish you every success in the future.\r\n\r\nYours sincerely,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 5),
(6, 'Accepted', 'Accepted', 'News from IRB Barcelona PhD programme', 'Dear #name#,\r\n\r\nAfter completion of the selection process, it is our pleasure to offer you a PhD fellowship at IRB Barcelona. We congratulate you on this achievement. As you know there was considerable competition for these fellowships and the number and quality of applicants were exceptionally high.\r\n\r\nWe will officially contact you in the near future with more details of our offer.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 6),
(7, 'Discarded', 'Discarded', 'News from IRB Barcelona PhD Programme', 'Dear #name#,\r\n\r\nThank you for your interest in IRB Barcelona and for submitting your application for a PhD position at our institute.\r\n\r\nWe regret to inform you that we have received no recommendations letters. You have therefore been excluded from the selection process.\r\n\r\nBest regards,\r\n\r\nIRB Barcelona PhD Programme\r\n\r\nThis is an automatically generated message. Please do not answer.', 7),
(8, 'Waiting list', 'Waiting list', '', '', 8);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_tab_application`
--

CREATE TABLE IF NOT EXISTS `jos_phd_tab_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tab_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `show` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `jos_phd_tab_application`
--

INSERT INTO `jos_phd_tab_application` (`id`, `tab_id`, `application_id`, `show`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1),
(3, 3, 1, 1),
(4, 4, 1, 1),
(5, 5, 1, 1),
(6, 6, 1, 0),
(7, 7, 1, 0),
(8, 8, 1, 1),
(9, 9, 1, 1),
(10, 10, 1, 1),
(11, 1, 2, 1),
(12, 2, 2, 1),
(13, 3, 2, 1),
(14, 4, 2, 1),
(15, 5, 2, 1),
(16, 6, 2, 1),
(17, 7, 2, 1),
(18, 8, 2, 1),
(19, 9, 2, 1),
(20, 10, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_tabs`
--

CREATE TABLE IF NOT EXISTS `jos_phd_tabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `jos_phd_tabs`
--

INSERT INTO `jos_phd_tabs` (`id`, `description`) VALUES
(1, 'personal_data'),
(2, 'academic_info'),
(3, 'files'),
(4, 'referees'),
(5, 'work_experiences'),
(6, 'summary_of_thesis'),
(7, 'summary_of_research'),
(8, 'programmes'),
(9, 'ethical_issues'),
(10, 'status');

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_users`
--

CREATE TABLE IF NOT EXISTS `jos_phd_users` (
  `id` int(11) NOT NULL,
  `user_username` varchar(150) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_username` (`user_username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_phd_users`
--

INSERT INTO `jos_phd_users` (`id`, `user_username`, `role_id`) VALUES
(1, 'phdadmin', 1),
(2, 'phdadmin2', 1),
(3, 'cadb', 2),
(4, 'mmp', 2),
(5, 'onco', 2),
(6, 'camp', 2),
(7, 'sacb', 2),
(8, 'com1', 3),
(9, 'com2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_wheredidu`
--

CREATE TABLE IF NOT EXISTS `jos_phd_wheredidu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(40) NOT NULL,
  `short_description` varchar(40) NOT NULL,
  `order` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_phd_wheredidu`
--

INSERT INTO `jos_phd_wheredidu` (`id`, `description`, `short_description`, `order`) VALUES
(1, 'IRB Barcelona Website', 'IRB Barcelona Website', 1),
(2, 'Email announcement', 'Email announcement', 2),
(3, 'Through a friend/professor/researcher', 'Through a friend/professor/researcher', 3),
(4, 'Poster', 'Poster', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jos_phd_work_experiences`
--

CREATE TABLE IF NOT EXISTS `jos_phd_work_experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `applicant_id` int(11) NOT NULL DEFAULT '0',
  `experience` text NOT NULL,
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `jos_phd_work_experiences`
--

INSERT INTO `jos_phd_work_experiences` (`id`, `applicant_id`, `experience`, `modified`) VALUES
(1, 2, 'asdfasdfasdfasdff', '2011-09-29 07:28:40'),
(2, 2, 'adsfasdfasdf', '2011-09-29 07:28:42');

-- --------------------------------------------------------

--
-- Table structure for table `jos_plugins`
--

CREATE TABLE IF NOT EXISTS `jos_plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `element` varchar(100) NOT NULL DEFAULT '',
  `folder` varchar(100) NOT NULL DEFAULT '',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(3) NOT NULL DEFAULT '0',
  `iscore` tinyint(3) NOT NULL DEFAULT '0',
  `client_id` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder` (`published`,`client_id`,`access`,`folder`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `jos_plugins`
--

INSERT INTO `jos_plugins` (`id`, `name`, `element`, `folder`, `access`, `ordering`, `published`, `iscore`, `client_id`, `checked_out`, `checked_out_time`, `params`) VALUES
(1, 'Authentication - Joomla', 'joomla', 'authentication', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(2, 'Authentication - LDAP', 'ldap', 'authentication', 0, 2, 0, 1, 0, 0, '0000-00-00 00:00:00', 'host=\nport=389\nuse_ldapV3=0\nnegotiate_tls=0\nno_referrals=0\nauth_method=bind\nbase_dn=\nsearch_string=\nusers_dn=\nusername=\npassword=\nldap_fullname=fullName\nldap_email=mail\nldap_uid=uid\n\n'),
(3, 'Authentication - GMail', 'gmail', 'authentication', 0, 4, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(4, 'Authentication - OpenID', 'openid', 'authentication', 0, 3, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(5, 'User - Joomla!', 'joomla', 'user', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', 'autoregister=1\n\n'),
(6, 'Search - Content', 'content', 'search', 0, 1, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\nsearch_content=1\nsearch_uncategorised=1\nsearch_archived=1\n\n'),
(7, 'Search - Contacts', 'contacts', 'search', 0, 3, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(8, 'Search - Categories', 'categories', 'search', 0, 4, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(9, 'Search - Sections', 'sections', 'search', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(10, 'Search - Newsfeeds', 'newsfeeds', 'search', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(11, 'Search - Weblinks', 'weblinks', 'search', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'search_limit=50\n\n'),
(12, 'Content - Pagebreak', 'pagebreak', 'content', 0, 10000, 1, 1, 0, 0, '0000-00-00 00:00:00', 'enabled=1\ntitle=1\nmultipage_toc=1\nshowall=1\n\n'),
(13, 'Content - Rating', 'vote', 'content', 0, 4, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(14, 'Content - Email Cloaking', 'emailcloak', 'content', 0, 5, 1, 0, 0, 0, '0000-00-00 00:00:00', 'mode=1\n\n'),
(15, 'Content - Code Hightlighter (GeSHi)', 'geshi', 'content', 0, 5, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(16, 'Content - Load Module', 'loadmodule', 'content', 0, 6, 1, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\nstyle=0\n\n'),
(17, 'Content - Page Navigation', 'pagenavigation', 'content', 0, 2, 1, 1, 0, 0, '0000-00-00 00:00:00', 'position=1\n\n'),
(18, 'Editor - No Editor', 'none', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(19, 'Editor - TinyMCE', 'tinymce', 'editors', 0, 0, 1, 1, 0, 0, '0000-00-00 00:00:00', 'mode=extended\nskin=0\ncompressed=0\ncleanup_startup=0\ncleanup_save=2\nentity_encoding=raw\nlang_mode=0\nlang_code=en\ntext_direction=ltr\ncontent_css=1\ncontent_css_custom=\nrelative_urls=1\nnewlines=0\ninvalid_elements=applet\nextended_elements=\ntoolbar=top\ntoolbar_align=left\nhtml_height=550\nhtml_width=750\nelement_path=1\nfonts=1\npaste=1\nsearchreplace=1\ninsertdate=1\nformat_date=%Y-%m-%d\ninserttime=1\nformat_time=%H:%M:%S\ncolors=1\ntable=1\nsmilies=1\nmedia=1\nhr=1\ndirectionality=1\nfullscreen=1\nstyle=1\nlayer=1\nxhtmlxtras=0\nvisualchars=1\nnonbreaking=1\ntemplate=0\nadvimage=1\nadvlink=1\nautosave=0\ncontextmenu=1\ninlinepopups=1\nsafari=0\ncustom_plugin=\ncustom_button=\n\n'),
(20, 'Editor - XStandard Lite 2.0', 'xstandard', 'editors', 0, 0, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(21, 'Editor Button - Image', 'image', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(22, 'Editor Button - Pagebreak', 'pagebreak', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(23, 'Editor Button - Readmore', 'readmore', 'editors-xtd', 0, 0, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(24, 'XML-RPC - Joomla', 'joomla', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(25, 'XML-RPC - Blogger API', 'blogger', 'xmlrpc', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', 'catid=1\nsectionid=0\n\n'),
(27, 'System - SEF', 'sef', 'system', 0, 1, 1, 0, 0, 0, '0000-00-00 00:00:00', ''),
(28, 'System - Debug', 'debug', 'system', 0, 2, 1, 0, 0, 0, '0000-00-00 00:00:00', 'queries=1\nmemory=1\nlangauge=1\n\n'),
(29, 'System - Legacy', 'legacy', 'system', 0, 3, 0, 1, 0, 0, '0000-00-00 00:00:00', 'route=0\n\n'),
(30, 'System - Cache', 'cache', 'system', 0, 4, 0, 1, 0, 0, '0000-00-00 00:00:00', 'browsercache=0\ncachetime=15\n\n'),
(31, 'System - Log', 'log', 'system', 0, 5, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(32, 'System - Remember Me', 'remember', 'system', 0, 6, 1, 1, 0, 0, '0000-00-00 00:00:00', ''),
(33, 'System - Backlink', 'backlink', 'system', 0, 7, 0, 1, 0, 0, '0000-00-00 00:00:00', ''),
(34, 'System - Mootools Upgrade', 'mtupgrade', 'system', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', ''),
(35, 'Content - ContentPassword', 'contentpassword', 'content', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', 'enabled=1\npassword=pepelu\nsession=0\nalt_uri=0\n\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_data`
--

CREATE TABLE IF NOT EXISTS `jos_poll_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollid` int(11) NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `hits` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pollid` (`pollid`,`text`(1))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `jos_poll_data`
--

INSERT INTO `jos_poll_data` (`id`, `pollid`, `text`, `hits`) VALUES
(1, 14, 'Community Sites', 2),
(2, 14, 'Public Brand Sites', 3),
(3, 14, 'eCommerce', 1),
(4, 14, 'Blogs', 0),
(5, 14, 'Intranets', 0),
(6, 14, 'Photo and Media Sites', 2),
(7, 14, 'All of the Above!', 3),
(8, 14, '', 0),
(9, 14, '', 0),
(10, 14, '', 0),
(11, 14, '', 0),
(12, 14, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_date`
--

CREATE TABLE IF NOT EXISTS `jos_poll_date` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `vote_id` int(11) NOT NULL DEFAULT '0',
  `poll_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `poll_id` (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `jos_poll_date`
--

INSERT INTO `jos_poll_date` (`id`, `date`, `vote_id`, `poll_id`) VALUES
(1, '2006-10-09 13:01:58', 1, 14),
(2, '2006-10-10 15:19:43', 7, 14),
(3, '2006-10-11 11:08:16', 7, 14),
(4, '2006-10-11 15:02:26', 2, 14),
(5, '2006-10-11 15:43:03', 7, 14),
(6, '2006-10-11 15:43:38', 7, 14),
(7, '2006-10-12 00:51:13', 2, 14),
(8, '2007-05-10 19:12:29', 3, 14),
(9, '2007-05-14 14:18:00', 6, 14),
(10, '2007-06-10 15:20:29', 6, 14),
(11, '2007-07-03 12:37:53', 2, 14);

-- --------------------------------------------------------

--
-- Table structure for table `jos_poll_menu`
--

CREATE TABLE IF NOT EXISTS `jos_poll_menu` (
  `pollid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pollid`,`menuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_polls`
--

CREATE TABLE IF NOT EXISTS `jos_polls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `voters` int(9) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `lag` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `jos_polls`
--

INSERT INTO `jos_polls` (`id`, `title`, `alias`, `voters`, `checked_out`, `checked_out_time`, `published`, `access`, `lag`) VALUES
(14, 'Joomla! is used for?', 'joomla-is-used-for', 11, 0, '0000-00-00 00:00:00', 1, 0, 86400);

-- --------------------------------------------------------

--
-- Table structure for table `jos_sections`
--

CREATE TABLE IF NOT EXISTS `jos_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `image` text NOT NULL,
  `scope` varchar(50) NOT NULL DEFAULT '',
  `image_position` varchar(30) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `access` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_scope` (`scope`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `jos_sections`
--

INSERT INTO `jos_sections` (`id`, `title`, `name`, `alias`, `image`, `scope`, `image_position`, `description`, `published`, `checked_out`, `checked_out_time`, `ordering`, `access`, `count`, `params`) VALUES
(1, 'News', '', 'news', 'articles.jpg', 'content', 'right', 'Select a news topic from the list below, then select a news article to read.', 1, 0, '0000-00-00 00:00:00', 3, 0, 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `jos_session`
--

CREATE TABLE IF NOT EXISTS `jos_session` (
  `username` varchar(150) DEFAULT '',
  `time` varchar(14) DEFAULT '',
  `session_id` varchar(200) NOT NULL DEFAULT '0',
  `guest` tinyint(4) DEFAULT '1',
  `userid` int(11) DEFAULT '0',
  `usertype` varchar(50) DEFAULT '',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `data` longtext,
  PRIMARY KEY (`session_id`(64)),
  KEY `whosonline` (`guest`,`usertype`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_session`
--

INSERT INTO `jos_session` (`username`, `time`, `session_id`, `guest`, `userid`, `usertype`, `gid`, `client_id`, `data`) VALUES
('', '1379428462', 'q4ndto6ud8vctpucteg0q74mu6', 1, 0, '', 0, 1, '__default|a:8:{s:15:"session.counter";i:1;s:19:"session.timer.start";i:1379428459;s:18:"session.timer.last";i:1379428459;s:17:"session.timer.now";i:1379428459;s:22:"session.client.browser";s:74:"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:1:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";i:0;s:4:"name";N;s:8:"username";N;s:5:"email";N;s:8:"password";N;s:14:"password_clear";s:0:"";s:8:"usertype";N;s:5:"block";N;s:9:"sendEmail";i:0;s:3:"gid";i:0;s:12:"registerDate";N;s:13:"lastvisitDate";N;s:10:"activation";N;s:6:"params";N;s:3:"aid";i:0;s:5:"guest";i:1;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:74:"/home/roberto/workspace/phdlacaixa/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":0:{}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"e5ada11b3141681b17e932c8f4a0c583";}'),
('admin', '1379428727', '64m2fb0qvo2t4ikc5tceecfbt3', 0, 62, 'Super Administrator', 25, 1, '__default|a:8:{s:15:"session.counter";i:5;s:19:"session.timer.start";i:1379428459;s:18:"session.timer.last";i:1379428468;s:17:"session.timer.now";i:1379428727;s:22:"session.client.browser";s:74:"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:23.0) Gecko/20100101 Firefox/23.0";s:8:"registry";O:9:"JRegistry":3:{s:17:"_defaultNameSpace";s:7:"session";s:9:"_registry";a:3:{s:7:"session";a:1:{s:4:"data";O:8:"stdClass":0:{}}s:11:"application";a:1:{s:4:"data";O:8:"stdClass":1:{s:4:"lang";s:0:"";}}s:10:"com_cpanel";a:1:{s:4:"data";O:8:"stdClass":1:{s:9:"mtupgrade";O:8:"stdClass":1:{s:7:"checked";b:1;}}}}s:7:"_errors";a:0:{}}s:4:"user";O:5:"JUser":19:{s:2:"id";s:2:"62";s:4:"name";s:13:"Administrator";s:8:"username";s:5:"admin";s:5:"email";s:34:"roberto.bartolome@irbbarcelona.org";s:8:"password";s:65:"ca193049daf651a4e17b4c2fd7d886b1:4LkuxelFYFR5ysYnlhZ01jmcsbhVEScE";s:14:"password_clear";s:0:"";s:8:"usertype";s:19:"Super Administrator";s:5:"block";s:1:"0";s:9:"sendEmail";s:1:"1";s:3:"gid";s:2:"25";s:12:"registerDate";s:19:"2009-10-08 18:40:28";s:13:"lastvisitDate";s:19:"2013-05-28 09:27:01";s:10:"activation";s:0:"";s:6:"params";s:56:"admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=1\n\n";s:3:"aid";i:2;s:5:"guest";i:0;s:7:"_params";O:10:"JParameter":7:{s:4:"_raw";s:0:"";s:4:"_xml";N;s:9:"_elements";a:0:{}s:12:"_elementPath";a:1:{i:0;s:74:"/home/roberto/workspace/phdlacaixa/libraries/joomla/html/parameter/element";}s:17:"_defaultNameSpace";s:8:"_default";s:9:"_registry";a:1:{s:8:"_default";a:1:{s:4:"data";O:8:"stdClass":5:{s:14:"admin_language";s:0:"";s:8:"language";s:0:"";s:6:"editor";s:0:"";s:8:"helpsite";s:0:"";s:8:"timezone";s:1:"1";}}}s:7:"_errors";a:0:{}}s:9:"_errorMsg";N;s:7:"_errors";a:0:{}}s:13:"session.token";s:32:"e5ada11b3141681b17e932c8f4a0c583";}');

-- --------------------------------------------------------

--
-- Table structure for table `jos_stats_agents`
--

CREATE TABLE IF NOT EXISTS `jos_stats_agents` (
  `agent` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jos_templates_menu`
--

CREATE TABLE IF NOT EXISTS `jos_templates_menu` (
  `template` varchar(255) NOT NULL DEFAULT '',
  `menuid` int(11) NOT NULL DEFAULT '0',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`menuid`,`client_id`,`template`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jos_templates_menu`
--

INSERT INTO `jos_templates_menu` (`template`, `menuid`, `client_id`) VALUES
('ja_nickel', 0, 0),
('khepri', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `jos_users`
--

CREATE TABLE IF NOT EXISTS `jos_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `username` varchar(150) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `usertype` varchar(25) NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `gid` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usertype` (`usertype`),
  KEY `idx_name` (`name`),
  KEY `gid_block` (`gid`,`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Dumping data for table `jos_users`
--

INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `usertype`, `block`, `sendEmail`, `gid`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(62, 'Administrator', 'admin', 'roberto.bartolome@irbbarcelona.org', 'ca193049daf651a4e17b4c2fd7d886b1:4LkuxelFYFR5ysYnlhZ01jmcsbhVEScE', 'Super Administrator', 0, 1, 25, '2009-10-08 18:40:28', '2013-09-17 14:34:22', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=1\n\n'),
(63, 'Anna Alsina', 'aalsina', 'anna@mail.com', '752fa41c95f4caec78f61c5cc7f4c591:XOEyD4sRI3T1wRZJwUZLli907Jt1PJRK', 'Registered', 0, 0, 18, '2009-11-02 14:36:08', '2011-12-02 18:16:44', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(64, 'Sonia Saborit', 'ssaborit', 'sonia@mail.com', '5e4b6da19a71783ec8f9f558e9fabd5b:Q5PzSdy0VOOveZwQGjnSHnKbSfapr2nn', 'Registered', 0, 0, 18, '2009-11-02 14:36:34', '2011-03-01 16:13:16', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(65, 'Ferran Azorin', 'fazorin', 'ferran@mail.com', '856f43661e634028aec9c22a1547add3:I7DsarEWVIDLygwAWhkWFJ2dQC40WyUq', 'Registered', 0, 0, 18, '2009-11-02 14:37:08', '2011-02-23 08:06:33', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\npage_title=Edit Your Details\nshow_page_title=1\n\n'),
(66, 'Margarida Corominas', 'mcorominas', 'marga@mail.com', 'd0fcd1a9e3859c08c857cd9e666e54ca:fg5eLVzHikVEUPnBDCcSAzbGCCG8SrT8', 'Registered', 0, 0, 18, '2009-11-02 14:37:41', '2010-01-13 06:10:43', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(67, 'Test1', 'test1', 'test1@irbtest.org', '657eb7d60818d99471551e6820277641:RWGXHZlIU82nOlIkiuFAnXg3JN4Z5gMx', 'Registered', 0, 0, 18, '2009-11-20 08:23:50', '2013-02-08 08:37:28', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(68, 'Test2', 'test2', 'test2@test2.org', 'b3d655949fe86a1eec3035c551c69dca:U7dE6DHQtVb9BVoEQ6MP5saZUCQ37SMp', 'Registered', 0, 0, 18, '2009-11-20 08:24:22', '2011-12-02 09:48:24', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(69, 'Test3', 'test3', 'test3@irbtest.org', '285424df591a08797fc1c5b5577cb4c5:mPTmxYUeCVI0HtFxAtZTQpuyn3TMShzj', 'Registered', 0, 0, 18, '2009-11-20 08:24:48', '2011-10-24 10:16:22', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(70, 'Jordi Casanova', 'jcasanova', 'jcasanova@mail.com', '86ee56518f0cf3de094dd5aa7f228f5c:7sMs7IYorGdflpBs7guJVX2BhjWFI8uM', 'Registered', 0, 0, 18, '2009-12-01 05:48:31', '2009-12-18 16:29:48', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(71, 'cgonzalez', 'cgonzalez', 'cgonzalez@mail.com', '2703e64a467a37ce5d618f51ab607dcc:rukcA9qJACxkA6DftZW6RmGd5uHqVw0L', 'Registered', 0, 0, 18, '2009-12-01 05:49:12', '2009-12-03 16:24:41', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(72, 'Roberto Bartolomé', 'rbartolome', 'bartolome@irbbarcelona.org', 'cbbcdcde88a9b463be34819693f121bd:WHjGlwcuk9pPKsQAx69pySoRVIV4zHqZ', 'Registered', 0, 0, 18, '2009-12-04 09:53:14', '2011-12-23 12:15:57', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(73, 'Roberto', 'roberto', 'r@mail.net', '25f4b575ec1b73b8554397a584f9fb67:zsSQ8LQjQzMDrHTHIGuyEGod6JhVQ3aI', 'Registered', 0, 0, 18, '2010-03-18 11:07:56', '2010-04-06 14:49:06', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(74, 'phdadmin', 'phdadmin', 'phdadmin@mail.com', '6c96a2c681440bec1814f340ae847059:csln82kNlwBewxBAnPzrwxPjyXNkC156', 'Registered', 0, 0, 18, '2010-04-06 05:07:13', '2013-02-08 09:19:45', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(75, 'phdadmin2', 'phdadmin2', 'phdadmin2@mail.com', '0f62e600bba6fef434b26cfa90194ee6:DoFEvP4v3QSanuwjzSGbyuc5Ey3Z2vu2', 'Registered', 0, 0, 18, '2010-04-06 05:07:57', '2010-05-27 16:29:10', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(76, 'cadb', 'cadb', 'cadb@mail.com', 'cb1f2147b10d5817a423792a44c31c43:kJ3G4OIRxYAnls5RqPqqTpM75SOfQnbM', 'Registered', 0, 0, 18, '2010-04-06 05:08:26', '2011-12-01 10:25:50', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(77, 'mmp', 'mmp', 'mmp@mail.com', '2d091d8fff455389b8e4dba924750ca1:BgLTue11ggn4qhojZAVNt9iAoYaNEpAL', 'Registered', 0, 0, 18, '2010-04-06 05:09:02', '2011-02-16 06:00:43', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(78, 'onco', 'onco', 'onco@mail.com', '238fa4e127031f75c462ba02cdd27d20:K55mwSoV2Hqm77ruiftLzWktRBsPOhh6', 'Registered', 0, 0, 18, '2010-04-06 05:09:36', '2010-05-12 17:01:36', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(79, 'camp', 'camp', 'camp@mail.com', '0b81888da2cfe7b581791949e97a3691:1rQihKd1nuvgUVSItLQuAn15vzDACxj7', 'Registered', 0, 0, 18, '2010-04-06 05:10:03', '2010-07-07 15:17:04', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(80, 'sacb', 'sacb', 'sacb@mail.com', 'a0b4bf5062cff3748a2f12b475f741ad:B31Cvqihnh8fZrjmWlFmqZZPs0Am4hMq', 'Registered', 0, 0, 18, '2010-04-06 05:10:45', '2010-04-19 05:20:53', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(81, 'com1', 'com1', 'com1@mail.com', '5bd35d03705c5dd7fefb29938caebd15:Ij2cb8v4PLqFeN7kA5qv2CEyWdg2yoCk', 'Registered', 0, 0, 18, '2010-04-09 16:41:06', '2011-12-02 10:21:20', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(82, 'com2', 'com2', 'com2@mail.com', '00605168669e7fca88618041373dc392:cT0C5mSKiKAXAYg7whgAx6IZLbLyZ7UF', 'Registered', 0, 0, 18, '2010-04-09 16:41:21', '2010-07-08 15:14:48', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(83, 'pepelu', 'pepelu', 'pepelu@mail.com', 'e405132fe3e9b311f86dfaf9e4c94b8d:hQn5EyG3PVGON6B8fY3R6HfZBuDiXLcu', 'Registered', 0, 0, 18, '2010-04-13 13:55:33', '0000-00-00 00:00:00', '1f44995d09c168f8f8fa88422a0c7b7d', '\n'),
(84, 'test11', 'test11', 'test11@gmail.com', 'fff825594b930ba8a39dc591965ebb8e:gJ1e5rJJCq3uKyOB2phDcprNTpK8FOGw', 'Registered', 0, 0, 18, '2010-06-15 07:55:33', '2010-06-15 08:01:45', '', '\n'),
(85, 'ccaelles', 'ccaelles', 'mail@mail.com', '479df72c8b26954b384ec1f59ad06504:8v5Kitpra4E1WJ07u5SOKaFrd2w0qua4', 'Registered', 0, 0, 18, '2010-06-17 16:40:15', '2010-07-26 15:17:32', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(86, 'acelada', 'acelada', 'a@mail.com', '0c420e71428c3e4bcbf87f083294c4a3:ZcmNNrW5P8oGIm30gb6SkCYK0BtRl8p6', 'Registered', 0, 0, 18, '2010-06-17 16:40:37', '2010-07-26 15:15:57', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(87, 'Clara Caminal', 'ccaminal', 'ccaminal@mail.com', '12db9e4322094fbf44c6df102e3d6fec:pKC3k29TeartysjhCC2B62Wx7RRM2KZQ', 'Registered', 0, 0, 18, '2010-08-23 14:32:33', '2010-08-23 14:34:15', '', 'language=\ntimezone=0\n\n'),
(88, 'Cristina Horcajada', 'chorcajada', 'chorcajada@mail.com', 'e204997cb036a3a85bdf33b966411efd:c3cwEEbPP8XGSLIO3iRkVzhsIzLcCZIk', 'Registered', 0, 0, 18, '2010-08-23 14:33:23', '2010-08-23 14:56:39', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=0\n\n'),
(89, 'flozano', 'flozano', 'flozano@mail.com', 'b4eae9c8278d088fec267c58d78c3197:jiQePuhBDvDuHDj4DnOnpTZCTCIFrLfh', 'Registered', 0, 0, 18, '2011-02-10 13:48:53', '2011-02-10 13:52:56', '', 'admin_language=\nlanguage=\neditor=\nhelpsite=\ntimezone=1\n\n'),
(90, 'Test5', 'test5', 'test5@gmail.com', '170c8ac47bf15e73499f50ff7e77e6cc:Ze8O3PHn41stUCCDQJXosHGLNLYCVCXS', 'Registered', 0, 0, 18, '2011-09-20 13:31:49', '2011-09-30 09:20:06', '', '\n');

-- --------------------------------------------------------

--
-- Table structure for table `jos_weblinks`
--

CREATE TABLE IF NOT EXISTS `jos_weblinks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(250) NOT NULL DEFAULT '',
  `alias` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(250) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(11) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  `params` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`,`published`,`archived`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `jos_weblinks`
--

INSERT INTO `jos_weblinks` (`id`, `catid`, `sid`, `title`, `alias`, `url`, `description`, `date`, `hits`, `published`, `checked_out`, `checked_out_time`, `ordering`, `archived`, `approved`, `params`) VALUES
(7, 2, 0, 'Demo', 'demo', 'http://demo.com', '', '2011-05-30 05:34:39', 0, 1, 0, '0000-00-00 00:00:00', 1, 0, 1, 'target=\n\n');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
