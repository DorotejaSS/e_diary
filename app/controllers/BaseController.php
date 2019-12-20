<?php
// bazni kontroler koji nasledjuju ostali, iz njega pozivamo view izmedju ostalog za sad
class BaseController
{
    private $request;

    public function __construct($request)
    {
        $this->request = $request;
        var_dump($this->request);
    }

    public function loadView($dir_name, $partial_name)
    {
        $view = new View();
        $view->loadPage($dir_name, $partial_name);
    }
}