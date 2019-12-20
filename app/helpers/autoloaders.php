<?php

function autoloadLibs($class) {
    //require the general classes
    e_diary_autoloader('libraries', $class);
}

function autoloadModels($class) {
    //require the models classes
    e_diary_autoloader('models', $class);
}

function autoloadControllers($class) {
    //require the controllers classes
    e_diary_autoloader('controllers', $class);
}

function e_diary_autoloader($autoloader_directory, $class)
{
    if (file_exists('./app/'.$autoloader_directory.'/' . $class . '.php')) {
        include './app/'.$autoloader_directory.'/' . $class . '.php';
    }
}