<?php
/**
 * Joomla! 1.5 component PhD
 *
 * @version $Id: view.raw.php 2009-10-16 08:00:35 svn $
 * @author GPL@vui
 * @package Joomla
 * @subpackage PhD
 * @license GNU/GPL
 *
 * PhD Programme manager.
 *
 * This component file was created using the Joomla Component Creator by Not Web Design
 * http://www.notwebdesign.com/joomla_component_creator/
 *
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport( 'joomla.application.component.view');
jimport('joomla.utilities.date');

ini_set( 'display_errors', 0 );
// the path /usr/share/php5/PEAR needed for opensuse servers
//ini_set( 'include_path', '.:./includes:./includes/PEAR:/usr/share/php5/PEAR' );

// PEAR include for generating Excel files
require_once( 'Spreadsheet/Excel/Writer.php' );

class PhdViewApplicants extends JView
{
	/**
	 * Constructor
	 *
	 * @since 1.5
	 */
	function __construct()
	{
		parent::__construct();
	}

	function display($tpl = null)
	{
		/*
		 * Excel generation using PEAR library
		 * Instructions to use the library:
		 * 1.- download the library from http://pear.php.net/package/Spreadsheet_Excel_Writer/download
		 * 2.- download the package OLE from http://pear.php.net/package/OLE/download
		 * 3.- add /usr/share/php5/PEAR (o /usr/share/php) in the variable include_path located
		 * in the file /etc/php5/apache2/php.int
		 * 4.- untar the libraries in /usr/share/php5/PEAR ( O /usr/share/php)
		 */
		
		$db =& JFactory::getDBO();
		
		// report rows
		$rows = array();
		$model =& JModel::getInstance( 'applicants', 'phdmodel' );
		$rows = $model->getExcelData();

		if (count($rows))
		{
			// create excel file
			$workbook = new Spreadsheet_Excel_Writer();
			$workbook->send("applicants_" . date("Ymd") . ".xls");
			
			$worksheet =& $workbook->addWorksheet( JText::_( 'Applicants' ) );
			$worksheet->write(0, 0, JText::_( 'Firstname' ));
			$worksheet->write(0, 1, JText::_( 'lastname' ));
			$worksheet->write(0, 2, JText::_( 'Country' ));
			$worksheet->write(0, 3, JText::_( 'Email' ));
			$worksheet->write(0, 4, JText::_( 'Birth date' ));
			$worksheet->write(0, 5, JText::_( 'Age' ));
			$worksheet->write(0, 6, JText::_( 'Where did you learn about us?' ));
			$worksheet->write(0, 7, JText::_( 'Recommendation letters' ));
			$worksheet->write(0, 8, JText::_( 'Programmes of choice' ));
			$worksheet->write(0, 9, JText::_( 'Submit date' ));
			$worksheet->write(0, 10, JText::_( 'Docs checked?' ));
			$worksheet->write(0, 11, JText::_( 'Missing docs' ));
			$worksheet->write(0, 12, JText::_( 'Academic comments' ));
			$worksheet->write(0, 13, JText::_( 'Applicant contacted?' ));
			$worksheet->write(0, 14, JText::_( 'Applicant contacted date' ));
			$worksheet->write(0, 15, JText::_( 'Indian?' ));
			$worksheet->write(0, 16, JText::_( 'Indian info' ));
			$worksheet->write(0, 17, JText::_( 'Scientific discipline' ));
				
			$i = 2; // line index
			foreach( $rows as $row )
			{
				$submit_date =& JFactory::getDate($row->submit_date);
				$applicant_contacted_date =& JFactory::getDate($row->applicant_contacted_date);
				
				/*
				 * 2012-12-03. Roberto. Modificado el texto que ponemos en el fichero.
				 */
				// reference letters status
				$query2 = "SELECT filename"
				. " FROM #__phd_referees"
				. " WHERE applicant_id = $row->id"
				;
				$db->setQuery($query2);
				$files = $db->loadObjectList();
				$str_files = '';
				foreach( $files as $file) {
					if ($file->filename == NULL) {
						$str_files .= "No" . ", ";
					} else {
						$str_files .= "Yes" . ", ";
					}
				}
				$str_files = substr($str_files, 0, -2); // remove the last two caracters
				/*
				 * 2012-12-03. Roberto. Fin de modificación.
				 */
				
				//programmes of choice
				$query3 = "SELECT p.description"
				. " FROM #__phd_programmes p, #__phd_applicant_programme a"
				. " WHERE a.applicant_id = $row->id"
				. " AND a.programme_id = p.id"
				;
				$db->setQuery($query3);
				$programmes = $db->loadObjectList();
				$str_pro = '';
				foreach( $programmes as $programme) {
					$str_pro .= $programme->description . ", ";
				}
				$str_pro = substr($str_pro, 0, -2); // remove the last two caracters
				
				// calculate age
				$age = $this->calculateAge($row->birth_date);

				// writing the line
				$worksheet->write( $i, 0, $row->firstname );
				$worksheet->write( $i, 1, $row->lastname );
				$worksheet->write( $i, 2, $row->printable_name );
				$worksheet->write( $i, 3, $row->email );
				$worksheet->write( $i, 4, $row->birth_date );
				$worksheet->write( $i, 5, $age );
				$worksheet->write( $i, 6, $row->wheredidu );
				$worksheet->write( $i, 7, $str_files );
				$worksheet->write( $i, 8, $str_pro );
				$worksheet->write( $i, 9, $submit_date->toFormat('%d/%m/%Y') );
				$worksheet->write( $i, 10, (($row->docs_checked)? 'Yes' : 'No' ));
				$worksheet->write( $i, 11, $row->missing_docs );
				$worksheet->write( $i, 12, $row->academic_comments );
				$worksheet->write( $i, 13, (($row->applicant_contacted)? 'Yes' : 'No' ));
				$worksheet->write( $i, 14, $applicant_contacted_date->toFormat('%d/%m/%Y') );
				$worksheet->write( $i, 15, (($row->indian)? 'Yes' : 'No' ));
				$worksheet->write( $i, 16, $row->indian_info );
				$worksheet->write( $i, 17, $row->scientific_discipline );
				
				$i++;				
			}

			// close excel file
			$workbook->close();
			die;
		}
	}
	
	// calculate age
	function calculateAge($birthday)
	{   
		return floor((time() - strtotime($birthday))/31556926);
	}
}
?>