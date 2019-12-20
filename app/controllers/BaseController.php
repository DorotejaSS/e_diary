<?php

class BaseController
{
    private $request;

    public function __construct($request)
    {
        $this->request = $request;
    }

    public function loadView($dir_name, $partial_name)
    {
        $view = new View();
        $view->loadPage($dir_name, $partial_name);
    }
}