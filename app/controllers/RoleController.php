<?php

class RoleController extends BaseController
{
    public function __construct()
    {

    }

    public function roles()
    {
        $base_model = new BaseModel();
        $base_model->showAll('roles');

        $view = new View();
        $view->data = $base_model->showAll('roles');
        $view->loadPage('admin', 'roles');
    }

    public function roleAdd()
    {
        $this->loadView('admin', 'roleadd');
        if (!empty($_POST['role']) && isset($_POST['submit'])) {
            $role = new Role();
            $role->addRole($_POST['role']);
            header('Location: /roles');
        }   
    }

    public function getOne()
    {
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];

        $base_model = new BaseModel();
        $base_model->getOne('roles', $id);

        $view = new View();
        $view->data = $base_model->getOne('roles', $id)[0];
        $view->loadPage('admin', 'showonerole');
    }

    public function roleEdit()
    {
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];
        
        $base_model = new BaseModel();
        $base_model->getOne('roles', $id);

        $view = new View();
        $view->data = $base_model->getOne('roles', $id)[0];
        $view->loadPage('admin', 'roleedit');

        if (isset($_POST['submit'])) {
            $role = new Role();
            $role->edit($id);
            header('Location: /roles');
        }
    }

    public function roleDelete()
    {  
        $id = explode('/',$_REQUEST['path']);
        $id = $id[1];
      
        $role = new Role();
        $role->delete($id);
        header('Location: /roles');
    }
}