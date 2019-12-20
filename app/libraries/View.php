<?php

class View
{
    public function loadPage($dir_name, $partial_name)
    {
        include './view/inc/header.php';
        include './view/'.$dir_name.'/'.$partial_name.'.php';
        include './view/inc/footer.php';
    }
}