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
            // $this->db = Database ::getInstance()->getConnection();
        }

        public function homePage()
        {
            $user = new User();
            $user->permissionTitles($this->role_id);
            // var_dump($user->permissionTitles($this->role_id));
            $this->loadView('admin', 'index');
            $this->loadView('pages', 'welcome');
        }
        
    }
