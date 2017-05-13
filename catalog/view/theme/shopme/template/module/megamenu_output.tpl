<?php
$config = $this->registry->get('config'); 
require_once( DIR_TEMPLATE.$config->get('config_template')."/lib/module.php" );
$modules = new Modules($this->registry);
$mega_menu = $modules->getModules('mega_menu'); 
?>
<?php if (count($mega_menu)) { ?>
<?php foreach ($mega_menu as $module) { echo $module; } ?>
<?php } ?> 