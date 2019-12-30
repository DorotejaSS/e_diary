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

        public function roles()
        {
            
            $base_model = new BaseModel();
            $base_model->showAll('roles');
            $view = new View();
            $view->data = $_SESSION['roles'];
            $view->loadPage('admin', 'roles');
        }

        public function roleAdd()
        {
            $this->loadView('admin', 'roleadd');
            if (!empty($_POST['role']) && isset($_POST['submit'])) {
                $role_permission = new RolePermission();
                $role_permission->addRole($_POST['role']);
                header('Location: /roles');
            }
            
        }

        public function roleEdit()
        {
            $this->loadView('admin');
        }

        public function roleDelete()
        {
            var_dump($_SESSION['role_id']);
           
            $role_permission = new RolePermission();
            $role_permission->deleteRole();
        }

        public function permissions()
        {
            $this->loadView('admin', 'permissions');
        }

        
    }
