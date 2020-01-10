<?php

    class ProfessorController extends BaseController 
    {
        protected $role_id = '3';

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
            $user = new User();
            $user->permissionTitles($this->role_id);
            var_dump($user->permissionTitles($this->role_id));
            $this->loadView('professor', 'index');
            $this->loadView('pages', 'welcome');
        }
        
    }
