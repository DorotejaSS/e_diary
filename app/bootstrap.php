<?php
// Load Config
require_once 'config/config.php';   // TODO: change variables into constants
// Load routes which are allowed
require_once 'config/routes.php';
//Load autoloaders
require_once './app/helpers/autoloaders.php';



spl_autoload_register('autoloadLibs');
spl_autoload_register('autoloadModels');
spl_autoload_register('autoloadControllers');


