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
ini_set( 'include_path', '.:./includes' );

// PEAR include for generating Excel files
require_once("PHPExcel.php");

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
			
			$workbook = new PHPExcel();
			$workbook->getActiveSheet()
				->setCellValueByColumnAndRow(0, 1, JText::_( 'Firstname' ))
				->setCellValueByColumnAndRow(1, 1, JText::_( 'lastname' ))
				->setCellValueByColumnAndRow(2, 1, JText::_( 'Country' ))
				->setCellValueByColumnAndRow(3, 1, JText::_( 'Email' ))
				->setCellValueByColumnAndRow(4, 1, JText::_( 'Birth date' ))
				->setCellValueByColumnAndRow(5, 1, JText::_( 'Age' ))
				->setCellValueByColumnAndRow(6, 1, JText::_( 'Where did you learn about us?' ))
				->setCellValueByColumnAndRow(7, 1, JText::_( 'Recommendation letters' ))
				->setCellValueByColumnAndRow(8, 1, JText::_( '1st Programme of choice' ))
				->setCellValueByColumnAndRow(9, 1, JText::_( '2nd Programme of choice' ))				
				->setCellValueByColumnAndRow(10, 1, JText::_( 'Submit date' ))
				->setCellValueByColumnAndRow(11, 1, JText::_( 'Docs checked?' ))
				->setCellValueByColumnAndRow(12, 1, JText::_( 'Missing docs' ))
				->setCellValueByColumnAndRow(13, 1, JText::_( 'Academic comments' ))
				->setCellValueByColumnAndRow(14, 1, JText::_( 'Applicant contacted?' ))
				->setCellValueByColumnAndRow(15, 1, JText::_( 'Applicant contacted date' ))
				->setCellValueByColumnAndRow(16, 1, JText::_( 'Indian?' ))
				->setCellValueByColumnAndRow(17, 1, JText::_( 'Indian info' ))
				->setCellValueByColumnAndRow(18, 1, JText::_( 'Gender' ))
				->setCellValueByColumnAndRow(19, 1, JText::_( 'Scientific discipline' ));
				
			$i = 2; // line index
			foreach( $rows as $row )
			{
				$submit_date =& JFactory::getDate($row->submit_date);
				$birth_date =& JFactory::getDate($row->birth_date);
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
				
				/*
				 * 2015-03-06 Roberto Añado dos columnas con la primera y la segunda opción
				 */
				
				// programmes of choice
				$query3 = 'SELECT pro.description'
				. ' FROM #__phd_programmes AS pro'
				. ' LEFT JOIN #__phd_applicant_programme AS ap ON ap.programme_id = pro.id'
				. ' WHERE ap.applicant_id = \'' . $row->id . '\''
				. ' ORDER BY ap.`order` ASC'
				;
				$db->setQuery($query3);				
				$programmes = $db->loadObjectList();
				
				$pro = array();
				$i = 1;
				foreach( $programmes as $programme) {
					$pro[$i] = $programme;
					$i++;
				}
				
				// calculate age
				$age = $this->calculateAge($row->birth_date);

				// writing the line
				$workbook->getActiveSheet()
					->setCellValueByColumnAndRow( 0, $i, $row->firstname )
					->setCellValueByColumnAndRow( 1, $i, $row->lastname )
					->setCellValueByColumnAndRow( 2, $i, $row->printable_name )
					->setCellValueByColumnAndRow( 3, $i, $row->email )
					->setCellValueByColumnAndRow( 4, $i, $birth_date->toFormat('%d/%m/%Y') )
					->setCellValueByColumnAndRow( 5, $i, $age )
					->setCellValueByColumnAndRow( 6, $i, $row->wheredidu )
					->setCellValueByColumnAndRow( 7, $i, $str_files )
					->setCellValueByColumnAndRow( 8, $i, (($pro[1]->description)? $pro[1]->description : '' ))
					->setCellValueByColumnAndRow( 9, $i, (($pro[2]->description)? $pro[2]->description : '' ))					
					->setCellValueByColumnAndRow( 10, $i, $submit_date->toFormat('%d/%m/%Y') )
					->setCellValueByColumnAndRow( 11, $i, (($row->docs_checked)? 'Yes' : 'No' ))
					->setCellValueByColumnAndRow( 12, $i, $row->missing_docs )
					->setCellValueByColumnAndRow( 13, $i, $row->academic_comments )
					->setCellValueByColumnAndRow( 14, $i, (($row->applicant_contacted)? 'Yes' : 'No' ))
					->setCellValueByColumnAndRow( 15, $i, $applicant_contacted_date->toFormat('%d/%m/%Y') )
					->setCellValueByColumnAndRow( 16, $i, (($row->indian)? 'Yes' : 'No' ))
					->setCellValueByColumnAndRow( 17, $i, $row->indian_info )
					->setCellValueByColumnAndRow( 18, $i, $row->gender )
					->setCellValueByColumnAndRow( 19, $i, $row->scientific_discipline );
				
				$i++;				
			}

			// set worksheet name
			$workbook->getActiveSheet()->setTitle('Applicants');
			// set filename
			// set active sheet index to the first sheet, so Excel opens this as the first sheet
			$workbook->setActiveSheetIndex(0);
			// set column autodimension
			$sheet = $workbook->getActiveSheet();
			$cellIterator = $sheet->getRowIterator()->current()->getCellIterator();
			$cellIterator->setIterateOnlyExistingCells( true );
			foreach( $cellIterator as $cell ) {
        			$sheet->getColumnDimension( $cell->getColumn() )->setAutoSize( true );
			}
			// Redirect output to a client web browser (Excel5)
			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename="applicants_'.date(Ymd).'.xls"');
			header('Cache-Control: max-age=0');
			$writer = PHPExcel_IOFactory::createWriter($workbook, 'Excel5');
			$writer->save('php://output');
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
