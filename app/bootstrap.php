<?php
// Load Config
require_once 'config/config.php';
// Load routes which are allowed
require_once 'config/routes.php';
//Load Helpers
require_once 'helpers/url_helper.php';
require_once './app/helpers/autoloaders.php';
//require_once 'helpers/session_helper.php';

spl_autoload_register('autoloadLibs');
spl_autoload_register('autoloadModels');
spl_autoload_register('autoloadControllers');


