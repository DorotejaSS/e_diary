<?php

    class AdminController extends BaseController 
    {
        protected $role_id = '1';

        public function __construct()
        {
           /***
            * Ova logika se nalazi u svakom kontroleru,
            * bilo bi dobro da se nekako ubaci u bazni kontroler, don't repeat yourself :)
            * Jedini problem bi bio AccessController ako sam dobro ukapirao, gde se korisnik loguje, ali tu jednostavno mozete da 
            * override-ujete logiku iz baznog kontrolera pa da se ne radi checkSession i checkRole
            */
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
        }
        
    }
