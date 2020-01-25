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
            
                        
        }

        public function homePage()
        {
            $user = new User();
            $user->permissionTitles($this->role_id);
            // var_dump($user->permissionTitles($this->role_id));
            $this->loadView('admin', 'index');
<<<<<<< HEAD
            // $this->loadView('pages', 'welcome');
=======
>>>>>>> 285d27a69272a5cc48a8ccd3a6e37820103aa988
        }
        
    }
