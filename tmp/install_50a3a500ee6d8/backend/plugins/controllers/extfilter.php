<?php
/**
 * @package AkeebaBackup
 * @copyright Copyright (c)2009-2012 Nicholas K. Dionysopoulos
 * @license GNU General Public License version 3, or later
 *
 * @since 2.1
 */

// Protect from unauthorized access
defined('_JEXEC') or die();

/**
 * Extension Filter controller class
 *
 */
class AkeebaControllerExtfilter extends FOFController
{
	public function  __construct($config = array()) {
		parent::__construct($config);
		// Access check, Joomla! 1.6 style.
		$user = JFactory::getUser();
		if (!$user->authorise('akeeba.configure', 'com_akeeba')) {
			$this->setRedirect('index.php?option=com_akeeba');
			return JError::raiseWarning(403, JText::_('JERROR_ALERTNOAUTHOR'));
			$this->redirect();
		}
		$base_path = JPATH_COMPONENT_ADMINISTRATOR.'/plugins';
		$model_path = $base_path.'/models';
		$view_path = $base_path.'/views';
		$this->addModelPath($model_path);
		$this->addViewPath($view_path);
	}

	public function execute($task) {
		if(!in_array($task, array(
				'components','languages','modules','plugins','templates',
				'toggleComponent','toggleLanguage','toggleModule',
				'togglePlugin','toggleTemplate'
			))) {
			$task = 'components';
		}
		parent::execute($task);
	}
	
	/**
	 * Components task, shows all non-core components
	 */
	function components($cachable = false, $urlparams = false)
	{
		$this->getThisView()->setLayout('components');
		$this->getThisView()->assign('task', 'components');
		parent::display($cachable, $urlparams);
	}

	/**
	 * Languages task, shows all languages except the default
	 */
	function languages($cachable = false, $urlparams = false)
	{
		$this->getThisView()->setLayout('languages');
		$this->getThisView()->assign('task', 'languages');
		parent::display($cachable, $urlparams);
	}

	/**
	 * Modules task, shows all non-core modules
	 */
	function modules($cachable = false, $urlparams = false)
	{
		$this->getThisView()->setLayout('modules');
		$this->getThisView()->assign('task', 'modules');
		parent::display($cachable, $urlparams);
	}

	/**
	 * Plugins task, shows all non-core plugins
	 */
	function plugins($cachable = false, $urlparams = false)
	{
		$this->getThisView()->setLayout('plugins');
		$this->getThisView()->assign('task', 'plugins');
		parent::display($cachable, $urlparams);
	}

	/**
	 * Templates task, shows all non-core templates
	 */
	function templates($cachable = false, $urlparams = false)
	{
		$this->getThisView()->setLayout('templates');
		$this->getThisView()->assign('task', 'templates');
		parent::display($cachable, $urlparams);
	}

	/**
	 * Toggles the exclusion of a component
	 *
	 */
	function toggleComponent()
	{
		//JResponse::setHeader('Cache-Control','no-cache, must-revalidate',true); // HTTP 1.1 - Cache control
		//JResponse::setHeader('Expires','Sat, 26 Jul 1997 05:00:00 GMT',true); // HTTP 1.0 - Date in the past

		// Get the option passed along
		$root = FOFInput::getString('root', 'default', $this->input);
		$item = FOFInput::getString('item', '', $this->input);

		// Try to figure out if this component is allowed to be excluded (exists and is non-Core)
		$model = $this->getThisModel();
		$components = $model->getComponents();

		$found = false;
		$numRows = count($components);
		for($i=0;$i < $numRows; $i++)
		{
			$row = $components[$i];
			if($row['item'] == $item) {
				$found = true;
				$name = $row['name'];
			}
		}

		$link = JURI::base().'index.php?option=com_akeeba&view=extfilter&task=components';
		if(!$found)
		{
			$msg = JText::sprintf('EXTFILTER_ERROR_INVALIDCOMPONENT', $item);
			$this->setRedirect( $link, $msg, 'error' );
		}
		else
		{
			$model->toggleComponentFilter($root, $item);
			$link = JURI::base().'index.php?option=com_akeeba&view=extfilter&task=components';
			$msg = JText::sprintf('EXTFILTER_MSG_TOGGLEDCOMPONENT', $name);
			$this->setRedirect( $link, $msg );
		}

		parent::redirect();
	}

	/**
	 * Toggles the exclusion of a module
	 *
	 */
	function toggleModule()
	{
		//JResponse::setHeader('Cache-Control','no-cache, must-revalidate',true); // HTTP 1.1 - Cache control
		//JResponse::setHeader('Expires','Sat, 26 Jul 1997 05:00:00 GMT',true); // HTTP 1.0 - Date in the past

		// Get the option passed along
		$root = FOFInput::getString('root', 'frontend', $this->input);
		$item = FOFInput::getString('item', '', $this->input);


		// Try to figure out if this component is allowed to be excluded (exists and is non-Core)
		$model = $this->getThisModel();
		$modules = $model->getModules();

		$found = false;
		$numRows = count($modules);
		for($i=0; $i < $numRows; $i++)
		{
			$row = $modules[$i];
			if( ($row['item'] == $item) && ($row['root'] == $root) ) {
				$found = true;
				$name = $row['name'];
				break;
			}
		}

		$link = JURI::base().'index.php?option=com_akeeba&view=extfilter&task=modules';
		if(!$found)
		{
			$msg = JText::sprintf('EXTFILTER_ERROR_INVALIDMODULE', $item);
			$this->setRedirect( $link, $msg, 'error' );
		}
		else
		{
			$model->toggleModuleFilter($root, $item);
			$msg = JText::sprintf('EXTFILTER_MSG_TOGGLEDMODULE', $name);
			$this->setRedirect( $link, $msg );
		}

		parent::redirect();
	}

