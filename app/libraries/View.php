<?php

class View
{
    public $data = array();
    
    public function loadPage($dir_name, $partial_name)
    {
        //include './app/views/inc/header.php';
        include './app/views/'.$dir_name.'/'.$partial_name.'.php';
        //include './app/views/inc/footer.php';
    }
}