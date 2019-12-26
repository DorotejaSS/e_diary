<?php

    class AdminController extends BaseController {

        private $role_id='1';

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
            $view->loadPage('admin', 'index');
            $view->loadPage('pages', 'welcome');
        }

        
    }
