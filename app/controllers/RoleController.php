<?php

class RoleController extends BaseController
{
    protected $role_id = '1';
    
    public function __construct($request)
    {
        $this->request = $request;
        $this->checkSession();
        if ($this->checkRole($this->role_id) === false)
        {
            echo 'NEMAS PRISTUP!';
            exit;
        }
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
        $view = new View();
        $view->loadPage('admin', 'roleadd');
    
        if (!empty($this->request->post_params['role']) && isset($this->request->post_params['submit'])) {
            $role = new Role();
            $role->addRole($this->request->post_params['role']);
            header('Location: /roles');
        }   
    }

    public function roleEdit()
    {
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $base_model->getOne('roles', $id);

        $view = new View();
        $view->data = $base_model->getOne('roles', $id)[0];
        $view->loadPage('admin', 'roleedit');

        if (isset($this->request->post_params['submit'])) {
            $base_model->edit('roles', $this->request->post_params['role'], $id);
            header('Location: /roles');
        }
    }

    public function roleDelete()
    {
        $id = $this->request->url_parts[1];
        $base_model = new BaseModel();
        $base_model->delete('roles', $id);
        header('Location: /roles');
    }
}