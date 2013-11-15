<?php

// Check to ensure this file is included in Joomla!
defined('_JEXEC') or die( 'Restricted access' );

jimport('joomla.application.component.controller');
jimport('joomla.utilities.date');
jimport('joomla.filesystem.file');
jimport('joomla.mail.mail');
jimport('joomla.methods');
jimport('joomla.error.log' );

/**
 * Applicant Controller
 *
 * @package		Joomla
 * @subpackage	Science
 */
class PhdControllerApplicant extends JController
{

	/**
	 * Display data
	 *
	 * @since	1.5
	 */
	function display() {
		JRequest::setVar( 'view', 'applicant' );
		parent::display();
	}

	/**
	 * Save personal data
	 *
	 * @since	1.5
	 */
	function save_personal_data()
	{
		global $mainframe;

		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );

		$model =& $this->getModel('applicant');
		$user =& JFactory::getUser();

		//get data from the request
		$post = JRequest::get( 'post' );
		
		// before creating anything we check the age
		// Roberto 18/10/2011
		// 
		if (isset($post['birth_date']))
		{
			$apply_details = JHTML::_('phdhelper.canApplyBirthDate', $post['birth_date']);
			if ($apply_details->disabled == 'disabled')
			{
				$mainframe->enqueueMessage( $apply_details->message );
				parent::display();
				return;
			}			
		}
		
		if (!isset($post['id'])){ //If no user, we create it with editing status
			$data['user_username'] = $user->username;
			$data['status_id'] = '1';                     
			$post['id'] = $model->savePersonalData($data);
                        
                        // 2013-11-22 SIBEOS cambio
                        $data['id'] = $post['id'];
                        $data['directory'] = $post['id'].'-'.mt_rand(100000, 999999);
                        $model->savePersonalData($data);
		}

		$params =& $mainframe->getParams();
		$phdConfig_DocsPath = $params->get('phdConfig_DocsPath');
		$phdConfig_Application = $params->get('phdConfig_Application');
               
		if (isset($post['additional_info'])) {
			$post['additional_info'] = JRequest::getVar('additional_info', '', 'post', 'string', JREQUEST_ALLOWRAW);
			$active_tab = ($phdConfig_Application== '1')?6:8;
		}
		if (isset($post['phd_thesis'])) {
			$post['phd_thesis'] = JRequest::getVar('phd_thesis', '', 'post', 'string', JREQUEST_ALLOWRAW);
			$active_tab = 4;
		}
		if (isset($post['expected_lecture'])) {
			$post['expected_lecture'] = JRequest::getVar('expected_lecture', '', 'post', 'string', JREQUEST_ALLOWRAW);
			$active_tab = 4;
		}
		if (isset($post['research_experience'])) {
			$post['research_experience'] = JRequest::getVar('research_experience', '', 'post', 'string', JREQUEST_ALLOWRAW);
			$active_tab = 5;
		}
		if (isset($post['ethical_issue_text'])) {
			$post['ethical_issue_text'] = JRequest::getVar('ethical_issue_text', null, 'post', 'string', JREQUEST_ALLOWRAW);
			$active_tab = 7;
		}

		if (isset($post['other_fellowships_text'])) {
			$post['other_fellowships_text'] = JRequest::getVar('other_fellowships_text', null, 'post', 'string', JREQUEST_ALLOWRAW);
			$active_tab = 0;
		}
		if (isset($post['career_breaks_text'])) {
			$post['career_breaks_text'] = JRequest::getVar('career_breaks_text', null, 'post', 'string', JREQUEST_ALLOWRAW);
			$active_tab = 0;
		}

		$file = JRequest::getVar('uploaded_file', '', 'FILES', 'array');

		if ((isset($file['name'])) && (!$file['error'])) {
                    
			$model =& $this->getModel('applicant');
			$model->setId($post['id']);
			$applicant =& $model->getData();
                        
			$file['name']  = JFile::makeSafe($file['name']);
			//$filepath = JPath::clean(JPATH_ROOT.DS.$phdConfig_DocsPath.DS.$post['id'].DS.$file['name']);
                        $filepath = JPath::clean($phdConfig_DocsPath.DS.$applicant->directory.DS.$file['name']);
                      
			if (JFile::exists($filepath)) {
				//$active_tab = ($phdConfig_Application== '1')?6:8;
				JRequest::setVar('active_tab', $active_tab );
				$mainframe->enqueueMessage( JText::_('FILE_EXISTS') , 'error');
				parent::display();
				return;
			}

			if (!JFile::upload($file['tmp_name'], $filepath)){
				//handle failed upload
				return;
			}

			//remove old file
			if ($applicant->career_breaks_filename){
				//$filepath_to_delete = JPath::clean(JPATH_ROOT.DS.$phdConfig_DocsPath.DS.$post['id'].DS.$applicant->career_breaks_filename);
                                $filepath_to_delete = JPath::clean($phdConfig_DocsPath.DS.$applicant->directory.DS.$applicant->career_breaks_filename);
				if (!JFile::delete($filepath_to_delete)) {
					//$active_tab = ($phdConfig_Application== '1')?6:8;
					JRequest::setVar('active_tab', $active_tab );
					$mainframe->enqueueMessage( JText::_('ERROR_DELETING_FILE') , 'error');
					return;
				}
			}

			$post['career_breaks_filename'] = $file['name'];
		}

