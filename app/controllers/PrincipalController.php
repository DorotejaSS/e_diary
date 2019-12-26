<?php

class PrincipalController extends BaseController
{
    private $role_id = '2';

    public function __construct()
    {
        $this->checkSession();
       
        if ($this->checkRole($this->role_id) === false)
        {
            echo 'NEMAS PRISTUP!';
            exit;
        }
    }

    public function homePage()
    {
        $view = new View();
        $view->loadPage('principal', 'index');
        $view->loadPage('pages', 'welcome');
        
    }
}