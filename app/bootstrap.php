<?php
// Load Config with params for DB
require_once 'config/config.php';   // TODO: change variables into constants
// Load routes which are allowed
require_once 'config/routes.php';
//Load autoloaders
require_once './app/config/autoloaders.php';


spl_autoload_register('autoloadLibs');
spl_autoload_register('autoloadModels');
spl_autoload_register('autoloadControllers');