		// this is the new file treatment for additional information
		$file_additional = JRequest::getVar('additional_file', '', 'FILES', 'array');
		if ((isset($file_additional['name'])) && (!$file_additional['error'])) {
                    
			$model =& $this->getModel('applicant');
			$model->setId($post['id']);
			$applicant =& $model->getData();
                    
			$active_tab = ($phdConfig_Application== '1')?6:8;
			$file_additional['name']  = JFile::makeSafe($file_additional['name']);
			//$filepath = JPath::clean(JPATH_ROOT.DS.$phdConfig_DocsPath.DS.$post['id'].DS.$file_additional['name']);
                        $filepath = JPath::clean($phdConfig_DocsPath.DS.$applicant->directory.DS.$file['name']);

			if (JFile::exists($filepath)) {
				JRequest::setVar('active_tab', $active_tab );
				$mainframe->enqueueMessage( JText::_('FILE_EXISTS') , 'error');
				parent::display();
				return;
			}

			if (!JFile::upload($file_additional['tmp_name'], $filepath)){
				//handle failed upload
				return;
			}

			//remove old file
			if ($applicant->additional_info_filename){
				//$filepath_to_delete = JPath::clean(JPATH_ROOT.DS.$phdConfig_DocsPath.DS.$post['id'].DS.$applicant->additional_info_filename);
                                $filepath_to_delete = JPath::clean($phdConfig_DocsPath.DS.$applicant->directory.DS.$applicant->additional_info_filename);

				if (!JFile::delete($filepath_to_delete)) {
					JRequest::setVar('active_tab', $active_tab );
					$mainframe->enqueueMessage( JText::_('ERROR_DELETING_FILE') , 'error');
					return;
				}
			}

			$post['additional_info_filename'] = $file_additional['name'];
		}

