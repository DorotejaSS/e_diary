<?php

    class AdminController extends BaseController {

        private $role_id = '1';

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
            $this->loadView('admin', 'index');
            $this->loadView('pages', 'welcome');
        }
        
    }
