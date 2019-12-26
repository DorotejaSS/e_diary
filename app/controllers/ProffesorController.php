<?php

    class ProffesorController extends BaseController {

        private $role_id='3';

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
            $view->loadPage('proffesor', 'index');
             $view->loadPage('pages', 'welcome');
        }

        
    }