	/**
	 * Toggles the exclusion of a language
	 *
	 */
	function toggleLanguage()
	{
		//JResponse::setHeader('Cache-Control','no-cache, must-revalidate',true); // HTTP 1.1 - Cache control
		//JResponse::setHeader('Expires','Sat, 26 Jul 1997 05:00:00 GMT',true); // HTTP 1.0 - Date in the past

		// Get the option passed along
		$root = FOFInput::getString('root', '', $this->input);
		$item = FOFInput::getString('item', '', $this->input);


		// Try to figure out if this component is allowed to be excluded (exists and is non-Core)
		$model = $this->getThisModel();
		$languages = $model->getLanguages();

		$found = false;
		$numRows = count($languages);
		for($i=0; $i < $numRows; $i++)
		{
			$row = $languages[$i];
			if( ($row['item'] == $item) && ($row['root'] == $root) ) {
				$found = true;
				$name = $row['name'];
				break;
			}
		}

		$link = JURI::base().'index.php?option=com_akeeba&view=extfilter&task=languages';
		if(!$found)
		{
			$msg = JText::sprintf('EXTFILTER_ERROR_INVALIDLANGUAGE', $item);
			$this->setRedirect( $link, $msg, 'error' );
		}
		else
		{
			$model->toggleLanguageFilter($root, $item);
			$msg = JText::sprintf('EXTFILTER_MSG_TOGGLEDLANGUAGE', $name);
			$this->setRedirect( $link, $msg );
		}

		parent::redirect();
	}

	/**
	 * Toggles the exclusion of a plugin
	 *
	 */
	function togglePlugin()
	{
		//JResponse::setHeader('Cache-Control','no-cache, must-revalidate',true); // HTTP 1.1 - Cache control
		//JResponse::setHeader('Expires','Sat, 26 Jul 1997 05:00:00 GMT',true); // HTTP 1.0 - Date in the past

		// Get the option passed along
		$root = FOFInput::getString('root', '', $this->input);
		$item = FOFInput::getString('item', '', $this->input);


		// Try to figure out if this component is allowed to be excluded (exists and is non-Core)
		$model = $this->getThisModel();
		$plugins = $model->getPlugins();

		$found = false;
		$numRows = count($plugins);
		for($i=0; $i < $numRows; $i++)
		{
			$row = $plugins[$i];
			if( ($row['item'] == $item) && ($row['root'] == $root) ) {
				$found = true;
				$name = $row['name'];
				break;
			}
		}

		if(!$found)
		{
			$link = JURI::base().'index.php?option=com_akeeba&view=extfilter&task=plugins';
			$msg = JText::sprintf('EXTFILTER_ERROR_INVALIDPLUGIN', $item);
			$this->setRedirect( $link, $msg, 'error' );
		}
		else
		{
			$model->togglePluginFilter($root, $item);
			$link = JURI::base().'index.php?option=com_akeeba&view=extfilter&task=plugins';
			$msg = JText::sprintf('EXTFILTER_MSG_TOGGLEDPLUGIN', $name);
			$this->setRedirect( $link, $msg );
		}

		parent::redirect();
	}

	/**
	 * Toggles the exclusion of a template
	 *
	 */
	function toggleTemplate()
	{
		//JResponse::setHeader('Cache-Control','no-cache, must-revalidate',true); // HTTP 1.1 - Cache control
		//JResponse::setHeader('Expires','Sat, 26 Jul 1997 05:00:00 GMT',true); // HTTP 1.0 - Date in the past

		// Get the option passed along
		$root = FOFInput::getString('root', '', $this->input);
		$item = FOFInput::getString('item', '', $this->input);

		// Try to figure out if this component is allowed to be excluded (exists and is non-Core)
		$model = $this->getThisModel();
		$templates = $model->getTemplates();

		$found = false;
		$numRows = count($templates);
		for($i=0; $i < $numRows; $i++)
		{
			$row = $templates[$i];
			if( ($row['item'] == $item) && ($row['root'] == $root) ) {
				$found = true;
				$name = $row['name'];
				break;
			}
		}

		$link = JURI::base().'index.php?option=com_akeeba&view=extfilter&task=templates';
		if(!$found)
		{
			$msg = JText::sprintf('EXTFILTER_ERROR_INVALIDTEMPLATE', $item);
			$this->setRedirect( $link, $msg, 'error' );
		}
		else
		{
			$model->toggleTemplateFilter($root, $item);
			$msg = JText::sprintf('EXTFILTER_MSG_TOGGLEDTEMPLATE', $name);
			$this->setRedirect( $link, $msg );
		}

		parent::redirect();
	}

}