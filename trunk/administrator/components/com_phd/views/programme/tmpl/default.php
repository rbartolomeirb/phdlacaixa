<?php defined('_JEXEC') or die('Restricted access'); ?>

<?php JHTML::_('behavior.tooltip'); ?>

<?php
// Set toolbar items for the page
$edit = JRequest::getVar('edit', true);
$text = !$edit ? JText::_( 'New' ) : JText::_( 'Edit' );
JToolBarHelper::title(   JText::_( 'Programme' ).': <small><small>[ ' . $text.' ]</small></small>' );
JToolBarHelper::save();
if (!$edit)  {
	JToolBarHelper::cancel();
} else {
	// for existing items the button is renamed `close`
	JToolBarHelper::cancel( 'cancel', 'Close' );
}
//JToolBarHelper::help( 'screen.weblink.edit' );
?>


<script language="javascript" type="text/javascript">
	function submitbutton(pressbutton) {
		var form = document.adminForm;
		if (pressbutton == 'cancel') {
			submitform( pressbutton );
			return;
		}

		// do field validation
		if (form.description.value == ""){
			alert( "<?php echo JText::_( 'Item must have a description', true ); ?>" );
		} else if (form.short_description.value == ""){
			alert( "<?php echo JText::_( 'Item must have a short description', true ); ?>" );
		} else {
			submitform( pressbutton );
		}
	}
</script>
<style type="text/css">
table.paramlist td.paramlist_key {
	width: 92px;
	text-align: left;
	height: 30px;
}
</style>

<form action="index.php" method="post" name="adminForm" id="adminForm">
<div class="col width-50">
<fieldset class="adminform"><legend><?php echo JText::_( 'Details' ); ?></legend>

<table class="admintable">
	<tr>
		<td width="100" align="right" class="key"><label for="title"> <?php echo JText::_( 'Description' ); ?>:
		</label></td>
		<td><input class="text_area" type="text" name="description"
			id="description" size="50" maxlength="100"
			value="<?php echo $this->item->description;?>" /></td>
	</tr>
	<tr>
		<td width="100" align="right" class="key"><label for="alias"> <?php echo JText::_( 'Short description' ); ?>:
		</label></td>
		<td><input class="text_area" type="text" name="short_description"
			id="short_description" size="20" maxlength="50"
			value="<?php echo $this->item->short_description;?>" /></td>
	</tr>
	<tr>
		<td width="100" align="right" class="key"><label for="alias"> <?php echo JText::_( 'Responsible username' ); ?>:
		</label></td>
		<td><input class="text_area" type="text" name="user_username"
			id="user_username" size="10" maxlength="150"
			value="<?php echo $this->item->user_username;?>" /></td>
	</tr>
	<tr>
		<td width="100" align="right" class="key"><label for="alias"> <?php echo JText::_( 'Order' ); ?>:
		</label></td>
		<td><input class="text_area" type="text" name="order" id="order"
			size="4" maxlength="4" value="<?php echo $this->item->order;?>" /></td>
	</tr>
</table>
</fieldset>
</div>
<input type="hidden" name="option" value="com_phd" /> <input
	type="hidden" name="controller" value="programme" /> <input
	type="hidden" name="task" value="" /> <input type="hidden" name="id"
	value="<?php echo $this->item->id; ?>" /> <?php echo JHTML::_( 'form.token' ); ?>
</form>
