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
<<<<<<< HEAD
                        
=======
            var_dump(1);
            // $this->db = Database ::getInstance()->getConnection();
>>>>>>> c38d94eb6ab9889419ff2e8b21f386a5b02f368b
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