		// store data. the function returns the saved id
		$applicant_id = $model->savePersonalData($post);

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant_id );
		JRequest::setVar('active_tab', $active_tab );

		if ($applicant_id) {
			$mainframe->enqueueMessage( JText::_('APPLICANT_STORE_OK') );
			parent::display();
		} else {
			$mainframe->enqueueMessage( JText::_('APPLICANT_STORE_KO') , 'error');
			parent::display();
			return false;
		}
	}

	/**
	 * Save academic data
	 *
	 * @since	1.5
	 */
	function save_academic_data() {
		global $mainframe;

		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );
		//get data from the request
		$post = JRequest::get( 'post' );

		// store academic data
		$model =& $this->getModel('applicant');
		$applicant_id = $post['id'];
		$data['applicant_id'] = $applicant_id;
		$data['type'] = $post['type'];
		$data['degree'] = $post['degree'];
		$data['university'] = $post['university'];
		$data['institution'] = $post['institution'];
		$data['start_date'] = $post['start_date'];
		$data['end_date'] = $post['end_date'];
		$data['country_id'] = $post['country_id'];
		$data['director_name'] = $post['director_name'];
		$data['ongoing'] = ($post['ongoing']=='Yes')?true:false;;

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant_id );
		JRequest::setVar('active_tab', '1' );

		// check dates
		/*if ($data['end_date'] >= $data['start_date']) {
			$mainframe->enqueueMessage( JText::_('ACADEMIC_DATA_DATE_KO') , 'error');
			parent::display();
			return false;
			}*/

		// ok, save it
		$store = $model->saveAcademicData($data);

		if ($store) {
			$mainframe->enqueueMessage( JText::_('ACADEMIC_DATA_STORE_OK') );
			parent::display();
		} else {
			$mainframe->enqueueMessage( JText::_('ACADEMIC_DATA_STORE_KO') , 'error');
			parent::display();
			return false;
		}
	}

	/**
	 * Delete academic data
	 *
	 * @since	1.5
	 */
	function del_academic_data() {
		global $mainframe;

		//get data from the request
		$get = JRequest::get( 'get' );

		// store data. the function returns the saved id
		$model =& $this->getModel('applicant');
		$applicant_id = $get['id'];
		$store = $model->deleteAcademicData($get['academic_data_id']);

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant_id );
		JRequest::setVar('active_tab', '1' );

		if ($store) {
			$mainframe->enqueueMessage( JText::_('DEGREE_DELETION_OK') );
			parent::display();
		} else {
			$mainframe->enqueueMessage( JText::_('DEGREE_DELETION_KO') , 'error');
			parent::display();
			return false;
		}
	}

	/**
	 * Save work experience
	 *
	 * @since	1.5
	 */
	function save_work_experience() {
		global $mainframe;

		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );
		//get data from the request
		$post = JRequest::get( 'post' );

		// store data. the function returns the saved id
		$model =& $this->getModel('applicant');
		$applicant_id = $post['id'];
		$data['experience'] = $post['work_experience'];
		$data['applicant_id'] = $applicant_id;
		$store = $model->saveWorkExperience($data);

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant_id );
		JRequest::setVar('active_tab', '4' );

		if ($store) {
			$mainframe->enqueueMessage( JText::_('WORKEXPERIENCE_STORE_OK') );
			parent::display();
		} else {
			$mainframe->enqueueMessage( JText::_('WORKEXPERIENCE_STORE_KO') , 'error');
			parent::display();
			return false;
		}
	}

	/**
	 * Delete work experience
	 *
	 * @since	1.5
	 */
	function del_work_experience() {
		global $mainframe;

		//get data from the request
		$get = JRequest::get( 'get' );

		// store data. the function returns the saved id
		$model =& $this->getModel('applicant');
		$applicant_id = $get['id'];
		$store = $model->deleteWorkExperience($get['work_experience_id']);

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant_id );
		JRequest::setVar('active_tab', '4' );

		if ($store) {
			$mainframe->enqueueMessage( JText::_('WORK_EXPERIENCE_DELETION_OK') );
			parent::display();
		} else {
			$mainframe->enqueueMessage( JText::_('WORK_EXPERIENCE_DELETION_KO') , 'error');
			parent::display();
			return false;
		}
	}



	/**
	 * Save programmes choosen by the applicant
	 *
	 * @return TRUE, FALSE
	 */
	function save_programmes()
	{
		global $mainframe;

		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );

		$params =& $mainframe->getParams();
		$phdConfig_Application = $params->get('phdConfig_Application');
		$active_tab = ($phdConfig_Application== '1')?5:6;

		//get data from the request
		$post = JRequest::get( 'post' );

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $post['id'] );
		JRequest::setVar('active_tab', $active_tab );

		if($post['first_option_id'] == $post['second_option_id']){
			$mainframe->enqueueMessage( JText::_('BOTH_PROGRAMMES_ARE_EQUAL_KO') , 'error');
			parent::display();
			return;
		}

		// aux variable
		$data = new stdClass();

		// model
		$model =& $this->getModel('applicant');
		$data->applicant_id = $post['id'];
		// cleaning previous data
		$model->deleteProgrammes($data);

		// saving first option
		$data->programme_id = JRequest::getVar('first_option_id', '', 'post', 'string', JREQUEST_ALLOWRAW);
		$data->order = 1;
		if (!$model->saveProgramme($data))
		{
			$mainframe->enqueueMessage( JText::_('SAVE_PROGRAMME_KO') , 'error');
			parent::display();
			return false;
		}

		// saving second option
		$data->programme_id = JRequest::getVar('second_option_id', '', 'post', 'string', JREQUEST_ALLOWRAW);
		$data->order = 2;
		if (!$model->saveProgramme($data))
		{
			$mainframe->enqueueMessage( JText::_('SAVE_PROGRAMME_KO') , 'error');
			parent::display();
			return false;
		}

		$mainframe->enqueueMessage( JText::_('SAVE_PROGRAMME_OK') );
		parent::display();

		//$msg = JText::_('SAVE_PROGRAMME_OK');
		//$this->setRedirect('index.php?option=com_phd&view=applicant', $msg);
	}

	/**
	 * Save doc file
	 *
	 * @since	1.5
	 */
	function save_file()
	{
		global $mainframe;
		$params =& $mainframe->getParams();

		$phdConfig_DocsPath = $params->get('phdConfig_DocsPath');
                        
		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );
		//get data from the request
		$post = JRequest::get( 'post' );
		$file = JRequest::getVar('uploaded_file', '', 'FILES', 'array');
		$file['name']  = JFile::makeSafe($file['name']);
                
                $model =& $this->getModel('applicant');
		$model->setId($post['id']);
		$applicant =& $model->getData();
                
		//$filepath = JPath::clean(JPATH_ROOT.DS.$phdConfig_DocsPath.DS.$post['id'].DS.$file['name']);
                $filepath = JPath::clean($phdConfig_DocsPath.DS.$applicant->directory.DS.$file['name']);
               
		if (JFile::exists($filepath)) {
			JRequest::setVar('active_tab', '2' );
			$mainframe->enqueueMessage( JText::_('FILE_EXISTS') , 'error');
			parent::display();
			return;
		}

		if (!JFile::upload($file['tmp_name'], $filepath)) {
			//handle failed upload
			return;
		}

		// store data. the function returns the saved id
		//$model =& $this->getModel('applicant');
		$applicant_id = $post['id'];
		$data['description'] = $post['description'];
		$data['doc_type_id'] = $post['doc_type_id'];
		$data['filename'] = $file['name'];
		$data['applicant_id'] = $applicant_id;
		$store = $model->saveFile($data);

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant_id );
		JRequest::setVar('active_tab', '2' );

		if ($store) {
			$mainframe->enqueueMessage( JText::_('FILE_STORE_OK') );
			parent::display();
			return true;
		} else {
			$mainframe->enqueueMessage( JText::_('FILE_STORE_KO') , 'error');
			parent::display();
			return false;
		}
	}

	/**
	 * Delete document
	 *
	 * @since	1.5
	 */
	function del_file() {
		global $mainframe;

		//get data from the request
		$get = JRequest::get( 'get' );

		// store data. the function returns the saved id
		$model =& $this->getModel('applicant');
		$applicant_id = $get['id'];
		$store = $model->deleteFile($get['file_id']);

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant_id );
		JRequest::setVar('active_tab', '2' );

		if ($store) {
			$mainframe->enqueueMessage( JText::_('FILE_DELETION_OK') );
			parent::display();
			return true;
		} else {
			$mainframe->enqueueMessage( JText::_('FILE_DELETION_KO') , 'error');
			parent::display();
			return false;
		}
	}

	/**
	 * Save referee
	 *
	 * @since	1.5
	 */
	function save_referee()
	{
		global $mainframe;

		$params =& $mainframe->getParams();
		$phdConfig_DocsPath = $params->get('phdConfig_DocsPath');
		$phdConfig_InvalidEmailProviders = $params->get('phdConfig_InvalidEmailProviders');
		
		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );

		//get data from the request
		$post = JRequest::get( 'post' );
		$file = JRequest::getVar('uploaded_file', '', 'FILES', 'array');

                $model =& $this->getModel('applicant');
		$model->setId($post['id']);
		$applicant =& $model->getData();
                
		// roberto 2011-09-21 No se admiten cuentas de correo de ciertos proveedores.
		// Peticion de Patricia Nadal
		$phdConfig_InvalidEmailProviders = str_replace(" ", "", $phdConfig_InvalidEmailProviders);
		$providers = explode(",", $phdConfig_InvalidEmailProviders);
		foreach ($providers as $provider)
		{
			$invalid = strpos($post['email'], $provider);
			if ($invalid !== false) {
				$mainframe->enqueueMessage( JText::_('REFEREE_EMAIL_NOT_VALID') , 'error');
				parent::display();
				return false;
			}
		}

		// upload the file
		if (isset($file['name']))
		{
			$file['name']  = JFile::makeSafe($file['name']);
			$filepath = JPath::clean($phdConfig_DocsPath.DS.$applicant->directory.DS.$file['name']);

			if (JFile::exists($filepath)) {
				$mainframe->enqueueMessage( JText::_('FILE_EXISTS') , 'error');
				return;
			}

			if (!JFile::upload($file['tmp_name'], $filepath)) {
				//handle failed upload
				return;
			}

			//remove old file if exists
			if (isset($post['old_filename'])){
				$filepath_to_delete = JPath::clean($phdConfig_DocsPath.DS.$applicant->directory.DS.$post['old_filename']);
				if (!JFile::delete($filepath_to_delete)) {
					$mainframe->enqueueMessage( JText::_('FILE_DELETION_KO') , 'error');
					return;
				}
			}
			$data['filename'] = $file['name'];
		}

		$data['firstname'] = $post['firstname'];
		$data['lastname'] = $post['lastname'];
		$data['email'] = $post['email'];
		$data['applicant_id'] = $post['id'];
		$data['upload_code'] = mt_rand();

		// store data. the function returns the saved id
		$model =& $this->getModel('applicant');
		$applicant_id = $post['id'];

		//if no sending file and not existing file send mail with generated code
		/*
		 $model->setId($applicant_id);
		 $applicant =& $model->getData();
		 if (!isset($file['name']))
		 {
			// get the mail subject and body from the configuration file
			$message = new stdClass();
			$message->subject = $params->get('phdConfig_EmailRefereeSubject');
			$message->body = $params->get('phdConfig_EmailRefereeBody');
				
			$message_text = str_replace("#name#", $applicant->firstname . " " . $applicant->lastname, $message->body);
			$message_text = str_replace("#code#", $data['upload_code'], $message_text);
			$message_text .= "<a href='http://phd.gplavui.com/index.php?option=com_phd&view=referee&upload_code=".$data['upload_code']."'>Click here to upload the file</a>";
			$mailer =& JFactory::getMailer();

			$mailer->setSender(array($params->get('phdConfig_AdminEmail'), $params->get('phdConfig_AdminName')));
			$mailer->setSubject($message->subject);
			$mailer->setBody($message_text);
			$mailer->IsHTML(0);

			// Add recipients
			$mailer->addRecipient($data['email']);

			//if ($mailer->Send())
			if (true)
			{
			$mainframe->enqueueMessage( JText::_('MAIL_CORRECTLY_SEND') );

			// saving the log file register
			$log_model =& $this->getModel('log');
			$logdata = array();
			$logdata['applicant_id'] = $applicant_id;
			$logdata['text'] = $message_text;
			$logdata['old_status_id'] = '';
			$logdata['new_status_id'] = '';
			$auxlog = $log_model->store($logdata);
			if (!$auxlog) {
			$msg = JText::_('REFEREE_STORE_KO');
			$this->setRedirect('index.php?option=com_phd', $msg);
			}
			} else {
			$msg = JText::_('MAIL_UNCORRECTLY_SEND');
			$this->setRedirect('index.php?option=com_phd', $msg);
			}
			}
			*/

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant_id );
		JRequest::setVar('active_tab', '3' );

		if ($model->saveReferee($data)) {
			$mainframe->enqueueMessage( JText::_('REFEREE_STORE_OK') );
			parent::display();
			return true;
		} else {
			$mainframe->enqueueMessage( JText::_('REFEREE_STORE_KO') , 'error');
			parent::display();
			return false;
		}
	}

	/**
	 * Delete referee
	 *
	 * @since	1.5
	 */
	function del_referee() {
		global $mainframe;

		//get data from the request
		$get = JRequest::get( 'get' );

		// store data. the function returns the saved id
		$model =& $this->getModel('applicant');
		$applicant_id = $get['id'];

		$store = $model->deleteReferee($get['referee_id']);

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant_id );
		JRequest::setVar('active_tab', '3' );

		if ($store) {
			$mainframe->enqueueMessage( JText::_('REFEREE_DELETION_OK') );
			parent::display();
			return true;
		} else {
			$mainframe->enqueueMessage( JText::_('REFEREE_DELETION_KO') , 'error');
			parent::display();
			return false;
		}
	}



	/**
	 * Save ethical issues
	 *
	 * @return TRUE, FALSE
	 */
	function save_ethical_issues()
	{
		global $mainframe;

		// Check for request forgeries
		JRequest::checkToken() or jexit( 'Invalid Token' );

		$params =& $mainframe->getParams();
		$phdConfig_Application = $params->get('phdConfig_Application');
		$active_tab = ($phdConfig_Application== '1')?6:7;

		//get data from the request
		$post = JRequest::get( 'post' );

		JRequest::setVar('view', 'applicant');
		JRequest::setVar('id', $post['id']);
		JRequest::setVar('active_tab', $active_tab );

		// aux variable
		$data = new stdClass();

		// model
		$model =& $this->getModel('applicant');
		$data->id = $post['id']; // needed for savePersonalData
		$data->applicant_id = $post['id']; // needed for deleteEthicalIssues
		$data->ethical_issue = $post['ethical_issue'];
		// save ethical isssue yes/no
		$model->savePersonalData($data);

		// cleaning previous data stored in the db
		$model->deleteEthicalIssues($data);

		// saving options
		if ( count($post['ei']) )
		{
			foreach ($post['ei'] as $item)
			{
				if (!$model->saveEthicalIssue($post['id'], $item))
				{
					$mainframe->enqueueMessage( JText::_('SAVE_ETHICAL_ISSUE_KO') , 'error');
					parent::display();
					return false;
				}
			}
		}
			
		$mainframe->enqueueMessage( JText::_('SAVE_ETHICAL_ISSUE_OK') );
		parent::display();
	}



	/**
	 * Change status, check that the change is needed and log the change
	 *
	 * @return bool True if done
	 */
	function change_status()
	{
		global $mainframe;

		$params =& $mainframe->getParams();
		$phdConfig_Application = $params->get('phdConfig_Application');

		// active tab
		$active_tab = ($phdConfig_Application== '1')?7:8;

		//get data from the request
		$post = JRequest::get( 'post' );

		// store data. the function returns the saved id
		$model =& $this->getModel('applicant');
		$model->setId( $post['id'] );
		$applicant =& $model->getData();
		$old_status_id = $applicant->status_id;
		$new_status_id = $post['status_id'];

		$store = $model->saveStatus($new_status_id);

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant->id );
		JRequest::setVar('active_tab', $active_tab );

		if (!$store) {
			$mainframe->enqueueMessage( JText::_('CHANGE_STATUS_KO') , 'error');
			parent::display();
			return false;
		}

		$send_mail = (isset($post['send_mail']))?$post['send_mail']:null;

		if ($send_mail == 'yes')
		{
			$message = JHTML::_('phdhelper.getMessage', $new_status_id);
			$message_text = str_replace("#name#", $applicant->firstname . " " . $applicant->lastname, $message->mail_body);
				
			$mailer =& JFactory::getMailer();

			$mailer->setSender(array($phdConfig_AdminEmail, $phdConfig_AdminName));
			$mailer->setSubject($message->mail_subject);
				
			$mailer->setBody($message_text);
			$mailer->IsHTML(0);

			// Add recipients
			$mailer->addRecipient($applicant->email);

			// sending
			if (!$mailer->Send())
			{
				// login the error
				$log_model =& $this->getModel('log');
				$logdata = array();
				$logdata['applicant_id'] = $applicant->id;
				$logdata['text'] =  JText::_('ERROR_LOG_HEADER') . $message_text;
				$logdata['old_status_id'] = $old_status_id;
				$logdata['new_status_id'] = $new_status_id;
				if (!$log_model->store($logdata)) {
					$mainframe->enqueueMessage( JText::_('LOG_STORE_KO') , 'error');
					parent::display();
					return false;
				}
				// message
				$mainframe->enqueueMessage( JText::_('MAIL_UNCORRECTLY_SEND') , 'error');
				parent::display();
				return false;
			} else {

				// login the mail
				$log_model =& $this->getModel('log');
				$logdata = array();
				$logdata['applicant_id'] = $applicant->id;
				$logdata['text'] = $message_text;
				$logdata['old_status_id'] = $old_status_id;
				$logdata['new_status_id'] = $new_status_id;
				if (!$log_model->store($logdata)) {
					$mainframe->enqueueMessage( JText::_('LOG_STORE_KO') , 'error');
					parent::display();
					return false;
				}
			}
		}
			
		$mainframe->enqueueMessage( JText::_('CHANGE_STATUS_OK') );
		parent::display();
		//$msg = JText::_('CHANGE_STATUS_OK');
		//$this->setRedirect('index.php?option=com_phd&view=applicant&id='.$applicant->id, $msg);
	}

	/**
	 * Submit application. Check that application data, degree, cv, motivation letter, academic records, referes and selected program exists
	 *
	 * @return bool True if done
	 */
	function submit_application()
	{
		global $mainframe, $mosConfig_live_site;

		$params =& $mainframe->getParams();
		$phdConfig_Application = $params->get('phdConfig_Application');

		//get data from the request
		$post = JRequest::get( 'post' );
		$applicant_id = $post['id'];

		JRequest::setVar('view', 'applicant' );
		JRequest::setVar('id', $applicant_id );

		$closing_time = JFactory::getDate(strtotime($params->get('phdConfig_ClosingDateTime')));
		$now = JFactory::getDate();
		if( $closing_time->toUnix() < $now->toUnix() ) {
			$mainframe->enqueueMessage( JText::_('TOO_LATE') , 'error' );
			$active_tab = ($phdConfig_Application== '1')?6:8;
			JRequest::setVar('active_tab', $active_tab );
			parent::display();
			return false;
		}

		if (!JHTML::_('phdhelper.applicationDataExists',$applicant_id)){
			$mainframe->enqueueMessage( JText::_('NO_PERSONAL_DATA') , 'error' );
			JRequest::setVar('active_tab', '0' );
			parent::display();
			return false;
		}

		if (!JHTML::_('phdhelper.degreeExists',$applicant_id)){
			$mainframe->enqueueMessage( JText::_('NO_DEGREES') , 'error');
			JRequest::setVar('active_tab', '1' );
			parent::display();
			return false;
		}

		if (!JHTML::_('phdhelper.cvExists',$applicant_id)){
			$mainframe->enqueueMessage( JText::_('NO_CV') , 'error' );
			JRequest::setVar('active_tab', '2' );
			parent::display();
			return false;
		}

		if (!JHTML::_('phdhelper.motivationLetterExists',$applicant_id)){
			$mainframe->enqueueMessage( JText::_('NO_MOTIVATION_LETTER') , 'error' );
			JRequest::setVar('active_tab', '2' );
			parent::display();
			return false;
		}

		if (!JHTML::_('phdhelper.academicRecordsExists',$applicant_id)){
			$mainframe->enqueueMessage( JText::_('NO_ACADEMIC_RECORD') , 'error' );
			JRequest::setVar('active_tab', '2' );
			parent::display();
			return false;
		}

		/* Roberto 2012-12-11 No check
		 * Cambio pedido por Patricia
		if (!JHTML::_('phdhelper.eligibilityFormExists',$applicant_id)){
			$mainframe->enqueueMessage( JText::_('NO_ELIGIBILITY_FORM') , 'error' );
			JRequest::setVar('active_tab', '2' );
			parent::display();
			return false;
		}
		   Fin de cambios
		 */
		
		/*
		 // Only check for postdocs
		 if ($params->get('phdConfig_Application') == '2')
		 {
			if (!JHTML::_('phdhelper.listPublicationsExists',$applicant_id)){
			$mainframe->enqueueMessage( JText::_('NO_LISTPUB_RECORD') , 'error' );
			JRequest::setVar('active_tab', '2' );
			parent::display();
			return false;
			}
				
			if (!JHTML::_('phdhelper.phdCertificateExists',$applicant_id)){
			$mainframe->enqueueMessage( JText::_('NO_PHDCERT_RECORD') , 'error' );
			JRequest::setVar('active_tab', '2' );
			parent::display();
			return false;
			}
			}
			*/

		if (!JHTML::_('phdhelper.checkReferees',$applicant_id)){
			$mainframe->enqueueMessage( JText::_('NO_REFEREES') , 'error');
			JRequest::setVar('active_tab', '3' );
			parent::display();
			return false;
		}

		if (!JHTML::_('phdhelper.checkProgramme',$applicant_id)){
			$mainframe->enqueueMessage( JText::_('NO_PROGRAMMES') , 'error' );
			$active_tab = ($phdConfig_Application== '1')?5:6;
			JRequest::setVar('active_tab', $active_tab );
			parent::display();
			return false;
		}

		$model =& $this->getModel('applicant');
		$model->setId( $applicant_id );
		$applicant =& $model->getData();

		$now = JFactory::getDate();

		// send mails to referees
		/*foreach($applicant->referees as $referee)
		 {
			$message = new stdClass();
			$message->subject = $params->get('phdConfig_EmailRefereeSubject');
			$message->body = $params->get('phdConfig_EmailRefereeBody');
				
			$message_text = str_replace("#name#", $applicant->firstname . " " . $applicant->lastname, $message->body);
			$message_text = str_replace("#referee#", $referee->firstname . " " . $referee->lastname, $message_text);
			$message_text = str_replace("#link#", 'http://phd.gplavui.com/index.php?option=com_phd&view=referee&upload_code=' . $referee->upload_code, $message_text);
			// TODO
			//echo "route = " . JRoute::_('index.php?option=com_phd&view=referee&upload_code=' . $referee->upload_code);
			//break;
				
			$mailer =& JFactory::getMailer();

			$mailer->setSender(array($params->get('phdConfig_AdminEmail'), $params->get('phdConfig_AdminName')));
			$mailer->setSubject($message->subject);
			$mailer->setBody($message_text);
			$mailer->IsHTML(0);

			// Add recipients
			$mailer->addRecipient($referee->email);

			if ($mailer->Send())
			{
			// updating referee record with the code
			$data = array();
			$data['id'] = $referee->id;
			$data['sent_mail']= $now->toMySQL();
			$model->saveReferee($data);

			// saving the log record
			$log_model =& $this->getModel('log');
			$logdata = array();
			$logdata['applicant_id'] = $applicant_id;
			$logdata['text'] = $message_text;
			$logdata['old_status_id'] = 1;
			$logdata['new_status_id'] = 2;
			if (!$log_model->store($logdata)) {
			$mainframe->enqueueMessage( JText::_('LOG_STORE_KO') , 'error');
			parent::display();
			return false;
			}
			} else {
			$mainframe->enqueueMessage( JText::_('MAIL_UNCORRECTLY_SEND') , 'error');
			parent::display();
			return false;
			}
			}*/

		// updating applicants record
		JRequest::setVar('active_tab', '0' );
		if ($model->saveStatus(2)) {
			$mainframe->enqueueMessage( JText::_('SUBMIT_OK') );
			parent::display();
		} else {
			$mainframe->enqueueMessage( JText::_('SUBMIT_KO') , 'error');
			parent::display();
			return false;
		}

		return true;
	}

	/**
	 * 2013-11-22 SIBEOS Download file, Download selected file and log the process
	 *
	 * @return file
	 */
	function download_file()
	{
            global $mainframe, $mosConfig_live_site;
            $user =& JFactory::getUser();

            //get data from the request
            $get = JRequest::get( 'get' );

            $params =& $mainframe->getParams();
            $phdConfig_DocsPath = $params->get('phdConfig_DocsPath');

            $iamadministrator = JHTML::_('phdhelper.isAdministrator');
            $iamgroupleader = JHTML::_('phdhelper.isGroupLeader');
            $iamcommittee = JHTML::_('phdhelper.isCommittee');
           
            //$directory = "/var/data/docs_phd/";    // the relative directory that has the downloads - can be ./ for the current directory
            $filename = $get['file'];
            $person = $get['person'];

            $model =& JModel::getInstance( 'applicant', 'phdmodel' );
            $model->setId( $person );
            $applicant =& $model->getData();

            if (!($this->iamadministrator || $this->iamgroupleader || $this->iamcommittee || ($user->username == $applicant->user_username))):
                echo JText::_( 'ALERTNOTAUTH' );
		return;
            endif;            
            
            $path = $phdConfig_DocsPath."/".$applicant->directory."/".$filename;            
            
            //LOG all logins
            $user 	=& JFactory::getUser();
            $options = array('format' => "{DATE}\t{IP}\t{NAME}\t{FILENAME}\t{APPLICANT}");
            $ip_address = $_SERVER['REMOTE_ADDR'];
            $log_filename= "file_access-".date( 'M-Y').".log";
            $log = & JLog::getInstance($log_filename, $options);
            $log->addEntry(array("Date" => date('d-m-Y h:i'),"IP" => $ip_address,"Name"=>$user->name,"Filename"=>$filename,"Applicant"=>$applicant->lastname.', '.$applicant->firstname));
            //END LOG
                        
            header("Content-type: application/octet-stream"); 
            header("Content-Disposition: attachment; filename=$filename"); 
            header("Content-Length: ".filesize($path));
            readfile("$path");

        }        

	/**
	 * 2013-11-22 SIBEOS Create and download zip
	 *
	 * @return file
	 */        
        function create_zip()
	{
            global $mainframe, $mosConfig_live_site;

            //get data from the request
            $get = JRequest::get( 'get' );

            $params =& $mainframe->getParams();
            $phdConfig_DocsPath = $params->get('phdConfig_DocsPath');

            $applicant_id = $get['id'];
            $model =& JModel::getInstance( 'applicant', 'phdmodel' );
            $model->setId( $applicant_id );
            $applicant =& $model->getData();
            
            $sourcePath = $phdConfig_DocsPath."/".$applicant->directory;
          
            //$outZipPath = $phdConfig_DocsPath."/".$applicant_id."/".$applicant_id.'.zip';
            $outZipPath =  JPATH_ROOT . '/tmp/'.$applicant->directory.'.zip';
            //echo $outZipPath;
            

            $pathInfo = pathInfo($sourcePath); 
            $parentPath = $pathInfo['dirname']; 
            $dirName = $pathInfo['basename']; 

            $z = new ZipArchive(); 
            $z->open($outZipPath, ZIPARCHIVE::CREATE); 
            $z->addEmptyDir($dirName); 
            //self::folderToZip($sourcePath, $z, strlen("$parentPath/")); 

            $exclusiveLength = strlen("$parentPath/");
            $folder= $sourcePath;
            $zipFile= $z;

            $handle = opendir($folder); 
            while (false !== $f = readdir($handle)) { 
              if ($f != '.' && $f != '..') { 
                $filePath = "$folder/$f"; 
                // Remove prefix from file path before add to zip. 
                $localPath = substr($filePath, $exclusiveLength); 
                if (is_file($filePath)) { 
                  $zipFile->addFile($filePath, $localPath); 
                } elseif (is_dir($filePath)) { 
                  // Add sub-directory. 
                  $zipFile->addEmptyDir($localPath); 
                  self::folderToZip($filePath, $zipFile, $exclusiveLength); 
                } 
              } 
            } 
            closedir($handle);     

            $z->close();             
                
            //LOG all logins
            $user 	=& JFactory::getUser();
            $options = array('format' => "{DATE}\t{IP}\t{NAME}\t{FILENAME}\t{APPLICANT}");
            $ip_address = $_SERVER['REMOTE_ADDR'];
            $log_filename= "file_access-".date( 'M-Y').".log";
            $log = & JLog::getInstance($log_filename, $options);
            $log->addEntry(array("Date" => date('d-m-Y'),"IP" => $ip_address,"Name"=>$user->name,"Filename"=>$applicant->directory.'.zip',"Applicant"=>$applicant->lastname.', '.$applicant->firstname));
            //END LOG

            $filename = $applicant->directory.'.zip';
            header('Content-Description: File Transfer');
            header('Content-Type: application/x-zip-compressed');           
            header('Content-Disposition: attachment; filename='.$filename);
            header('Content-Transfer-Encoding: binary');
            header('Expires: 0');
            header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
            header('Pragma: public');
            header('Content-Length: ' . filesize($outZipPath));
//            ob_clean();
//            flush();
            readfile($outZipPath); 
            @unlink($outZipPath);
   
            /*header("Content-type: application/zip; filename=".$applicant->directory.".zip" ); 
            header("Content-Transfer-Encoding: base64"); 
            header("Content-Disposition: attachment; filename=".$applicant->directory.".zip"); 
            header("Content-Length: ".filesize($path));
            readfile("$path");*/
        }          
        
}

?>