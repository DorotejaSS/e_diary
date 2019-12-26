<?php

class PrincipalController extends BaseController
{
    public function __construct()
    {
        $this->checkSession();
    }

    public function homePage()
    {
        $view = new View();
        $view->loadPage('principal', 'index');
        $view->loadPage('pages', 'welcome');
        
    }
}