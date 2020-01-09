<?php

class PrincipalController extends BaseController
{
    protected $role_id = '2';

    public function __construct()
    {
        $this->checkSession();
       
        if ($this->checkRole($this->role_id) === false)
        {
            echo 'NEMAS PRISTUP!';
            exit;
        }
        var_dump(2);
    }

    public function homePage()
    {
        $view = new View();
        $view->loadPage('principal', 'index');
        $view->loadPage('pages', 'welcome');
        
    }
}