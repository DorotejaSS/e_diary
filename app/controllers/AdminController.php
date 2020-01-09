<?php

    class AdminController extends BaseController 
    {
        protected $role_id = '1';

        public function __construct()
        {
            $this->checkSession();
            if ($this->checkRole($this->role_id) === false)
            {
                echo 'NEMAS PRISTUP!';
                exit;
            }
            var_dump(1);
        }

        public function homePage()
        {
            $this->loadView('admin', 'index');
            $this->loadView('pages', 'welcome');
        }
        
    }
