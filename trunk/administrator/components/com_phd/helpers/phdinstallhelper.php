<?php
  /**
   * Joomla! 1.5 component Science
   *
   * @version $Id: install.helper.php 2009-10-16 08:00:35 svn $
   * @author GPL@vui
   * @package Joomla
   * @subpackage Irbtools
   * @license GNU/GPL
   *
   * Scientific Production manager.
   *
   * This component file was created using the Joomla Component Creator by Not Web Design
   * http://www.notwebdesign.com/joomla_component_creator/
   *
   */
  
  // no direct access
  defined('_JEXEC') or die('Restricted access');
  
  /**
   * Phd Helper
   *
   * @package Joomla
   * @subpackage Phd
   * @since 1.5
   */
class JHTMLPhdInstallHelper
{
	function getVersionLocal()
	{
          // Código extraido de PhocaGallery
		$folder = JPATH_ADMINISTRATOR . DS . 'components' . DS . 'com_phd';
          if (JFolder::exists($folder)) {
              $xmlFilesInDir = JFolder::files($folder, '.xml$');
          } else {
  			$xmlFilesInDir = null;
          }
          
          $xml_items = '';
          if (count($xmlFilesInDir)) {
              foreach ($xmlFilesInDir as $xmlfile) {
                  if ($data = JApplicationHelper::parseXMLInstallFile($folder . DS . $xmlfile)) {
                      foreach ($data as $key => $value) {
                          $xml_items[$key] = $value;
                      }
                  }
              }
          }
          
          if (isset($xml_items['version']) && $xml_items['version'] != '')
          {
              $version['version'] = $xml_items['version'];
              $version['creationDate'] = $xml_items['creationdate'];
              $version['description'] = $xml_items['description'];
              return $version;
          } else {
              return '';
          }
      }
      
      function getVersionRemote()
      {
          //Código extraido de JFusion
          ob_start();
          $url = 'http://phdlacaixa.googlecode.com/svn/trunk/administrator/components/com_phd/phd.xml';
          
          if (function_exists('curl_init')) {
              //curl is the preferred function
              $crl = curl_init();
              $timeout = 5;
              curl_setopt($crl, CURLOPT_URL, $url);
              curl_setopt($crl, CURLOPT_RETURNTRANSFER, 1);
              curl_setopt($crl, CURLOPT_CONNECTTIMEOUT, $timeout);
              $JVersionRaw = curl_exec($crl);
              curl_close($crl);
          } else {
              //get the file directly if curl is disabled
              $JVersionRaw = file_get_contents($url);
              if (!strpos($JVersionRaw, '<install')) {
                  //file_get_content is often blocked by hosts, return an error message
                  echo JText::_('CURL_DISABLED_ERROR1');
                  return;
              }
          }
          
          $parser = JFactory::getXMLParser('Simple');
          
          if ($parser->loadString($JVersionRaw)) {
              if (isset($parser->document)) {
                  $JVersion = $parser->document;
              } else {
                  echo JText::_('CURL_DISABLED_ERROR2');
                  return;
              }
          }
          unset($parser);
          ob_end_clean();
          
          $version['version'] = $JVersion->version[0]->data();
          $version['creationDate'] = $JVersion->creationDate[0]->data();
          $version['description'] = $JVersion->description[0]->data();
          return $version;
      }
      
      function _sql($sql)
      {
          jimport('joomla.filesystem.file');
          
          $sql_file = JPATH_SITE . DS . 'administrator' . DS . 'components' . DS . 'com_phd' . DS . 'sql' . DS . $sql . '.sql';
          $sql_query = JFile::read($sql_file);
          $db =& JFactory::getDBO();
          $db->setQuery($sql_query);
          if (!$db->queryBatch()) {
              echo $db->stderr() . '<br/>';
          } else {
              $msg = '<table bgcolor="#d9f9e2" width ="100%"><tr style="height:30px"><td>';
              $msg = '<td><b>' . JText::_('SQL UPDATE SUCESS!') . ' ' . $sql . '</b></font></td></tr></table>';
              echo $msg;
          }
      }
      
      function sqldiff($local, $remote)
      {
          if ($local != null) {
              $files = JFolder::files(JPATH_SITE . DS . 'administrator' . DS . 'components' . DS . 'com_phd' . DS . 'sql');
              foreach ($files as $f) {
                  if (substr($f, 12, 1) == "") {
                      $actual = substr($f, 0, 8);
                      if (($actual > $local) && ($actual <= $remote)) {
                          JHTMLPhdInstallHelper::_sql($actual);
                      }
                  }
              }
          } else {
              foreach ($files as $f) {
                  if (substr($f, 12, 1) == "") {
                      JHTMLPhdInstallHelper::_sql($actual);
                  }
              }
          }
      }
         
          
      function datetosql($date)
      {
      	return substr($date, 6, 4) . substr($date, 3, 2) . substr($date, 0, 2);
      }
      
}
?>
